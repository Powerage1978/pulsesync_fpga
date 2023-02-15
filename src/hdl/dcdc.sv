`timescale 1ns / 100ps

import axi4lite_pkg::*;
import sys_pkg::*;

module dcdc #(
)
(
    input logic clk,
    input logic rst_n,
    input logic [C_DATA_WIDTH-1 : 0] curr_control,
    input logic [C_DATA_WIDTH-1 : 0] volt_control,
    input logic mode,
    output logic pwm_out_curr,
    output logic pwm_out_volt,
    output logic ena_psu
);

localparam longint C_DELAY = 100;             // Delay in ms
localparam longint C_COUNT_SIZE = 16;
localparam longint C_COUNT_LOW_RESET = {C_COUNT_SIZE + 1{1'b1}};
localparam longint C_COUNT_HIGH_RESET = C_SYS_FREQ * C_DELAY / 2**C_COUNT_SIZE / 1000;
localparam integer C_STATE_SIZE = 3; 

logic [C_PWM_CTRL_ENA_SIZE-1 : 0] ena_curr_d, ena_curr_q;
logic [C_PWM_CTRL_ENA_SIZE-1 : 0] ena_volt_d, ena_volt_q;
logic ena_psu_d, ena_psu_q;
logic [C_PWM_CTRL_DUTY_SIZE-1 : 0] curr_pwm_duty_d, curr_pwm_duty_q;
logic [C_PWM_CTRL_DUTY_SIZE-1 : 0] volt_pwm_duty_d, volt_pwm_duty_q;
typedef logic [C_COUNT_SIZE : 0] count_t;

typedef enum bit {DISABLE_PSU = 1'b1, ENABLE_PSU = 1'b0} psu_status;
typedef enum bit {DISABLE_PWM = 1'b0, ENABLE_PWM = 1'b1} pwm_status;

typedef enum bit[C_STATE_SIZE-1 : 0] {ERR = 3'b111, STOP = 3'b000, DELAY, IDLE, RUN} state_t;
state_t state_q, state_d;

count_t delay_cnt_low_d, delay_cnt_low_q;
count_t delay_cnt_high_d, delay_cnt_high_q;

assign ena_curr_d = curr_control[C_PWM_CTRL_ENA_OFFSET+C_PWM_CTRL_ENA_SIZE-1 : C_PWM_CTRL_ENA_OFFSET];
assign ena_volt_d = volt_control[C_PWM_CTRL_ENA_OFFSET+C_PWM_CTRL_ENA_SIZE-1 : C_PWM_CTRL_ENA_OFFSET];
assign ena_psu = ena_psu_q;

pwm #(
)pwm_curr_instance (
    .clk        (clk),
    .rst_n      (rst_n),
    .enable     (ena_curr_q),
    .pwm_duty   (curr_pwm_duty_q),
    .pwm_out    (pwm_out_curr)
);

pwm #(
)pwm_volt_instance (
    .clk        (clk),
    .rst_n      (rst_n),
    .enable     (ena_volt_q),
    .pwm_duty   (volt_pwm_duty_q),
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
    curr_pwm_duty_d = curr_pwm_duty_q;
    volt_pwm_duty_d = volt_pwm_duty_q;
    case (state_q)
    STOP:
        begin
            curr_pwm_duty_d = 0;
            volt_pwm_duty_d = 0;
            delay_cnt_low_d = C_COUNT_LOW_RESET;
            delay_cnt_high_d = C_COUNT_HIGH_RESET;
            if (ena_volt_q | ena_curr_q) begin
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
                    state_d = IDLE;
                end
            end
        end
    IDLE:
        begin
            ena_psu_d = ENABLE_PSU;
            curr_pwm_duty_d = curr_control[C_PWM_CTRL_IDLE_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_IDLE_DUTY_OFFSET];
            volt_pwm_duty_d = volt_control[C_PWM_CTRL_IDLE_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_IDLE_DUTY_OFFSET];
            if(mode == 1'b1) begin
                state_d = RUN;
            end;
        end
    RUN:
        begin
            curr_pwm_duty_d = curr_control[C_PWM_CTRL_RUN_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_RUN_DUTY_OFFSET];
            volt_pwm_duty_d = volt_control[C_PWM_CTRL_RUN_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_RUN_DUTY_OFFSET];
            if ((ena_volt_q | ena_curr_q) == 1'b0) begin
                state_d = STOP;
                ena_psu_d = DISABLE_PSU;
            end else if (mode == 1'b0) begin
                state_d = IDLE;
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
        ena_volt_q <= DISABLE_PWM;
        ena_curr_q <= DISABLE_PWM;
        curr_pwm_duty_q <= 0;
        volt_pwm_duty_q <= 0;
    end else begin
        ena_psu_q <= ena_psu_d;
        ena_volt_q <= ena_volt_d;
        ena_curr_q <= ena_curr_d;
        curr_pwm_duty_q <= curr_pwm_duty_d;
        volt_pwm_duty_q <= volt_pwm_duty_d;
    end
end

endmodule