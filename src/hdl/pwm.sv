`timescale 1ns / 1ps

import axi4lite_pkg::*;

module pwm #(
)
(
    input logic clk,
    input logic rst_n,
    input logic [C_DATA_WIDTH-1 : 0] control,
    output logic pwm_out
);

localparam integer C_COUNTER_PERIOD = 32'd250;
localparam integer C_COUNT_SIZE = $clog2(C_COUNTER_PERIOD);
localparam integer C_STATE_SIZE = 2;
localparam integer C_COUNT_OFFSET = 2;

typedef enum bit[C_STATE_SIZE-1 : 0] {ERR = 2'b01, STOP, RUN} state_t;
typedef logic [C_COUNT_SIZE : 0] count_t;

logic [C_PWM_CTRL_RUN_SIZE-1 : 0] pwm_active;

state_t state_q, state_d;
logic [C_PWM_CTRL_DUTY_SIZE-1 : 0] duty_cycle_val;
count_t on_width_q, on_width_d, on_width_val;
count_t pulse_width_q, pulse_width_d;
logic pwm_out_q, pwm_out_d;

assign pwm_active = control[C_PWM_CTRL_RUN_OFFSET+C_PWM_CTRL_RUN_SIZE-1 : C_PWM_CTRL_RUN_OFFSET];
assign duty_cycle_val = control[C_PWM_CTRL_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_DUTY_OFFSET];
assign pwm_out = pwm_out_q;

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n) begin
        state_q <= STOP;
        on_width_q <= {C_COUNT_SIZE + 1{1'b1}};
        pulse_width_q <= {C_COUNT_SIZE + 1{1'b1}};
        on_width_val <= {C_COUNT_SIZE + 1{1'b1}};
    end
    else begin
        state_q <= state_d;
        on_width_q <= on_width_d;
        pulse_width_q <= pulse_width_d;

        if (duty_cycle_val == 0) begin
            on_width_val <= 0;
        end else if (duty_cycle_val > 100) begin
            on_width_val <= C_COUNTER_PERIOD;
        end else begin
            on_width_val <= (duty_cycle_val * C_COUNTER_PERIOD / 100);
        end
    end
end

always @(*)
begin
    state_d = state_q;
    on_width_d = on_width_q;
    pulse_width_d = pulse_width_q;
    pwm_out_d = pwm_out_q;
    case (state_q)
    STOP:
        begin
            if (pwm_active == 1'b1) begin
                state_d = RUN;
                if (on_width_val == 0) begin
                    on_width_d = {C_COUNT_SIZE + 1{1'b1}};
                end
            end
        end
    RUN:
        begin
            if (pulse_width_q[C_COUNT_SIZE] == 1'b0) begin
                pulse_width_d = pulse_width_q - 1;
                if (on_width_q[C_COUNT_SIZE] == 1'b0) begin
                    on_width_d = on_width_q - 1;
                    pwm_out_d = 1'b1;
                end else begin
                    pwm_out_d = 1'b0;
                end
            end else begin
                if (pwm_active == 1'b1) begin
                    pulse_width_d = C_COUNTER_PERIOD - C_COUNT_OFFSET;
                    if (on_width_val == 0) begin
                        on_width_d = {C_COUNT_SIZE + 1{1'b1}};
                        pwm_out_d = 1'b0;
                    end else begin
                        on_width_d = on_width_val - C_COUNT_OFFSET;
                        pwm_out_d = 1'b1;
                    end
                end else begin
                    state_d = STOP;
                end
            end
        end
    ERR:
        begin
            pwm_out_d = 1'b0;
        end
    default:
        begin
            state_d = ERR;
        end
    endcase
end

always @ (posedge clk) begin
    if (!rst_n) begin
        pwm_out_q <= 0;
    end
    else begin
        pwm_out_q = pwm_out_d;
    end
end

endmodule