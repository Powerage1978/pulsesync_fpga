`timescale 1ns / 100ps

module sync_generator_tb(
    );

    import sim_pkg::*;
    import axi4lite_pkg::*;

    logic clk;
    logic rst_n;
    logic [C_DATA_WIDTH-1:0]gen_ctrl;
    logic [C_DATA_WIDTH-1:0]gen_status;
    logic sync_signal;
    logic sync_signal_n;

    sync_generator#(
    ) sync_generator_instance(
        .clk    (clk),
        .rst_n  (rst_n),
        .gen_ctrl(gen_ctrl),
        .gen_status(gen_status),
        .sync_signal(sync_signal),
        .sync_signal_n(sync_signal_n)
    );

    initial begin
        clk = 0;
    end
    
    always begin
        #(C_HALF_PERIOD)
        clk = ~clk;
    end

    initial begin
        rst_n = 1'b0;
        repeat (5) @(negedge clk);
        rst_n = 1'b1;

        repeat (50000) @(negedge clk);
        $display("Test done");
        #200 $finish;
    end
endmodule
