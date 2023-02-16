`timescale 1ns / 100ps

module sync_generator #(

)
(
    input logic clk,
    input logic rst_n,
    output logic sync
);
localparam C_STATE_INDEX_LEN = 8;
localparam C_STATE_INDEX_WIDTH = $clog2(C_STATE_INDEX_LEN);
localparam C_CNT_WIDTH = 32;
localparam C_DATA_WIDTH = 32;
localparam C_ON_CNT = 9;
localparam C_IDLE_CNT = 50;

typedef enum bit[1:0] {ERR = 2'b11, IDLE = 2'b00, ON, DELAY} state_t;
state_t state_q, state_d;

logic [C_CNT_WIDTH-1 : 0] delay_cnt_d, delay_cnt_q;
logic [C_CNT_WIDTH-1 : 0] on_cnt_d, on_cnt_q;
logic [C_CNT_WIDTH-1 : 0] idle_cnt_d, idle_cnt_q;
logic [C_STATE_INDEX_WIDTH-1 : 0] index_d, index_q;
logic [C_DATA_WIDTH-1 : 0] sync_delay_settings[C_STATE_INDEX_LEN-1 : 0];
logic sync_d, sync_q;
logic delay_cnt_msb;
logic on_cnt_msb;
logic idle_cnt_msb;

assign delay_cnt_msb = delay_cnt_q[C_CNT_WIDTH-1];
assign on_cnt_msb = on_cnt_q[C_CNT_WIDTH-1];
assign idle_cnt_msb = idle_cnt_q[C_CNT_WIDTH-1];
assign sync = sync_q;

generate
    initial begin
        /*
        sync_delay_settings[0] = 32'h000004D8;  // 32'h0000050f;      1240
        sync_delay_settings[1] = 32'h00005CBC;  // 32'h00005cf3;      23740
        sync_delay_settings[2] = 32'h000004A6;  // 32'h000004dd;      1190
        sync_delay_settings[3] = 32'h00005CEE;  // 32'h00005d25;      23790
        sync_delay_settings[4] = 32'h000004D8;  // 32'h0000050f;      1240
        sync_delay_settings[5] = 32'h00005CBC;  // 32'h00005cf3;      23740
        sync_delay_settings[6] = 32'h000004A6;  // 32'h000004dd;      1190
        sync_delay_settings[7] = 32'h00005CEE;  // 32'h00005d25;      23790
        */
        sync_delay_settings[0] = 32'h000004B2;  // 32'h0000050f;      1240
        sync_delay_settings[1] = 32'h00002BC2;  // 32'h00005cf3;      23740
        sync_delay_settings[2] = 32'h00000480;  // 32'h000004dd;      1190
        sync_delay_settings[3] = 32'h00008D9C;  // 32'h00005d25;      23790
        sync_delay_settings[4] = 32'h000004B2;  // 32'h0000050f;      1240
        sync_delay_settings[5] = 32'h00002BC2;  // 32'h00005cf3;      23740
        sync_delay_settings[6] = 32'h00000480;  // 32'h000004dd;      1190
        sync_delay_settings[7] = 32'h00008D9C;  // 32'h00005d25;      23790
    end
endgenerate

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n) begin
        state_q <= IDLE;
        delay_cnt_q <= 0;
        on_cnt_q <= 0;
        index_q <= 0;
        idle_cnt_q <= C_IDLE_CNT;
    end else begin
        state_q <= state_d;
        delay_cnt_q <= delay_cnt_d;
        on_cnt_q <= on_cnt_d;
        index_q <= index_d;
        idle_cnt_q <= idle_cnt_d;
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

    case (state_q)
        ERR:
            begin
                on_cnt_d = 0;
                delay_cnt_d = 0;
            end
        IDLE:
            begin
                idle_cnt_d = idle_cnt_q - 1;
                if (idle_cnt_msb == 1'b1) begin
                    state_d = ON;
                    on_cnt_d = C_ON_CNT;
                    delay_cnt_d = sync_delay_settings[0];
                end
            end
        ON:
            begin
                on_cnt_d = on_cnt_q - 1;
                sync_d = 1;
                if (on_cnt_msb == 1'b1) begin
                    state_d = DELAY;
                    on_cnt_d = C_ON_CNT;
                    sync_d = 0;
                    delay_cnt_d = sync_delay_settings[index_q];
                end
            end
        DELAY:
            begin
                delay_cnt_d = delay_cnt_q - 1;
                if (delay_cnt_msb == 1'b1) begin
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

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n) begin
        sync_q = 0;
    end else begin
        sync_q = sync_d;
    end
end

endmodule