`timescale 1ns / 1ps

import gatedriver_pkg::*;

module gate_driver_tb (

);
    logic clk;
    logic rst_n;
    logic [C_WORD_SIZE-1:0]doutb;
    logic [C_WORD_SIZE-1:0]ctrl_reg;
    logic external_err;
    logic [C_IDX_SIZE-1:0]addrb;
    logic [C_WORD_SIZE-1:0] status;

    logic sync;
    logic gate_output[C_OUTPUT_WIDTH];

gate_driver #(

)
gate_driver_instance (
    .clk            (clk),
    .rst_n          (rst_n),
    .doutb          (doutb),
    .ctrl_reg       (ctrl_reg),
    .external_err   (external_err),
    .addrb          (addrb),
    .status         (status),

    // External clock domain
    .sync           (sync),
    .gate_output_pin (gate_output)
);

    initial begin
        clk = 0;
        sync = 1'b0;
    end
    
    always 
    #5 clk = ~clk;

    initial begin
        rst_n = 0;
        doutb[C_WORD_SIZE-1:0] = {C_WORD_SIZE{1'b0}};
        external_err = 1'b0;
        ctrl_reg[C_NO_OF_STATES_OFFSET+C_IDX_SIZE-1 : C_NO_OF_STATES_OFFSET] = 5;
        #50
        rst_n = 1;
        doutb[C_OUTPUT_WIDTH-1:0] = {C_OUTPUT_WIDTH{1'b1}};
        #50
        ctrl_reg[0] = 1'b1;
        #50
        sync = 1'b1;
        #10
        sync = 1'b0;

        #180
        sync = 1'b1;
        #10
        sync = 1'b0;
        
        #180
        sync = 1'b1;
        #10
        sync = 1'b0;

        #400 $finish;
    end

endmodule