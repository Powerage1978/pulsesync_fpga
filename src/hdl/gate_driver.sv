`timescale 1ns / 100ps

import gatedriver_pkg::*;

module gate_driver # (
   
)
(
    // System clock domain
    input logic clk,
    input logic rst_n,
    input logic [C_WORD_SIZE-1:0] doutb,
    input logic [C_WORD_SIZE-1:0] ctrl_reg,
    input logic external_err,
    output logic [C_IDX_SIZE:0] addrb,
    output logic [C_WORD_SIZE-1:0] status,
    output logic enb,
    output logic regceb,
    output logic [C_STATUS_SIZE-1:0] state_dbg,
    output logic mode,

    // External clock domain
    input logic sync,
    output logic gate_output_pin[C_OUTPUT_WIDTH],
    output logic gate_output_dbg[C_OUTPUT_WIDTH]
);


localparam NUM_STAGES = 3;
// localparam C_STATUS_SIZE = 3;

typedef enum bit[C_STATUS_SIZE-1:0] {ERR = 3'b001, STOP, A, A2, B, C, D} state_t;
typedef enum bit {TIME = 0, VALUE} tv_select_t;

typedef enum bit {INACTIVE = 1'b0, ACTIVE = 1'b1} mode_status;

state_t q_state;
state_t d_state;

mode_status mode_d, mode_q;

assign status[C_STATUS_SIZE-1 : 0] = q_state;
assign status[C_WORD_SIZE-1 : C_STATUS_SIZE] = {(C_WORD_SIZE - C_STATUS_SIZE){1'b0}};

logic [C_COUNT_SIZE-1 : 0] q_tcounter;
logic [C_COUNT_SIZE-1 : 0] d_tcounter;
logic [C_IDX_SIZE-1 : 0] q_idx;
logic [C_IDX_SIZE-1 : 0] d_idx;
logic [C_OUTPUT_WIDTH-1 : 0] q_value;
logic [C_OUTPUT_WIDTH-1 : 0] d_value;
logic q_mon_time;
logic d_mon_time;
logic q_reset_output, d_reset_output;
logic RUN;
logic SYNC_TOO_LATE;
logic [C_IDX_SIZE-1 : 0] NO_OF_STATES;
logic ssync;
logic [NUM_STAGES:1] sync_reg;
logic gate_output[C_OUTPUT_WIDTH];

tv_select_t q_tv_select, d_tv_select;

// Assignemnts

assign enb = 1'b1;
assign regceb = 1'b1;

assign addrb = {q_idx, q_tv_select};

assign NO_OF_STATES = ctrl_reg[C_NO_OF_STATES_OFFSET+C_IDX_SIZE-1 : C_NO_OF_STATES_OFFSET];
// assign NO_OF_STATES = 8;

assign RUN = ctrl_reg[0];
// assign RUN = 1'b1;

assign SYNC_TOO_LATE = q_tcounter[C_COUNT_SIZE-1];

assign state_dbg = q_state;
assign mode = mode_q;

generate
    genvar i;
    for (i = 0; i < C_OUTPUT_WIDTH; i++) begin
        assign gate_output_pin[i] = gate_output[i] ? 1'b0 : 1'bZ;
        assign gate_output_dbg[i] = gate_output[i];
    end

endgenerate

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n) begin
        q_state <= STOP;
        q_tcounter <= 0;
        q_idx <= 0;
        q_value <= 0;
        q_mon_time <= 0;
        q_tv_select <= TIME;
        q_reset_output <= 1;
        mode_q <= INACTIVE;
    end
    else begin
        q_state <= d_state;
        q_tcounter <= d_tcounter;
        q_idx <= d_idx;
        q_value <= d_value;
        q_mon_time <= d_mon_time;
        q_tv_select <= d_tv_select;
        q_reset_output <= d_reset_output;
        mode_q <= mode_d;
    end
end

always @(*)
begin
    d_state = q_state;
    d_tcounter = q_tcounter;
    d_idx = q_idx;
    d_value = q_value;
    d_mon_time = q_mon_time;
    d_tv_select = q_tv_select;
    d_reset_output = q_reset_output;
    mode_d = mode_q;

    case (q_state)
    ERR:
        begin
            mode_d = INACTIVE;
            d_value = 4'b0100;
            d_reset_output = 1;
            if (RUN == 0) begin
                d_state = STOP;
            end
        end
    STOP:
        begin
            mode_d = INACTIVE;
            d_state = STOP;
            d_tcounter = 0;
            d_idx = 0;
            // d_value = 0;
            d_value = 4'b0100;
            d_mon_time = 0;
            d_tv_select = TIME;
            d_reset_output = 1;
            if (RUN == 1) begin
                d_state = A;
            end
            if (ssync == 1) begin
                d_state = ERR;
            end
        end
    A:
        begin
            if (ssync == 1) begin
                d_state = ERR;
            end else begin
                d_state = A2;
                d_tv_select = VALUE;
            end
        end
    A2:
        begin
            if (ssync == 1) begin
                d_state = ERR;
            end else begin
                d_state = B;
            end
        end
    B:
        begin
            if (ssync == 1) begin
                d_state = ERR;
            end else begin
                d_state = C;
                d_reset_output = 0;
                d_tcounter = doutb;
                d_tv_select = TIME;
            end
        end
    C:
        begin
            if (ssync == 1) begin
                d_state = ERR;
            end else begin
                d_state = D;
                d_value = doutb;
            end
        end
    D:
        begin
            if (ssync == 1) begin
                mode_d = ACTIVE;
                d_mon_time = 1;
                d_state = A;
                d_idx = (q_idx + 1) % NO_OF_STATES;
                if (q_tcounter > C_T_TOLERANCE && q_mon_time == 1) begin      // SSYNC came to early
                    d_state = ERR;
                end
            end

            if (q_mon_time == 1) begin
                d_tcounter = q_tcounter - 1;
                if (SYNC_TOO_LATE == 1) begin       // SSYNC came to late
                    d_state = ERR;
                end
            end

            if (external_err == 1) begin
                d_state = ERR;
            end

        end
    default:
        begin
            d_state = ERR;
        end
    endcase
end


always @ (posedge clk) begin
    if (!rst_n) begin
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

generate
    for (i = 0; i < C_OUTPUT_WIDTH; i++) begin
        always @ (posedge sync or posedge q_reset_output) begin
            if (q_reset_output) begin
                // gate_output[i] <= 0;
                gate_output[i] <= q_value[i];
            end
            else begin
                gate_output[i] <= q_value[i];
            end
        end
    end
endgenerate

endmodule