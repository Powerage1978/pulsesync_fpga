`timescale 1ns / 100ps

/*
 * PWM module used by the DCDC current and voltage PWM generators.
 * The PWM runs at a base frequency of 200 KHz. The PWM generator allows for a
 * 0% and 100% duty cycle output. The PWM can be started and stopped via
 * control bit in the control reg.
 */

import axi4lite_pkg::*;
import sys_pkg::*;
import mem_map_pkg::*;

module pwm #(
)
(
    input   logic clk,                                  // Clock signal
    input   logic rst_n,                                // Reset, active low
    input   logic enable,                               // Enable signal, active high
    input   logic [C_PWM_VAL_DUTY_SIZE-1 : 0]pwm_duty,  // PWM duty cycle
    output  logic pwm_out,                              // PWM output bit
    output  logic [C_PWM_STATUS_INFO_SIZE-1 : 0]status  // PWM current status
);

    // Local parameters
    localparam integer C_PWM_FREQ = 32'd200000;     // 200 kHz
    localparam integer C_COUNTER_PERIOD = C_SYS_FREQ / C_PWM_FREQ;
    localparam integer C_COUNT_SIZE = $clog2(C_COUNTER_PERIOD);
    localparam integer C_STATE_SIZE = 2;
    localparam integer C_COUNT_OFFSET = 2;

    // Typedef definitions
    typedef enum logic[2:0] { ERR  = 3'b001,
                              STOP,
                              RUN} state_t;
    typedef logic [C_COUNT_SIZE : 0] count_t;

    // Logic definitions
    state_t state_q, state_d;
    logic [C_PWM_VAL_DUTY_SIZE-1 : 0] duty_cycle_val;
    count_t on_width_q, on_width_d, on_width_val;
    count_t pulse_width_q, pulse_width_d;
    logic pwm_out_q, pwm_out_d;
    logic [C_PWM_STATUS_INFO_SIZE-1 : 0] status_d, status_q;
    logic async_reset_n;

    // Assignemnts
    assign duty_cycle_val = pwm_duty;
    assign pwm_out = pwm_out_q;
    assign status = status_q;

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
            status_q <= C_PWM_STATUS_STOPPED;
            on_width_q <= {C_COUNT_SIZE + 1{1'b1}};
            pulse_width_q <= {C_COUNT_SIZE + 1{1'b1}};
            on_width_val <= 0;
        end
        else begin
            state_q <= state_d;
            on_width_q <= on_width_d;
            pulse_width_q <= pulse_width_d;
            status_q = status_d;

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
        status_d = status_q;
        case (state_q)
        STOP:
            begin
                status_d = C_PWM_STATUS_STOPPED;
                if (enable == 1'b1) begin
                    state_d = RUN;
                    status_d = C_PWM_STATUS_RUNNING;
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
                    end
                    else begin
                        pwm_out_d = 1'b0;
                    end
                end
                else begin
                    if (enable == 1'b1) begin
                        pulse_width_d = C_COUNTER_PERIOD - C_COUNT_OFFSET;
                        if (on_width_val == 0) begin
                            on_width_d = {C_COUNT_SIZE + 1{1'b1}};
                            pwm_out_d = 1'b0;
                        end else begin
                            on_width_d = on_width_val - C_COUNT_OFFSET;
                            pwm_out_d = 1'b1;
                        end
                    end
                    else begin
                        state_d = STOP;
                    end
                end
            end
        ERR:
            begin
                pwm_out_d = 1'b0;
                status_d = C_PWM_STATUS_ERROR;
            end
        default:
            begin
                state_d = ERR;
            end
        endcase
    end

    always @ (posedge clk or negedge async_reset_n)
    begin
        if (!async_reset_n) begin
            pwm_out_q <= 0;
        end
        else begin
            pwm_out_q <= pwm_out_d;
        end
    end

endmodule
