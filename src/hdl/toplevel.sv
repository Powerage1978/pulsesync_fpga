`timescale 1ns / 1ps

module toplevel (
		clk,
		rst_n,
		doutb,
		ctrl_reg,
		external_err,
		addrb,

		sync,
		gate_output
    );
		localparam integer COUNT_SIZE = 25;
		localparam integer IDX_SIZE = 5;
    	localparam integer OUTPUT_WIDTH = 4;
		localparam integer WORD_SIZE = 32;
    	localparam integer NO_OF_STATES_OFFSET = 8;
    	localparam integer T_TOLERANCE = 4;
    
		input wire clk;
		input wire rst_n;
		input wire [WORD_SIZE-1:0]doutb;
		input wire [WORD_SIZE-1:0]ctrl_reg;
		input wire external_err;
		output wire [IDX_SIZE-1:0]addrb;

		input wire sync;
		output wire gate_output[OUTPUT_WIDTH];


	gate_driver #(
		.COUNT_SIZE (COUNT_SIZE),
		.IDX_SIZE (IDX_SIZE),
    	.OUTPUT_WIDTH (OUTPUT_WIDTH),
    	.WORD_SIZE (WORD_SIZE),
    	.NO_OF_STATES_OFFSET (NO_OF_STATES_OFFSET),
    	.T_TOLERANCE (T_TOLERANCE)
	)
	gate_driver_impl(
    	.clk			(clk),
    	.rst_n			(rst_n),
    	.doutb			(doutb),
    	.ctrl_reg		(ctrl_reg),
    	.external_err	(externel_err),
    	.addrb			(addrb),
    	.sync			(sync),
    	.gate_output	(gate_output)
	);
    
endmodule
