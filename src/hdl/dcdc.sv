`timescale 1ns / 100ps

/*
 * DCDC module implementation
 * Interfaces to the DCDC module and sets PWM values for current and voltage.
 * This DCDC module implememnts a softstart mechanism where the voltage and
 * current PWM values (known as idle values) are held for a given amount of
 * time, and then changes to the required run values.
 *
 */
import axi4lite_pkg::*;
import sys_pkg::*;
import mem_map_pkg::*;

module dcdc #(
)
(
    input logic clk,                                // Clock
    input logic rst_n,                              // Reset, active low
    input logic [C_DATA_WIDTH-1 : 0] pwm_control,   // PWM control word
    input logic mode,                               // System mode, inactive or active
    input logic [C_DATA_WIDTH-1 : 0] pwm_val,       // PWM value word
    output logic [C_DATA_WIDTH-1 : 0] pwm_status,   // WPM status word
    output logic pwm_out_curr,                      // Current PWM output
    output logic pwm_out_volt,                      // Voltage PWM output
    output logic ena_psu                            // PSU enable bit
);

    // Local parameters
    localparam longint C_DELAY = 5; // 100;             // Delay in ms
    localparam longint C_COUNT_SIZE = 16;
    localparam longint C_COUNT_LOW_RESET = {C_COUNT_SIZE + 1{1'b1}};
    localparam longint C_COUNT_HIGH_RESET = C_SYS_FREQ * C_DELAY / 2**C_COUNT_SIZE / 1000;
    localparam integer C_STATE_SIZE = 3; 

    // Typedef definitions
    typedef logic [C_COUNT_SIZE : 0] count_t;
    typedef enum bit {DISABLE_PSU = 1'b1, ENABLE_PSU = 1'b0} psu_status_t;
    typedef enum bit {DISABLE_PWM = 1'b0, ENABLE_PWM = 1'b1} pwm_status_t;
    typedef enum bit {UNSET = 1'b0, SET = 1'b1} pwm_ctrl_t;
    typedef enum logic[4:0] {ERR    = 5'b00001,
                             STOP   = 5'b00010,
                             DELAY  = 5'b00100,
                             IDLE   = 5'b01000,
                             RUN    = 5'b10000} state_t;

    // Logic definitions
    pwm_status_t ena_volt_q, ena_curr_q;
    logic ena_psu_d, ena_psu_q;
    logic [C_PWM_VAL_DUTY_SIZE-1 : 0] curr_pwm_duty_d, curr_pwm_duty_q;
    logic [C_PWM_VAL_DUTY_SIZE-1 : 0] volt_pwm_duty_d, volt_pwm_duty_q;

    state_t state_q, state_d;

    count_t delay_cnt_low_d, delay_cnt_low_q;
    count_t delay_cnt_high_d, delay_cnt_high_q;
    pwm_ctrl_t pwm_i_start, pwm_i_stop, pwm_v_start, pwm_v_stop;

    logic [C_DATA_WIDTH-1:0] status;
    logic [C_PWM_STATUS_INFO_SIZE-1 : 0] pwm_i_status, pwm_v_status, dcdc_status_d, dcdc_status_q;

    logic DCDC_ERR;
    logic async_reset_n;

    // Assignments
    assign ena_psu = ena_psu_q;

    // Instances
    async_reset #(
    ) async_reset_instance(
        .clk(clk),
        .asyncrst_n(rst_n),
        .rst_n(async_reset_n)
    );

    pwm #(
    )pwm_curr_instance (
        .clk        (clk),
        .rst_n      (rst_n),
        .enable     (ena_curr_q),
        .pwm_duty   (curr_pwm_duty_q),
        .pwm_out    (pwm_out_curr),
        .status     (pwm_i_status)
    );

    pwm #(
    )pwm_volt_instance (
        .clk        (clk),
        .rst_n      (rst_n),
        .enable     (ena_volt_q),
        .pwm_duty   (volt_pwm_duty_q),
        .pwm_out    (pwm_out_volt),
        .status     (pwm_v_status)
    );

    always @(posedge clk or negedge async_reset_n)
    begin
        if (!async_reset_n) begin
            state_q <= STOP;
            dcdc_status_q <= C_DCDC_STATUS_STOPPED;
            delay_cnt_low_q <= 0;
            delay_cnt_high_q <= 0;
        end
        else begin
            state_q <= state_d;
            delay_cnt_low_q <= delay_cnt_low_d;
            delay_cnt_high_q <= delay_cnt_high_d;
            dcdc_status_q <= dcdc_status_d;
        end
    end

    always @(*)
    begin
        state_d = state_q;
        ena_psu_d = ena_psu_q;
        dcdc_status_d = dcdc_status_q;
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
                    dcdc_status_d = C_DCDC_STATUS_RUNNING;
                end
            end
        DELAY:
            begin
                if (delay_cnt_low_q[C_COUNT_SIZE] == 1'b0) begin
                    delay_cnt_low_d = delay_cnt_low_q - 1;
                end
                else begin
                    delay_cnt_low_d = {1'b0,{C_COUNT_SIZE{1'b1}}};
                    if (delay_cnt_high_q[C_COUNT_SIZE] == 1'b0) begin
                        delay_cnt_high_d = delay_cnt_high_q - 1;
                    end
                    else begin
                        state_d = IDLE;
                    end
                end
            end
        IDLE:
            begin
                ena_psu_d = ENABLE_PSU;
                curr_pwm_duty_d = pwm_val[C_PWM_VAL_IDLE_I_DUTY_OFFSET+C_PWM_VAL_DUTY_SIZE-1 : C_PWM_VAL_IDLE_I_DUTY_OFFSET];
                volt_pwm_duty_d = pwm_val[C_PWM_VAL_IDLE_V_DUTY_OFFSET+C_PWM_VAL_DUTY_SIZE-1 : C_PWM_VAL_IDLE_V_DUTY_OFFSET];
                if(mode == 1'b1) begin
                    state_d = RUN;
                end;
            end
        RUN:
            begin
                curr_pwm_duty_d = pwm_val[C_PWM_VAL_RUN_I_DUTY_OFFSET+C_PWM_VAL_DUTY_SIZE-1 : C_PWM_VAL_RUN_I_DUTY_OFFSET];
                volt_pwm_duty_d = pwm_val[C_PWM_VAL_RUN_V_DUTY_OFFSET+C_PWM_VAL_DUTY_SIZE-1 : C_PWM_VAL_RUN_V_DUTY_OFFSET];
                if ((ena_volt_q | ena_curr_q) == 1'b0) begin
                    state_d = STOP;
                    ena_psu_d = DISABLE_PSU;
                end
                else if (mode == 1'b0) begin
                    state_d = IDLE;
                end
            end
        ERR:
            begin
                ena_psu_d = DISABLE_PSU;
                dcdc_status_d = C_DCDC_STATUS_ERROR;
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
            ena_psu_q <= DISABLE_PSU;
            ena_volt_q <= DISABLE_PWM;
            ena_curr_q <= DISABLE_PWM;
            curr_pwm_duty_q <= 0;
            volt_pwm_duty_q <= 0;
            pwm_status <= 0;
        end
        else begin
            ena_psu_q <= ena_psu_d;
            curr_pwm_duty_q <= curr_pwm_duty_d;
            volt_pwm_duty_q <= volt_pwm_duty_d;
            if (pwm_control[C_PWM_CTRL_I_RUN_OFFSET + C_PWM_CTRL_RUN_SIZE-1 : C_PWM_CTRL_I_RUN_OFFSET] == C_PWM_CTRL_START) begin
                ena_curr_q <= ENABLE_PWM;
            end
            if (pwm_control[C_PWM_CTRL_I_RUN_OFFSET + C_PWM_CTRL_RUN_SIZE-1 : C_PWM_CTRL_I_RUN_OFFSET] == C_PWM_CTRL_STOP)  begin
                ena_curr_q <= DISABLE_PWM;
            end
            if (pwm_control[C_PWM_CTRL_V_RUN_OFFSET + C_PWM_CTRL_RUN_SIZE-1 : C_PWM_CTRL_V_RUN_OFFSET] == C_PWM_CTRL_START) begin
                ena_volt_q <= ENABLE_PWM;
            end
            if (pwm_control[C_PWM_CTRL_V_RUN_OFFSET + C_PWM_CTRL_RUN_SIZE-1 : C_PWM_CTRL_V_RUN_OFFSET] == C_PWM_CTRL_STOP)  begin
                ena_volt_q <= DISABLE_PWM;
            end
            if (dcdc_status_q == C_DCDC_STATUS_ERROR) begin
                ena_curr_q <= DISABLE_PWM;
                ena_volt_q <= DISABLE_PWM;
            end

            pwm_status[C_PWM_STATUS_I_INFO_OFFSET+C_PWM_STATUS_INFO_SIZE-1: C_PWM_STATUS_I_INFO_OFFSET] <= pwm_i_status;
            pwm_status[C_PWM_STATUS_V_INFO_OFFSET+C_PWM_STATUS_INFO_SIZE-1: C_PWM_STATUS_V_INFO_OFFSET] <= pwm_v_status;
            pwm_status[C_PWM_STATUS_DCDC_INFO_OFFSET+C_PWM_STATUS_INFO_SIZE-1: C_PWM_STATUS_DCDC_INFO_OFFSET] <= dcdc_status_q;

        end
    end

endmodule
