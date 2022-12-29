`timescale 1ns / 1ps
/**
 * @brief    Module description
 */

import axi4lite_pkg::*;

module axi4lite_bram #(
)
(
    // Gate driver interface
    input logic     [C_DATA_WIDTH-1 : 0] status_reg,
    input logic     enb,
	input logic     regceb,
	input logic     [C_ADDR_WIDTH-4 : 0] addrb,
	output logic    [C_DATA_WIDTH-1 : 0] doutb,

    // AXI interface
    input logic     s_axi_aclk,
    input logic     s_axi_aresetn,
    input logic     [C_ADDR_WIDTH-1 : 0] s_axi_awaddr,
    input logic     [2 : 0] s_axi_awprot,
    input logic     s_axi_awvalid,
    input logic     [C_DATA_WIDTH-1 : 0] s_axi_wdata,
    input logic     [(C_DATA_WIDTH/8)-1 : 0] s_axi_wstrb,
    input logic     s_axi_wvalid,
    input logic     s_axi_bready,
    input logic     [C_ADDR_WIDTH-1 : 0] s_axi_araddr,
    input logic     [2 : 0] s_axi_arprot,
    input logic     s_axi_arvalid,
    output logic    s_axi_awready,
    output logic    s_axi_arready,
    output logic    [C_DATA_WIDTH-1 : 0] s_axi_rdata,
    output logic    [1 : 0] s_axi_rresp,
    output logic    s_axi_rvalid,
    output logic    s_axi_wready,
    output logic    [1 : 0] s_axi_bresp,
    output logic    s_axi_bvalid,
    output logic    s_axi_rready

);

    logic wea;
    logic [$clog2(C_RAM_DEPTH-1)-1:0] addra;           // Write address bus, width determined from RAM_DEPTH
//    logic [C_DATA_WIDTH-1 : 0] doutb;

    assign wea = s_axi_awaddr[C_ADDR_WIDTH-1] & s_axi_awready;
	assign addra = s_axi_awaddr[C_ADDR_WIDTH-2:C_ADDR_LSB];

axi4lite #(
) axi4lite_instance(
    .status(status_reg),
    .s_axi_aclk(s_axi_aclk),
    .s_axi_aresetn(s_axi_aresetn),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awprot(s_axi_awprot),
    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awready(s_axi_awready),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wstrb(s_axi_wstrb),
    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wready(s_axi_wready),
    .s_axi_bresp(s_axi_bresp),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_bready(s_axi_bready),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_arprot(s_axi_arprot),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_arready(s_axi_arready),
    .s_axi_rdata(s_axi_rdata),
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_rready(s_axi_rready)
);

bram #(
) bram_instance(
    .clk(s_axi_aclk),
    .rst_n(s_axi_aresetn),
    .regceb(regceb),
    .enb(enb),
    .wea(wea),
    .dina(s_axi_wdata),
    .addra(addra),
    .addrb(addrb),
    .doutb(doutb)
);

endmodule