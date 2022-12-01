`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2022 03:15:43 PM
// Design Name: 
// Module Name: toplevel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module toplevel #(
    parameter integer LOG2_BUFFER_SIZE      = 5,
    parameter integer C_S_AXI_DATA_WIDTH	= 32,
    parameter integer C_S_AXI_ADDR_WIDTH	= LOG2_BUFFER_SIZE + 3
)(
		enb,
        rstb,
        regceb,
        addrb,
        doutb,
		S_AXI_ACLK,
		S_AXI_ARESETN,
		S_AXI_AWADDR,
		S_AXI_AWPROT,
		S_AXI_AWVALID,
		S_AXI_AWREADY,
		S_AXI_WDATA,
		S_AXI_WSTRB,
		S_AXI_WVALID,
		S_AXI_WREADY,
		S_AXI_BRESP,
		S_AXI_BVALID,
		S_AXI_BREADY,
		S_AXI_ARADDR,
		S_AXI_ARPROT,
		S_AXI_ARVALID,
		S_AXI_ARREADY,
		S_AXI_RDATA,
		S_AXI_RRESP,
		S_AXI_RVALID,
		S_AXI_RREADY
    );
    
    	input wire enb;
        input wire rstb;
        input wire regceb;
        input wire [C_S_AXI_ADDR_WIDTH-4 : 0] addrb;
        output wire [C_S_AXI_DATA_WIDTH-1 : 0] doutb;
		input wire  S_AXI_ACLK;
		input wire  S_AXI_ARESETN;
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR;
		input wire [2 : 0] S_AXI_AWPROT;
		input wire  S_AXI_AWVALID;
		output wire  S_AXI_AWREADY;
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA;
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB;
		input wire  S_AXI_WVALID;
		output wire  S_AXI_WREADY;
		output wire [1 : 0] S_AXI_BRESP;
		output wire  S_AXI_BVALID;
		input wire  S_AXI_BREADY;
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR;
		input wire [2 : 0] S_AXI_ARPROT;
		input wire  S_AXI_ARVALID;
		output wire  S_AXI_ARREADY;
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA;
		output wire [1 : 0] S_AXI_RRESP;
		output wire  S_AXI_RVALID;
		input wire  S_AXI_RREADY;
    
    myip_v1_0_S000_AXI #(
        .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
		.LOG2_BUFFER_SIZE(LOG2_BUFFER_SIZE))
    myip_v1_0_S000_AXI_impl(
        .enb(enb),
        .rstb(rstb),
        .regceb(regceb),
        .addrb(addrb),
        .doutb(doutb),
		.S_AXI_ACLK(S_AXI_ACLK),
		.S_AXI_ARESETN(S_AXI_ARESETN),
		.S_AXI_AWADDR(S_AXI_AWADDR),
		.S_AXI_AWPROT(S_AXI_AWPROT),
		.S_AXI_AWVALID(S_AXI_AWVALID),
		.S_AXI_AWREADY(S_AXI_AWREADY),
		.S_AXI_WDATA(S_AXI_WDATA),
		.S_AXI_WSTRB(S_AXI_WSTRB),
		.S_AXI_WVALID(S_AXI_WVALID),
		.S_AXI_WREADY(S_AXI_WREADY),
		.S_AXI_BRESP(S_AXI_BRESP),
		.S_AXI_BVALID(S_AXI_BVALID),
		.S_AXI_BREADY(S_AXI_BREADY),
		.S_AXI_ARADDR(S_AXI_ARADDR),
		.S_AXI_ARPROT(S_AXI_ARPROT),
		.S_AXI_ARVALID(S_AXI_ARVALID),
		.S_AXI_ARREADY(S_AXI_ARREADY),
		.S_AXI_RDATA(S_AXI_RDATA),
		.S_AXI_RRESP(S_AXI_RRESP),
		.S_AXI_RVALID(S_AXI_RVALID),
		.S_AXI_RREADY(S_AXI_RREADY)
    );
    
endmodule
