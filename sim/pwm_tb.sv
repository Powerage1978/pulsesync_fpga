`timescale 1ns / 100ps


module pwm_tb(
);
    import sim_pkg::*;
    import axi4lite_pkg::*;
    import mem_map_pkg::*;

    logic clk;
    logic rst_n;
    logic enable;
    logic [C_PWM_VAL_DUTY_SIZE-1 : 0] pwm_duty;
    logic pwm_out;

    pwm #(

    )pwm_instance (
        .clk        (clk),
        .rst_n      (rst_n),
        .enable     (enable),
        .pwm_duty   (pwm_duty),
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
        enable = 1'b0;
        pwm_duty = 7'd0;
        repeat (5) @(negedge clk);
        rst_n = 1'b1;
        enable = 1'b1;
        pwm_duty = 7'd1;
        repeat (150) @(negedge clk);
        enable = 1'b0;
        repeat (350) @(negedge clk);
        pwm_duty = 7'd66;
        enable = 1'b1;
        repeat (350) @(negedge clk);
        pwm_duty = 7'd100;
        repeat (350) @(negedge clk);
        pwm_duty = 7'd66;
        repeat (350) @(negedge clk);
        pwm_duty = 7'd1;
        repeat (350) @(negedge clk);
        pwm_duty = 7'd110;
        repeat (350) @(negedge clk);


        $display("Test done");
        #200 $finish;
    end


endmodule
