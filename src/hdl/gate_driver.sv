`timescale 1ns / 100ps

/*
 * The gate driver module implements the mapping towards the driver transistors
 * that transfers energy on the loop.
 * The gate driver is triggered by the pulse sync signal from the TS, on each
 * received TS signal it is evaluated if the sync signal arrives within a valid
 * time slot window. If the sync arrives outside this window, the gate driver
 * will enter an error state and set the control signal for the transistors in
 * a fixed error state that doesn't moves power onto the loop.
 * As long the sync signals arrive within the time window a new set of
 * constatnts are loaded from embedded memory (BRAM), where a pair of
 * transistor control values and delay until next sync signal is present.
 */

import gatedriver_pkg::*;
import mem_map_pkg::*;
import axi4lite_pkg::*;

module gate_driver # (
   
)
(
    // System clock domain
    input logic clk,                                // Clock signal
    input logic rst_n,                              // Reset, active low
    input logic [C_DATA_WIDTH-1:0] doutb,           // Output word from BRAM
    input logic [C_DATA_WIDTH-1:0] ctrl_reg,        // Control register
    output logic [C_BRAM_REG_ADDR_BITS-1:0] addrb,  // Addres to read from BRAM region
    output logic [C_DATA_WIDTH-1:0] status,         // Status register
    output logic enb,                               // BRAM enable signal
    output logic regceb,                            // BRAM output register enable
    output logic mode,                              // Mode indicator, inactive or active. Active is when loacked with sync pulse

    // External clock domain
    input logic sync,                               // Sync pulse from TS
    output logic gate_output_pin[C_GATEDRIVE_WIDTH] // Driver for resistor gates
);

    // Local parameters
    localparam NUM_STAGES = 3;
    localparam C_COUNT_SIZE = 25;

    // Typedef definitions
    typedef enum logic[8:0] {ERR = 9'b000000001,
                             STOP,
                             FETCH_DELAY_WS,
                             FETCH_DELAY,
                             FETCH_VALUE_WS,
                             FETCH_VALUE,
                             SYNC_WAIT,
                             FETCH_NUMBER_OF_IDS_WS,
                             FETCH_NUMBER_OF_IDS} state_t;
    typedef enum bit {DELAY = 1'b0, GATE = 1'b1} idx_lsb_t;     // Selector for either the delay value until next sync pulse or gate value to control the gate transistors
    typedef enum bit {INACTIVE = 1'b0, ACTIVE = 1'b1} mode_status_t;
    typedef enum bit {UNSET = 1'b0, SET = 1'b1} gd_ctrl_t;

    // Logic definitions
    state_t state_q, state_d;
    logic [C_STATUS_RUN_MODE_SIZE-1:0] run_mode_d, run_mode_q;
    idx_lsb_t idx_lsb_q, idx_lsb_d;
    logic [C_COUNT_SIZE-1 : 0] delay_cnt_q, delay_cnt_d;
    logic [C_IDX_SIZE-1 : 0] idx_msb_q, idx_msb_d;
    logic [C_GATEDRIVE_WIDTH-1 : 0] value_q, value_d;
    logic [C_NO_OF_ID_SIZE-1 : 0] no_of_idx_d, no_of_idx_q;
    logic mon_time_q, mon_time_d;
    logic reset_output_q, reset_output_d;
    logic RUN;
    logic SYNC_TOO_LATE;
    logic ssync;
    logic [NUM_STAGES:1] sync_reg;

    logic gate_output[C_GATEDRIVE_WIDTH];
    gd_ctrl_t GD_RUN, GD_RESET, GD_STOP;
    logic async_reset_n;

    // Assignemnts
    assign enb = 1'b1;      // BRAM enable fixed
    assign regceb = 1'b1;   // BRAM output register enable fixed
    assign addrb = {idx_msb_q, idx_lsb_q};  // Concatination of idx and idx_lsb generates the full address word for reading a specific entry from the BRAM
    assign GD_RUN   = (ctrl_reg[C_CONTROL_RUN_OFFSET+C_CONTROL_RUN_SIZE-1:C_CONTROL_RUN_OFFSET] == C_CTRL_RUN) ? SET: UNSET;
    assign GD_RESET = (ctrl_reg[C_CONTROL_RUN_OFFSET+C_CONTROL_RUN_SIZE-1:C_CONTROL_RUN_OFFSET] == C_CTRL_RESET) ? SET: UNSET;
    assign GD_STOP  = (ctrl_reg[C_CONTROL_RUN_OFFSET+C_CONTROL_RUN_SIZE-1:C_CONTROL_RUN_OFFSET] == C_CTRL_STOP) ? SET: UNSET;
    assign SYNC_TOO_LATE = delay_cnt_q[C_COUNT_SIZE-1];

    // Instances
    async_reset #(
    ) async_reset_instance(
        .clk(clk),
        .asyncrst_n(rst_n),
        .rst_n(async_reset_n)
    );

    generate
        genvar i;
        for (i = 0; i < C_GATEDRIVE_WIDTH; i++) begin
            assign gate_output_pin[i] = gate_output[i] ? 1'b0 : 1'bZ;
        end
    endgenerate

    always @(posedge clk or negedge async_reset_n)
    begin
        if (!async_reset_n) begin
            state_q <= STOP;
            delay_cnt_q <= 0;
            idx_msb_q <= 0;
            value_q <= C_GATE_IDLE_VALUE;
            mon_time_q <= 0;
            idx_lsb_q <= DELAY;
            reset_output_q <= 1'b1;
            run_mode_q <= C_STATUS_RUN_MODE_RESET;
            no_of_idx_q <= 0;
        end
        else begin
            state_q <= state_d;
            delay_cnt_q <= delay_cnt_d;
            idx_msb_q <= idx_msb_d;
            value_q <= value_d;
            mon_time_q <= mon_time_d;
            idx_lsb_q <= idx_lsb_d;
            reset_output_q <= reset_output_d;
            run_mode_q <= run_mode_d;
            no_of_idx_q <= no_of_idx_d;
        end
    end

    always @(*)
    begin
        state_d = state_q;
        delay_cnt_d = delay_cnt_q;
        idx_msb_d = idx_msb_q;
        value_d = value_q;
        mon_time_d = mon_time_q;
        idx_lsb_d = idx_lsb_q;
        reset_output_d = reset_output_q;
        run_mode_d = run_mode_q;
        no_of_idx_d = no_of_idx_q;

        case (state_q)
        ERR:
            begin
                run_mode_d = C_STATUS_RUN_MODE_ERR;
                value_d = C_GATE_IDLE_VALUE;
                reset_output_d = 1'b1;
                idx_msb_d = 0;
                if (GD_RESET == SET) begin
                    state_d = STOP;
                end
            end
        STOP:
            begin
                run_mode_d = C_STATUS_RUN_MODE_STOPPED;
                delay_cnt_d = 0;
                value_d = C_GATE_IDLE_VALUE;
                mon_time_d = 1'b0;
                idx_lsb_d = DELAY;
                reset_output_d = 1'b1;
                if (GD_RUN == SET) begin
                    state_d = FETCH_NUMBER_OF_IDS_WS;
                    idx_msb_d = 1;      // Set to offset for first value pair containing delay and gate values
                end
                if (ssync == 1'b1) begin
                    state_d = ERR;
                end
            end
        FETCH_NUMBER_OF_IDS_WS:
            begin
                if (ssync == 1'b1) begin
                    state_d = ERR;
                end
                else if (GD_STOP == SET) begin
                    state_d = STOP;
                end
                else begin
                    state_d = FETCH_NUMBER_OF_IDS;
                end
            end
        FETCH_NUMBER_OF_IDS:
            begin
                no_of_idx_d = doutb[C_NO_OF_ID_OFFSET+C_NO_OF_ID_SIZE-1 : C_NO_OF_ID_OFFSET];
                if (ssync == 1'b1 || doutb[C_NO_OF_ID_OFFSET+C_NO_OF_ID_SIZE-1 : C_NO_OF_ID_OFFSET] == {C_NO_OF_ID_SIZE{1'b0}}) begin
                    state_d = ERR;
                end
                else if (GD_STOP == SET) begin
                    state_d = STOP;
                end
                else begin
                    state_d = FETCH_DELAY_WS;
                    run_mode_d = C_STATUS_RUN_MODE_ARMED;
                end
            end
        FETCH_DELAY_WS:
            begin
                if (ssync == 1'b1) begin
                    state_d = ERR;
                end
                else if (GD_STOP == SET) begin
                    state_d = STOP;
                end
                else begin
                    state_d = FETCH_DELAY;
                    idx_lsb_d = GATE;
                end
            end
        FETCH_DELAY:
            begin
                if (ssync == 1'b1) begin
                    state_d = ERR;
                end
                else if (GD_STOP == SET) begin
                    state_d = STOP;
                end
                else begin
                    state_d = FETCH_VALUE_WS;
                    delay_cnt_d = doutb;
                end
            end
        FETCH_VALUE_WS:
            begin
                if (ssync == 1'b1) begin
                    state_d = ERR;
                end
                else if (GD_STOP == SET) begin
                    state_d = STOP;
                end
                else begin
                    state_d = FETCH_VALUE;
                    idx_lsb_d = DELAY;
                    idx_msb_d = ((idx_msb_q) % no_of_idx_q) + 1;
                end
            end
        FETCH_VALUE:
            begin
                if (ssync == 1'b1) begin
                    state_d = ERR;
                end
                else if (GD_STOP == SET) begin
                    state_d = STOP;
                end
                else begin
                    state_d = SYNC_WAIT;
                    value_d = doutb;
                end
            end
        SYNC_WAIT:
            begin
                if (ssync == 1'b1) begin
                    reset_output_d = 1'b0;
                    run_mode_d = C_STATUS_RUN_MODE_RUNNING;
                    mon_time_d = 1'b1;
                    state_d = FETCH_DELAY_WS;
                    if (delay_cnt_q > C_T_TOLERANCE && mon_time_q == 1'b1) begin      // SSYNC came to early
                        state_d = ERR;
                    end
                    else if (GD_STOP == SET) begin
                        state_d = STOP;
                    end
                end
                else if (GD_STOP == SET) begin
                    state_d = STOP;
                end

                if (mon_time_q == 1'b1) begin
                    delay_cnt_d = delay_cnt_q - 1;
                    if (SYNC_TOO_LATE == 1'b1) begin       // SSYNC came to late
                        state_d = ERR;
                    end
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
            mode <= INACTIVE;
            status = 'b0;
        end
        else begin
            mode <= (run_mode_d == C_STATUS_RUN_MODE_RUNNING)? ACTIVE: INACTIVE;
            status[C_STATUS_RUN_MODE_OFFSET+C_STATUS_RUN_MODE_SIZE-1 : C_STATUS_RUN_MODE_OFFSET] = run_mode_q;
        end
    end


    // Clock synchronizer for sync signal, and generates a single pulse ssync signal
    // when a sync signal is detected.
    always @ (posedge clk) begin
        if (!async_reset_n) begin
            sync_reg <= {NUM_STAGES{1'b0}};
            ssync <= 0;
        end
        else begin
            sync_reg <= {sync_reg[NUM_STAGES-1:1], sync};
            if (sync_reg[NUM_STAGES:NUM_STAGES-1] == 2'b01) begin
                ssync <= 1;
            end else begin
                ssync <= 0;
            end
        end
    end

    // Sets either a reset signal on the gate output or the desired value from BRAM
    // when a sync signal is received.
    generate
        for (i = 0; i < C_GATEDRIVE_WIDTH; i++) begin
            always @ (posedge sync or posedge reset_output_q) begin
                if (reset_output_q) begin
                    gate_output[i] <= C_GATE_IDLE_VALUE[i];
                end
                else begin
                    gate_output[i] <= value_q[i];
                end
            end
        end
    endgenerate

endmodule
