`timescale 1ns / 100ps

/*
 * This synz generator is used as test module that can be initiated and
 * generate an internal sync signal. This sync signal can be used to validate
 * the behaviour of the gate driver module.
 */

import mem_map_pkg::*;

module sync_generator #(

)
(
    input   logic clk,                          // Clock signal
    input   logic rst_n,                        // reset, active low
    input   logic [C_DATA_WIDTH-1:0]gen_ctrl,   // Control word
    output  logic [C_DATA_WIDTH-1:0]gen_status, // Status word
    output  logic sync_signal,                  // Generated sync signal
    output  logic sync_signal_n                 // Generated sync signal
);
    

    // Local parameters
    localparam C_STATE_INDEX_LEN = 8;
    localparam C_STATE_INDEX_WIDTH = $clog2(C_STATE_INDEX_LEN);
    localparam C_CNT_WIDTH = 32;
    localparam C_DATA_WIDTH = 32;
    localparam C_ON_CNT = 9;
    localparam C_IDLE_CNT = 50;

    // Typedef definitions
    typedef enum bit[4:0] {ERR      = 5'b00001,
                           STOP     = 5'b00010,
                           IDLE     = 5'b00100,
                           ON       = 5'b01000,
                           DELAY    = 5'b10000} state_t;
    typedef enum bit {UNSET = 1'b0, SET = 1'b1} gen_ctrl_t;

    // Logic definitions
    state_t state_q, state_d;
    logic [C_GEN_STATUS_RUN_MODE_SIZE-1:0] run_mode_d, run_mode_q;
    logic [C_CNT_WIDTH-1 : 0] delay_cnt_d, delay_cnt_q;
    logic [C_CNT_WIDTH-1 : 0] on_cnt_d, on_cnt_q;
    logic [C_CNT_WIDTH-1 : 0] idle_cnt_d, idle_cnt_q;
    logic [C_STATE_INDEX_WIDTH-1 : 0] index_d, index_q;
    logic [C_DATA_WIDTH-1 : 0] sync_delay_settings[C_STATE_INDEX_LEN-1 : 0];
    logic sync_d, sync_q;
    logic delay_cnt_msb;
    logic on_cnt_msb;
    logic idle_cnt_msb;
    logic sync_select;
    gen_ctrl_t GEN_START, GEN_STOP;
    logic async_reset_n;


    // Assignemnts
    assign delay_cnt_msb = delay_cnt_q[C_CNT_WIDTH-1];
    assign on_cnt_msb = on_cnt_q[C_CNT_WIDTH-1];
    assign idle_cnt_msb = idle_cnt_q[C_CNT_WIDTH-1];

    assign GEN_START    = (gen_ctrl[C_GEN_CTRL_RUN_OFFSET+C_GEN_CTRL_RUN_SIZE-1:C_GEN_CTRL_RUN_OFFSET] == C_GEN_CTRL_START) ? SET: UNSET;
    assign GEN_STOP     = (gen_ctrl[C_GEN_CTRL_RUN_OFFSET+C_GEN_CTRL_RUN_SIZE-1:C_GEN_CTRL_RUN_OFFSET] == C_GEN_CTRL_STOP) ? SET: UNSET;

    assign sync_signal  = (sync_select == SET) ? sync_q: 1'b0;
    assign sync_signal_n = ~sync_signal;


    generate
        initial begin
            sync_delay_settings[0]  = 32'h000001f6;
            sync_delay_settings[1]  = 32'h00004bca;
            sync_delay_settings[2]  = 32'h00000228;
            sync_delay_settings[3]  = 32'h0000dbd0;
            sync_delay_settings[4]  = 32'h000001f6;
            sync_delay_settings[5]  = 32'h00004bca;
            sync_delay_settings[6]  = 32'h00000228;
            sync_delay_settings[7]  = 32'h0000dbd0;

        end
    endgenerate

    // Instances
    async_reset #(
    ) async_reset_instance(
        .clk(clk),
        .asyncrst_n(rst_n),
        .rst_n(async_reset_n)
    );

    always @(posedge clk or negedge async_reset_n)
    begin
        if (!async_reset_n) begin
            state_q <= STOP;
            delay_cnt_q <= 0;
            on_cnt_q <= 0;
            index_q <= 0;
            idle_cnt_q <= C_IDLE_CNT;
            run_mode_q <= 'b0;
        end else begin
            state_q <= state_d;
            delay_cnt_q <= delay_cnt_d;
            on_cnt_q <= on_cnt_d;
            index_q <= index_d;
            idle_cnt_q <= idle_cnt_d;
            run_mode_q <= run_mode_d;
        end
    end

    always @(*)
    begin
        state_d = state_q;
        on_cnt_d = on_cnt_q;
        delay_cnt_d = delay_cnt_q;
        index_d = index_q;
        sync_d = sync_q;
        idle_cnt_d = idle_cnt_q;
        run_mode_d = run_mode_q;

        case (state_q)
            ERR:
                begin
                    on_cnt_d = 0;
                    delay_cnt_d = 0;
                end
            STOP:
                begin
                    idle_cnt_d = C_IDLE_CNT;
                    index_d = 0;
                    run_mode_d = C_GEN_STATUS_RUN_MODE_STOPPED;

                    if (GEN_START == SET) begin
                        state_d = IDLE;
                    end
                end
            IDLE:
                begin
                    idle_cnt_d = idle_cnt_q - 1;
                    if (idle_cnt_msb == 1'b1) begin
                        state_d = ON;
                        on_cnt_d = C_ON_CNT;
                        delay_cnt_d = sync_delay_settings[index_q];
                        run_mode_d = C_GEN_STATUS_RUN_MODE_RUNNING;
                    end
                end
            ON:
                begin
                    on_cnt_d = on_cnt_q - 1;
                    sync_d = 1'b1;
                    if (GEN_STOP == SET) begin
                        state_d = STOP;
                    end
                    else if (on_cnt_msb == 1'b1) begin
                        state_d = DELAY;
                        on_cnt_d = C_ON_CNT;
                        sync_d = 0;
                        delay_cnt_d = sync_delay_settings[index_q];
                    end
                end
            DELAY:
                begin
                    delay_cnt_d = delay_cnt_q - 1;

                    if (GEN_STOP == SET) begin
                        state_d = STOP;
                    end
                    else if (delay_cnt_msb == 1'b1) begin
                        state_d = ON;
                        index_d = (index_q + 1) % C_STATE_INDEX_LEN;
                    end
                end
        default:
            begin
                state_d = ERR;
            end
        endcase
    end

    always @(posedge clk or negedge async_reset_n)
    begin
        if (!async_reset_n) begin
            sync_select <= 1'b0;
            sync_q <= 1'b0;
            gen_status = 'b0;
        end
        else begin
            if (GEN_START == SET) begin
                sync_select <= SET;
            end
            if (GEN_STOP == SET)  begin
                sync_select <= UNSET;
            end
            sync_q = sync_d;
            gen_status[C_GEN_STATUS_RUN_MODE_OFFSET+C_GEN_STATUS_RUN_MODE_SIZE-1 : C_GEN_STATUS_RUN_MODE_OFFSET] = run_mode_q;
        end
    end

endmodule
