`timescale 1ns / 100ps
/**
 * Maps the instances that interfaces to BRAM and the interface that maps to user registers together
 * so that they can be access by the AXI interface.
 */

import axi4lite_pkg::*;

module pulsesync_memory_block #(
)
(
    // PWM interface
    input   logic   [C_DATA_WIDTH-1 : 0] pwm_status,
    output  logic   [C_DATA_WIDTH-1 : 0] pwm_ctrl,
    output  logic   [C_DATA_WIDTH-1 : 0] pwm_val,

    // Gate driver interface
    input   logic   [C_DATA_WIDTH-1 : 0] pulsesync_status,
    output  logic   [C_DATA_WIDTH-1 : 0] pulsesync_ctrl,

    // Generator interface
    input   logic   [C_DATA_WIDTH-1 : 0] gen_status,
    output  logic   [C_DATA_WIDTH-1 : 0] gen_ctrl,

    // BRAM interface
    input   logic   enb,
	input   logic   regceb,
	input   logic   [C_BRAM_REG_ADDR_BITS-1 : 0] addrb,
	output  logic   [C_DATA_WIDTH-1 : 0] doutb,

    // AXI interface
    input   logic   s_axi_aclk,
    input   logic   s_axi_aresetn,
    input   logic   [C_ADDR_WIDTH-1 : 0] s_axi_awaddr,
    input   logic   [2 : 0] s_axi_awprot,
    input   logic   s_axi_awvalid,
    input   logic   [C_DATA_WIDTH-1 : 0] s_axi_wdata,
    input   logic   [(C_DATA_WIDTH/8)-1 : 0] s_axi_wstrb,
    input   logic   s_axi_wvalid,
    input   logic   s_axi_bready,
    input   logic   [C_ADDR_WIDTH-1 : 0] s_axi_araddr,
    input   logic   [2 : 0] s_axi_arprot,
    input   logic   s_axi_arvalid,
    input   logic   s_axi_rready,
    output  logic   s_axi_awready,
    output  logic   s_axi_arready,
    output  logic   [C_DATA_WIDTH-1 : 0] s_axi_rdata,
    output  logic   [1 : 0] s_axi_rresp,
    output  logic   s_axi_rvalid,
    output  logic   s_axi_wready,
    output  logic   [1 : 0] s_axi_bresp,
    output  logic   s_axi_bvalid
);

    logic wea;
    logic [$clog2(C_RAM_DEPTH-1)-1:0] addra;           // Write address bus, width determined from RAM_DEPTH

    assign wea = s_axi_awaddr[C_ADDR_WIDTH-1] & s_axi_awready;
	assign addra = s_axi_awaddr[C_ADDR_WIDTH-2:C_ADDR_LSB];

    pulsesync_memory_map #(
    ) pulsesync_memory_map_instance(
        .pulsesync_status(pulsesync_status),
        .pulsesync_ctrl(pulsesync_ctrl),
        .gen_status(gen_status),
        .gen_ctrl(gen_ctrl),
        .pwm_status(pwm_status),
        .pwm_ctrl(pwm_ctrl),
        .pwm_val(pwm_val),
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

    pulsesync_bram #(
    ) pulsesync_bram_instance(
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
