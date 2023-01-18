`timescale 1ns / 1ps

import axi4lite_pkg::*;
import gatedriver_pkg::*;
import zynq_interface_pkg::*;

module toplevel #(

)
(
	// ZYNQ I/O
	inout logic [C_DDR_ADDR_WIDTH-1 : 0]DDR_addr,
	inout logic [C_DDR_BANKADDR_WIDTH-1 : 0]DDR_ba,
	inout logic DDR_cas_n,
	inout logic DDR_ck_n,
	inout logic DDR_ck_p,
	inout logic DDR_cke,
	inout logic DDR_cs_n,
	inout logic [C_DDR_DATAMASK_WIDTH-1 : 0]DDR_dm,
	inout logic [C_DDR_DATA_WIDTH-1 : 0]DDR_dq,
	inout logic [C_DDR_DATASTROBE_WIDTH-1 : 0]DDR_dqs_n,
	inout logic [C_DDR_DATASTROBE_WIDTH-1 : 0]DDR_dqs_p,
	inout logic DDR_odt,
	inout logic DDR_ras_n,
	inout logic DDR_reset_n,
	inout logic DDR_we_n,
	inout logic FIXED_IO_ddr_vrn,
	inout logic FIXED_IO_ddr_vrp,
	inout logic [C_MIO_WIDTH-1 : 0]FIXED_IO_mio,
	inout logic FIXED_IO_ps_clk,
	inout logic FIXED_IO_ps_porb,
	inout logic FIXED_IO_ps_srstb,

	// Internal clock domain
	output logic [C_STATUS_SIZE-1:0]state_dbg,
	output logic clk_dbg,
	output logic sync_dbg,

	output logic rs485_p,
	output logic rs485_n,
	output logic fault,
	output logic con_ext_en,

	
	// External clock domain
	input logic sync_in_n,
	input logic sync_in_p,
	output logic gate_output_dbg[C_OUTPUT_WIDTH],
	output logic sync_a,
	output logic sync_b,
	output logic sync_k,
	output logic dyn_damper
	);

	localparam C_TEST_ENABLE	= 1;

    logic sync_single_ended;
    logic sync;
	logic sync_signal;
	logic sync_gen;
	logic gate_output[C_OUTPUT_WIDTH];
    
    // Proc module
	
	/*
	logic DDR_addr;
	logic DDR_ba;
	logic DDR_cas_n;
	logic DDR_ck_n;
	logic DDR_ck_p;
	logic DDR_cke;
	logic DDR_cs_n;
	logic DDR_dm;
	logic DDR_dq;
	logic DDR_dqs_n;
	logic DDR_dqs_p;
	logic DDR_odt;
	logic DDR_ras_n;
	logic DDR_reset_n;
	logic DDR_we_n;
	*/
	logic FCLK_CLK0;
	logic FCLK_RESET0_N;
	/*
	logic FIXED_IO_ddr_vrn;
	logic FIXED_IO_ddr_vrp;
	logic FIXED_IO_mio;
	logic FIXED_IO_ps_clk;
	logic FIXED_IO_ps_porb;
	logic FIXED_IO_ps_srstb;
	*/
	

    // Gate driver
	logic external_err;
	logic [C_WORD_SIZE-1:0] ctrl_reg;
	
	// Myip axi
	logic [C_WORD_SIZE-1:0]status;
	logic enb;
	logic rstb;
	logic regceb;
	logic [C_IDX_SIZE:0]addrb;
	logic [C_WORD_SIZE-1:0]doutb;
	
	/*
	logic S_AXI_AWADDR;
	logic S_AXI_AWPROT;
	logic S_AXI_AWVALID;
	logic S_AXI_AWREADY;
	logic S_AXI_WDATA;
	logic S_AXI_WSTRB;
	logic S_AXI_WVALID;
	logic S_AXI_WREADY;
	logic [1 : 0] S_AXI_BRESP;
	logic S_AXI_BVALID;
	logic S_AXI_BREADY;
    logic S_AXI_ARADDR;
    logic [2 : 0] S_AXI_ARPROT;
    logic S_AXI_ARVALID;
    logic S_AXI_ARREADY;
    logic [C_WORD_SIZE-1 : 0] S_AXI_RDATA;
    logic [1 : 0] S_AXI_RRESP;
    logic S_AXI_RVALID;
    logic S_AXI_RREADY;
	*/
    
	// AXI
	logic M00_AXI_arvalid;
	logic M00_AXI_awvalid;
	logic M00_AXI_bready;
	logic M00_AXI_rready;
	logic M00_AXI_wlast;
	logic M00_AXI_wvalid;
	logic [11:0]M00_AXI_arid;
	logic [11:0]M00_AXI_awid;
	logic [11:0]M00_AXI_wid;
	logic [1:0]M00_AXI_arburst;
	logic [1:0]M00_AXI_arlock;
	logic [2:0]M00_AXI_arsize;
	logic [1:0]M00_AXI_awburst;
	logic [1:0]M00_AXI_awlock;
	logic [2:0]M00_AXI_awsize;
	logic [2:0]M00_AXI_arprot;
	logic [2:0]M00_AXI_awprot;
	logic [31:0]M00_AXI_araddr;
	logic [31:0]M00_AXI_awaddr;
	logic [31:0]M00_AXI_wdata;
	logic [3:0]M00_AXI_arcache;
	logic [3:0]M00_AXI_arlen;
	logic [3:0]M00_AXI_arqos;
	logic [3:0]M00_AXI_awcache;
	logic [3:0]M00_AXI_awlen;
	logic [3:0]M00_AXI_awqos;
	logic [3:0]M00_AXI_wstrb;
	logic M00_AXI_ACLK;
	logic M00_AXI_arready;
	logic M00_AXI_awready;
	logic M00_AXI_bvalid;
	logic M00_AXI_rlast;
	logic M00_AXI_rvalid;
	logic M00_AXI_wready;
	logic [11:0]M00_AXI_bid;
	logic [11:0]M00_AXI_rid;
	logic [1:0]M00_AXI_bresp;
	logic [1:0]M00_AXI_rresp;
	logic [31:0]M00_AXI_rdata;


	// input wire sync;
	// output wire gate_output[OUTPUT_WIDTH];

    assign external_err = 1'b0;
    assign rstb = 0;
    assign ctrl_reg[C_NO_OF_STATES_OFFSET+C_IDX_SIZE-1 : C_NO_OF_STATES_OFFSET] = 8;
    assign ctrl_reg[0] = 1'b1;
    
    assign clk_dbg = FCLK_CLK0;
    assign sync_dbg = sync_signal;

	assign sync_a = gate_output[0];
	assign sync_b = gate_output[1];
	assign sync_k = gate_output[2];
	assign dyn_damper = gate_output[3];

	assign rs485_p = 1'bZ;
	assign rs485_n = 1'bZ;
	assign fault = 1'bZ;
	assign con_ext_en = 1'bZ;

	// Selector for test generator
	if (C_TEST_ENABLE == 1'b0) begin
		assign sync_signal = sync;
	end else begin
		assign sync_signal = sync_gen;
	end
    
	gate_driver #(

	) gate_driver_instance(
		.clk(FCLK_CLK0),
		.rst_n(FCLK_RESET0_N),
		.doutb(doutb),
		.ctrl_reg(ctrl_reg),
		.external_err(external_err),
		.addrb(addrb),
		.status(status),
		.enb(enb),
		.regceb(regceb),
		.state_dbg(state_dbg),
		.sync(sync_signal),
		.gate_output_pin(gate_output),
		.gate_output_dbg(gate_output_dbg)
	);

	axi4lite_bram #(

	) axi4lite_bram_instance(
		.s_axi_aclk(FCLK_CLK0),
        .s_axi_aresetn(FCLK_RESET0_N),
		.addrb(addrb),
        .doutb(doutb),
        .status_reg(status),
        .enb(enb),
        .regceb(regceb),
        .s_axi_awaddr(M00_AXI_awaddr[C_ADDR_WIDTH-1 : 0]),
        .s_axi_awprot(M00_AXI_awprot),
        .s_axi_awvalid(M00_AXI_awvalid),
        .s_axi_rready(M00_AXI_rready),
        .s_axi_wdata(M00_AXI_wdata),
        .s_axi_wstrb(M00_AXI_wstrb),
        .s_axi_wvalid(M00_AXI_wvalid),
        .s_axi_bready(M00_AXI_bready),
        .s_axi_araddr(M00_AXI_araddr[C_ADDR_WIDTH-1 : 0]),
        .s_axi_arprot(M00_AXI_arprot),
        .s_axi_arvalid(M00_AXI_arvalid),
        .s_axi_arready(M00_AXI_arready),
        .s_axi_rdata(M00_AXI_rdata),
        .s_axi_rresp(M00_AXI_rresp),
        .s_axi_rvalid(M00_AXI_rvalid),
        .s_axi_wready(M00_AXI_wready),
        .s_axi_bresp(M00_AXI_bresp),
        .s_axi_bvalid(M00_AXI_bvalid),
        .s_axi_awready(M00_AXI_awready)
	);

	proc_module_wrapper proc_module_wrapper_instance(
		.DDR_addr(DDR_addr),
		.DDR_ba(DDR_ba),
		.DDR_cas_n(DDR_cas_n),
		.DDR_ck_n(DDR_ck_n),
		.DDR_ck_p(DDR_ck_p),
		.DDR_cke(DDR_cke),
		.DDR_cs_n(DDR_cs_n),
		.DDR_dm(DDR_dm),
		.DDR_dq(DDR_dq),
		.DDR_dqs_n(DDR_dqs_n),
		.DDR_dqs_p(DDR_dqs_p),
		.DDR_odt(DDR_odt),
		.DDR_ras_n(DDR_ras_n),
		.DDR_reset_n(DDR_reset_n),
		.DDR_we_n(DDR_we_n),
		.FCLK_CLK0(FCLK_CLK0),
		.FCLK_RESET0_N(FCLK_RESET0_N),
		.FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
		.FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
		.FIXED_IO_mio(FIXED_IO_mio),
		.FIXED_IO_ps_clk(FIXED_IO_ps_clk),
		.FIXED_IO_ps_porb(FIXED_IO_ps_porb),
		.FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),

        // AXI connection        
        .M00_AXI_araddr(M00_AXI_araddr),
        .M00_AXI_arburst(M00_AXI_arburst),
        .M00_AXI_arcache(M00_AXI_arcache),
        .M00_AXI_arlen(M00_AXI_arlen),
        .M00_AXI_arlock(M00_AXI_arlock),
        .M00_AXI_arprot(M00_AXI_arprot),
        .M00_AXI_arqos(M00_AXI_arqos),
        .M00_AXI_arready(M00_AXI_arready),
        .M00_AXI_arsize(M00_AXI_arsize),
        .M00_AXI_arvalid(M00_AXI_arvalid),
        .M00_AXI_awaddr(M00_AXI_awaddr),
        .M00_AXI_awburst(M00_AXI_awburst),
        .M00_AXI_awcache(M00_AXI_awcache),
        .M00_AXI_awlen(M00_AXI_awlen),
        .M00_AXI_awlock(M00_AXI_awlock),
        .M00_AXI_awprot(M00_AXI_awprot),
        .M00_AXI_awqos(M00_AXI_awqos),
        .M00_AXI_awready(M00_AXI_awready),
        .M00_AXI_awsize(M00_AXI_awsize),
        .M00_AXI_awvalid(M00_AXI_awvalid),
        .M00_AXI_bready(M00_AXI_bready),
        .M00_AXI_bresp(M00_AXI_bresp),
        .M00_AXI_bvalid(M00_AXI_bvalid),
        .M00_AXI_rdata(M00_AXI_rdata),
        .M00_AXI_rlast(M00_AXI_rlast),
        .M00_AXI_rready(M00_AXI_rready),
        .M00_AXI_rresp(M00_AXI_rresp),
        .M00_AXI_rvalid(M00_AXI_rvalid),
        .M00_AXI_wdata(M00_AXI_wdata),
        .M00_AXI_wlast(M00_AXI_wlast),
        .M00_AXI_wready(M00_AXI_wready),
        .M00_AXI_wstrb(M00_AXI_wstrb),
        .M00_AXI_wvalid(M00_AXI_wvalid),
        .peripheral_aresetn(peripheral_aresetn)
	);

	sync_generator#()
	sync_generator_instance(
		.clk	(FCLK_CLK0),
		.rst_n	(FCLK_RESET0_N),
		.sync	(sync_gen)
	);
	
	IBUFDS #(
      .DIFF_TERM("FALSE"),       // Differential Termination
      .IBUF_LOW_PWR("TRUE"),     // Low power="TRUE", Highest performance="FALSE" 
      .IOSTANDARD("DEFAULT")     // Specify the input I/O standard
   ) IBUFDS_inst (
      .O(sync_single_ended),  	// Buffer output
      .I(sync_in_p),  			// Diff_p buffer input (connect directly to top-level port)
      .IB(sync_in_n) 			// Diff_n buffer input (connect directly to top-level port)
   );
   
   BUFG BUFG_inst (
      .O(sync), 				// 1-bit output: Clock output
      .I(sync_single_ended)  	// 1-bit input: Clock input
   );
	
    
endmodule
