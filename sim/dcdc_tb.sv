`timescale 1ns / 100ps


module dcdc_tb(
);
    import sim_pkg::*;
    import axi4lite_pkg::*;

    logic clk;
    logic rst_n;
    logic [C_DATA_WIDTH-1 : 0] pwm_control;
    logic mode;
    logic [C_DATA_WIDTH-1 : 0] pwm_val;
    logic pwm_out_curr;
    logic pwm_out_volt;
    logic ena_psu;

    dcdc #(

    )dcdc_instance (
        .clk            (clk),
        .rst_n          (rst_n),
        .pwm_control    (pwm_control),
        .mode           (mode),
        .pwm_val        (pwm_val),
        .pwm_out_curr   (pwm_out_curr),
        .pwm_out_volt   (pwm_out_volt),
        .ena_psu        (ena_psu)
    );


    initial begin
        clk = 1'b0;
    end

    always begin
        #(C_HALF_PERIOD)
        clk = ~clk;
    end

    initial begin
        rst_n = 1'b0;
        pwm_control[C_DATA_WIDTH-1 : 0] = {C_DATA_WIDTH{1'b0}};
        pwm_val[C_DATA_WIDTH-1 : 0] = {C_DATA_WIDTH{1'b0}};
        mode = 1'b0;
        repeat (5) @(negedge clk);
        rst_n = 1'b1;
        repeat (50) @(negedge clk);
        pwm_control[C_PWM_CTRL_I_RUN_OFFSET+C_PWM_CTRL_RUN_SIZE-1 : C_PWM_CTRL_I_RUN_OFFSET] = C_PWM_CTRL_START;
        pwm_control[C_PWM_CTRL_V_RUN_OFFSET+C_PWM_CTRL_RUN_SIZE-1 : C_PWM_CTRL_V_RUN_OFFSET] = C_PWM_CTRL_START;
        pwm_val[C_PWM_VAL_IDLE_I_DUTY_OFFSET+C_PWM_VAL_DUTY_SIZE-1 : C_PWM_VAL_IDLE_I_DUTY_OFFSET] = 7'd10;
        pwm_val[C_PWM_VAL_RUN_I_DUTY_OFFSET+C_PWM_VAL_DUTY_SIZE-1 : C_PWM_VAL_RUN_I_DUTY_OFFSET] = 7'd25;
        pwm_val[C_PWM_VAL_IDLE_V_DUTY_OFFSET+C_PWM_VAL_DUTY_SIZE-1 : C_PWM_VAL_IDLE_V_DUTY_OFFSET] = 7'd10;
        pwm_val[C_PWM_VAL_RUN_V_DUTY_OFFSET+C_PWM_VAL_DUTY_SIZE-1 : C_PWM_VAL_RUN_V_DUTY_OFFSET] = 7'd25;
        repeat (6000000) @(negedge clk);
        mode = 1'b1;
        repeat (300000) @(negedge clk);
        pwm_val[C_PWM_VAL_RUN_I_DUTY_OFFSET+C_PWM_VAL_DUTY_SIZE-1 : C_PWM_VAL_RUN_I_DUTY_OFFSET] = 7'd66;
        pwm_val[C_PWM_VAL_RUN_V_DUTY_OFFSET+C_PWM_VAL_DUTY_SIZE-1 : C_PWM_VAL_RUN_V_DUTY_OFFSET] = 7'd66;
        repeat (2000000) @(negedge clk);
        $display("Test done");
        #200 $finish;
    end


endmodule
