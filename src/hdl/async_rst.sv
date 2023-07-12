`timescale 1ns / 100ps

/*
 * Async reset synchronizer circuit.
 * This construction creates an asserted asynchounous reset output, and a
 * synchronized reset deassertion.
 */

module async_reset(
    input logic clk,        // Clock signal
    input logic asyncrst_n, // Async input
    output logic rst_n      // Synchronized reset signal
    );

    logic rff1;

    always @(posedge clk or negedge asyncrst_n) begin
        if (!asyncrst_n) begin
            {rst_n, rff1} <= 2'b0;
        end
        else begin 
            {rst_n, rff1} <= {rff1, 1'b1};
        end
    end
endmodule
