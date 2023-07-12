`timescale 1ns / 100ps
/*
 * Xilinx Simple Dual Port Single Clock RAM
 * This code implements a parameterizable SDP single clock memory.
 * If a reset or enable is not necessary, it may be tied off or removed from the code.
 */

import axi4lite_pkg::*;
module pulsesync_bram #(
) (
    input logic clk,                                    // Clock
    input logic rst_n,                                  // reset
    input logic regceb,                                 // Output register enable
    input logic enb,                                    // Read Enable, for additional power savings, disable when not in use
    input logic wea,                                    // Write enable
    input logic [C_DATA_WIDTH-1 : 0] dina,              // RAM input data
    input logic [$clog2(C_RAM_DEPTH-1)-1 : 0] addra,    // Write address bus
    input logic [C_BRAM_REG_ADDR_BITS-1 : 0] addrb,             // Read address bus
    output logic [C_DATA_WIDTH-1 : 0] doutb             // RAM output data
);

    // Local parameters
    localparam C_RAM_PERFORMANCE = "HIGH_PERFORMANCE";  // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
    localparam C_INIT_FILE = "testdata.txt";       // Specify name/location of RAM initialization file if using one (leave blank if not)
    localparam C_FILE_PATH = "";

    // Logic definitions
    logic [C_DATA_WIDTH-1:0] ram_state_settings[C_RAM_DEPTH-1:0];
    logic [C_DATA_WIDTH-1:0] ram_data;
    logic async_reset_n;

    // Assignments

    // Instances
    async_reset #(
    ) async_reset_instance(
        .clk(clk),
        .asyncrst_n(rst_n),
        .rst_n(async_reset_n)
    );

    generate
    always @(posedge clk or negedge async_reset_n) begin
        if (!async_reset_n) begin
            ram_data <= {C_DATA_WIDTH{1'b0}};
            begin
            integer ram_index;
                for (ram_index = 0; ram_index < C_RAM_DEPTH; ram_index = ram_index + 1) begin
                    ram_state_settings[ram_index] <= {C_DATA_WIDTH{1'b0}};
                end
            end
            
        end
        else begin
            if (wea) begin
                ram_state_settings[addra] <= dina;
            end
            if (enb) begin
                ram_data <= ram_state_settings[addrb];
            end
        end
    end

    endgenerate

    //  The following code generates HIGH_PERFORMANCE (use output register) or LOW_LATENCY (no output register)
    generate
        if (C_RAM_PERFORMANCE == "LOW_LATENCY") begin : no_output_register

            // The following is a 1 clock cycle read latency at the cost of a longer clock-to-out timing
            assign doutb = ram_data;

        end
        else begin : output_register

            // The following is a 2 clock cycle read latency with improve clock-to-out timing

            logic [C_DATA_WIDTH-1:0] doutb_reg;

            always @(posedge clk)
            if (!async_reset_n) begin
                doutb_reg <= {C_DATA_WIDTH{1'b0}};
            end
            else if (regceb) begin
                doutb_reg <= ram_data;
            end

            assign doutb = doutb_reg;

        end
    endgenerate

endmodule
