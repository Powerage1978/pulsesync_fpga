`timescale 1ns / 100ps


module dcdc_tb(
);
    import sim_pkg::*;
    import axi4lite_pkg::*;

    logic clk;
    logic rst_n;
    logic [C_DATA_WIDTH-1 : 0] curr_control;
    logic [C_DATA_WIDTH-1 : 0] volt_control;
    logic mode;
    logic pwm_out_curr;
    logic pwm_out_volt;
    logic ena_psu;

    dcdc #(

    )dcdc_instance (
        .clk            (clk),
        .rst_n          (rst_n),
        .curr_control   (curr_control),
        .volt_control   (volt_control),
        .mode           (mode),
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
        curr_control[C_DATA_WIDTH-1 : 0] = {C_DATA_WIDTH{1'b0}};
        volt_control[C_DATA_WIDTH-1 : 0] = {C_DATA_WIDTH{1'b0}};
        mode = 1'b0;
        repeat (5) @(negedge clk);
        rst_n = 1'b1;
        repeat (50) @(negedge clk);
        curr_control[C_PWM_CTRL_ENA_OFFSET+C_PWM_CTRL_ENA_SIZE-1 : C_PWM_CTRL_ENA_OFFSET] = 1'b1;
        curr_control[C_PWM_CTRL_IDLE_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_IDLE_DUTY_OFFSET] = 7'd10;
        curr_control[C_PWM_CTRL_RUN_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_RUN_DUTY_OFFSET] = 7'd25;
        volt_control[C_PWM_CTRL_ENA_OFFSET+C_PWM_CTRL_ENA_SIZE-1 : C_PWM_CTRL_ENA_OFFSET] = 1'b1;
        volt_control[C_PWM_CTRL_IDLE_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_IDLE_DUTY_OFFSET] = 7'd10;
        volt_control[C_PWM_CTRL_RUN_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_RUN_DUTY_OFFSET] = 7'd25;
        repeat (6000000) @(negedge clk);
        mode = 1'b1;
        repeat (300000) @(negedge clk);
        curr_control[C_PWM_CTRL_RUN_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_RUN_DUTY_OFFSET] = 7'd66;
        volt_control[C_PWM_CTRL_RUN_DUTY_OFFSET+C_PWM_CTRL_DUTY_SIZE-1 : C_PWM_CTRL_RUN_DUTY_OFFSET] = 7'd66;
        repeat (2000000) @(negedge clk);
        $display("Test done");
        #200 $finish;
    end


endmodule