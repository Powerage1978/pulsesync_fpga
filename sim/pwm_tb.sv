`timescale 1ns / 1ps


module pwm_tb(
);
    import sim_pkg::*;
    import axi4lite_pkg::*;

    logic clk;
    logic rst_n;
    logic [C_DATA_WIDTH-1 : 0] pwm_control;
    logic pwm_out;

    pwm #(

    )pwm_instance (
        .clk        (clk),
        .rst_n      (rst_n),
        .control    (pwm_control),
        .pwm_out    (pwm_out)
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
        repeat (5) @(negedge clk);
        rst_n = 1'b1;
        pwm_control[C_PWM_CTRL_RUN_OFFSET+C_PWM_CTRL_RUN_SIZE-1 : C_PWM_CTRL_RUN_OFFSET] = 1'b1;
        pwm_control[C_PWM_CTRL_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_DUTY_OFFSET] = 7'd1;
        repeat (150) @(negedge clk);
        pwm_control[C_PWM_CTRL_RUN_OFFSET+C_PWM_CTRL_RUN_SIZE-1 : C_PWM_CTRL_RUN_OFFSET] = 1'b0;
        repeat (350) @(negedge clk);
        pwm_control[C_PWM_CTRL_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_DUTY_OFFSET] = 7'd66;
        pwm_control[C_PWM_CTRL_RUN_OFFSET+C_PWM_CTRL_RUN_SIZE-1 : C_PWM_CTRL_RUN_OFFSET] = 1'b1;
        repeat (350) @(negedge clk);
        pwm_control[C_PWM_CTRL_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_DUTY_OFFSET] = 7'd100;
        repeat (350) @(negedge clk);
        pwm_control[C_PWM_CTRL_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_DUTY_OFFSET] = 7'd66;
        repeat (350) @(negedge clk);
        pwm_control[C_PWM_CTRL_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_DUTY_OFFSET] = 7'd1;
        repeat (350) @(negedge clk);
        pwm_control[C_PWM_CTRL_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_DUTY_OFFSET] = 7'd110;
        repeat (350) @(negedge clk);


        $display("Test done");
        #200 $finish;
    end


endmodule