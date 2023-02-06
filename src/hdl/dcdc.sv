`timescale 1ns / 1ps

import axi4lite_pkg::*;
import sys_pkg::*;

module dcdc #(
)
(
    input logic clk,
    input logic rst_n,
    input logic [C_DATA_WIDTH-1 : 0] curr_control,
    input logic [C_DATA_WIDTH-1 : 0] volt_control,
    output logic pwm_out_curr,
    output logic pwm_out_volt,
    output logic ena_psu
);

localparam longint C_DELAY = 10000;             // Delay in ms
localparam longint C_COUNT_SIZE = 16;
localparam longint C_COUNT_LOW_RESET = {C_COUNT_SIZE + 1{1'b1}};
localparam longint C_COUNT_HIGH_RESET = C_SYS_FREQ * C_DELAY / 2**C_COUNT_SIZE / 1000;
localparam integer C_STATE_SIZE = 2; 

logic [C_DCDC_ENA_SIZE-1 : 0] ena_curr_d;
logic [C_DCDC_ENA_SIZE-1 : 0] ena_volt_d;
logic ena_psu_d, ena_psu_q;
typedef logic [C_COUNT_SIZE : 0] count_t;

typedef enum bit {DISABLE_PSU = 1'b1, ENABLE_PSU = 1'b0} psu_status;

typedef enum bit[C_STATE_SIZE-1 : 0] {ERR = 2'b11, STOP = 2'b00, DELAY, RUN} state_t;
state_t state_q, state_d;

count_t delay_cnt_low_d, delay_cnt_low_q;
count_t delay_cnt_high_d, delay_cnt_high_q;

assign ena_curr_d = curr_control[C_PWM_CTRL_RUN_OFFSET+C_PWM_CTRL_RUN_SIZE-1 : C_PWM_CTRL_RUN_OFFSET];
assign ena_volt_d = volt_control[C_PWM_CTRL_RUN_OFFSET+C_PWM_CTRL_RUN_SIZE-1 : C_PWM_CTRL_RUN_OFFSET];
assign ena_psu = ena_psu_q;

pwm #(
)pwm_curr_instance (
    .clk        (clk),
    .rst_n      (rst_n),
    .control    (curr_control),
    .pwm_out    (pwm_out_curr)
);

pwm #(
)pwm_volt_instance (
    .clk        (clk),
    .rst_n      (rst_n),
    .control    (volt_control),
    .pwm_out    (pwm_out_volt)
);

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n) begin
        state_q <= STOP;
        delay_cnt_low_q = C_COUNT_LOW_RESET;
        delay_cnt_high_q = C_COUNT_HIGH_RESET;
    end else begin
        state_q <= state_d;
        delay_cnt_low_q <= delay_cnt_low_d;
        delay_cnt_high_q <= delay_cnt_high_d;
    end
end

always @(*)
begin
    state_d = state_q;
    ena_psu_d = ena_psu_q;
    delay_cnt_low_d = delay_cnt_low_q;
    delay_cnt_high_d = delay_cnt_high_q;
    case (state_q)
    STOP:
        begin
            delay_cnt_low_d = C_COUNT_LOW_RESET;
            delay_cnt_high_d = C_COUNT_HIGH_RESET;
            if (ena_volt_d | ena_curr_d) begin
                state_d = DELAY;
            end
        end
    DELAY:
        begin
            if (delay_cnt_low_q[C_COUNT_SIZE] == 1'b0) begin
                delay_cnt_low_d = delay_cnt_low_q - 1;
            end else begin
                delay_cnt_low_d = {1'b0,{C_COUNT_SIZE{1'b1}}};
                if (delay_cnt_high_q[C_COUNT_SIZE] == 1'b0) begin
                    delay_cnt_high_d = delay_cnt_high_q - 1;
                end else begin
                    state_d = RUN;
                end
            end
        end
    RUN:
        begin
            ena_psu_d = ENABLE_PSU;
            if ((ena_volt_d | ena_curr_d) == 1'b0) begin
                state_d = STOP;
                ena_psu_d = DISABLE_PSU;
            end
        end
    ERR:
        begin
            ena_psu_d = DISABLE_PSU;
        end
    default:
        begin
            state_d = ERR;
        end
    endcase
end

always @ (posedge clk) begin
    if (!rst_n) begin
        ena_psu_q <= DISABLE_PSU;
    end else begin
        ena_psu_q <= ena_psu_d;
    end
end

endmodule