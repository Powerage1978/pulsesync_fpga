`timescale 1 ns / 1 ps
/**
 * @brief Xilinx Simple Dual Port Single Clock RAM
 * This code implements a parameterizable SDP single clock memory.
 * If a reset or enable is not necessary, it may be tied off or removed from the code.
 */

import axi4lite_pkg::*;
module bram #(
) (
    input logic clk,                                    /*!< Clock */
    input logic rst_n,                                  /*!< reset */
    input logic regceb,                                 /*!< Output register enable */
    input logic enb,                                    /*!< Read Enable, for additional power savings, disable when not in use */
    input logic wea,                                    /*!< Write enable */
    input logic [C_DATA_WIDTH-1 : 0] dina,              /*!< RAM input data */
    input logic [$clog2(C_RAM_DEPTH-1)-1 : 0] addra,    /*!< Write address bus */
    input logic [C_ADDR_WIDTH-4 : 0] addrb,             /*!< Read address bus */
    output logic [C_DATA_WIDTH-1 : 0] doutb             /*!< RAM output data*/
);

  /**
     * Local parameters
     */

  localparam C_RAM_PERFORMANCE = "HIGH_PERFORMANCE";  // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
  localparam C_INIT_FILE = "testdata.txt";       // Specify name/location of RAM initialization file if using one (leave blank if not)
  localparam C_FILE_PATH = "";

  /**
     * Logic definitions
     */
  logic [C_DATA_WIDTH-1:0] ram_state_settings[C_RAM_DEPTH-1:0];
  logic [C_DATA_WIDTH-1:0] ram_data;


  /**
     * Assignments
     */

  // The following code either initializes the memory values to a specified file or to all zeros to match hardware
    generate
    if (C_INIT_FILE != "") begin : use_init_file
        initial begin
        // $readmemh(C_INIT_FILE, ram_state_settings, 0, C_RAM_DEPTH-1);
        // $readmemh({C_FILE_PATH, C_INIT_FILE}, ram_state_settings, 0, C_RAM_DEPTH-1);
            /*
            ram_state_settings[0]  = 32'h00005d25;
            ram_state_settings[1]  = 32'h00000015;      // A, K, DCDC
            ram_state_settings[2]  = 32'h0000050f;
            ram_state_settings[3]  = 32'h00000011;      // A, DCDC
            ram_state_settings[4]  = 32'h00005cf3;
            ram_state_settings[5]  = 32'h00000010;      // DCDC
            ram_state_settings[6]  = 32'h000004dd;
            ram_state_settings[7]  = 32'h00000014;      // Damper, DCDC
            ram_state_settings[8]  = 32'h00005d25;
            ram_state_settings[9]  = 32'h00000016;      // B, K, DCDC
            ram_state_settings[10] = 32'h0000050f;
            ram_state_settings[11] = 32'h00000012;      // B, DCDC
            ram_state_settings[12] = 32'h00005cf3;
            ram_state_settings[13] = 32'h00000010;      // DCDC
            ram_state_settings[14] = 32'h000004dd;
            ram_state_settings[15] = 32'h00000014;      // Damper, DCDC
            */
            ram_state_settings[0]  = 32'h00008DD3;
            ram_state_settings[1]  = 32'h00000015;      // A, K, DCDC
            ram_state_settings[2]  = 32'h000004E9;
            ram_state_settings[3]  = 32'h00000011;      // A, DCDC
            ram_state_settings[4]  = 32'h00002BF9;
            ram_state_settings[5]  = 32'h00000010;      // DCDC
            ram_state_settings[6]  = 32'h000004B7;
            ram_state_settings[7]  = 32'h00000014;      // Damper, DCDC
            ram_state_settings[8]  = 32'h00008DD3;
            ram_state_settings[9]  = 32'h00000016;      // B, K, DCDC
            ram_state_settings[10] = 32'h000004E9;
            ram_state_settings[11] = 32'h00000012;      // B, DCDC
            ram_state_settings[12] = 32'h00002BF9;
            ram_state_settings[13] = 32'h00000010;      // DCDC
            ram_state_settings[14] = 32'h000004B7;
            ram_state_settings[15] = 32'h00000014;      // Damper, DCDC
        end
    end else begin : init_bram_to_zero
        integer ram_index;
        initial begin
            for (ram_index = 0; ram_index < C_RAM_DEPTH; ram_index = ram_index + 1) begin
                ram_state_settings[ram_index] = {C_DATA_WIDTH{1'b0}};
            end
        end
    end
    endgenerate

    always @(posedge clk) begin
    if (!rst_n) begin
        ram_data <= {C_DATA_WIDTH{1'b0}};
    end else begin
        if (wea) begin
            ram_state_settings[addra] <= dina;
        end
        if (enb) begin
            ram_data <= ram_state_settings[addrb];
        end
    end
    end

  //  The following code generates HIGH_PERFORMANCE (use output register) or LOW_LATENCY (no output register)
    generate
    if (C_RAM_PERFORMANCE == "LOW_LATENCY") begin : no_output_register

        // The following is a 1 clock cycle read latency at the cost of a longer clock-to-out timing
        assign doutb = ram_data;

    end else begin : output_register

        // The following is a 2 clock cycle read latency with improve clock-to-out timing

        logic [C_DATA_WIDTH-1:0] doutb_reg;

        always @(posedge clk)
        if (!rst_n) begin
            doutb_reg <= {C_DATA_WIDTH{1'b0}};
        end else if (regceb) begin
            doutb_reg <= ram_data;
        end

        assign doutb = doutb_reg;

    end
    endgenerate

endmodule
