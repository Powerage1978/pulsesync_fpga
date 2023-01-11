`timescale 1ns / 1ps

module sync_generator_tb(
    );

    import sim_pkg::*;

    logic clk;
    logic rst_n;
    logic sync;

    sync_generator#(
    ) sync_generator_instance(
        .clk    (clk),
        .rst_n  (rst_n),
        .sync   (sync)
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