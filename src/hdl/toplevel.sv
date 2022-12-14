`timescale 1ns / 1ps

module toplevel #(
    parameter C_S_AXI_DATA_WIDTH = 32,
    parameter LOG2_BUFFER_SIZE = 5,
    parameter C_S_AXI_ADDR_WIDTH	= LOG2_BUFFER_SIZE + 3,
	parameter integer COUNT_SIZE = 25,
	parameter integer IDX_SIZE = 4,
	parameter integer OUTPUT_WIDTH = 4,
	parameter integer WORD_SIZE = 32,
	parameter integer NO_OF_STATES_OFFSET = 8,
	parameter integer T_TOLERANCE = 24,
	parameter integer STATUS_SIZE = 3
)
(
        // Internal clock domain
        output logic [STATUS_SIZE-1:0]state_dbg,
        output logic clk_dbg,
        output logic sync_dbg,
        
		// External clock domain
        input logic sync_in_n,
        input logic sync_in_p,
        output logic gate_output[OUTPUT_WIDTH]
        );

    /*
	localparam C_S_AXI_DATA_WIDTH = 32;
    localparam LOG2_BUFFER_SIZE = 5;
    localparam C_S_AXI_ADDR_WIDTH	= LOG2_BUFFER_SIZE + 3;
	localparam integer COUNT_SIZE = 25;
	localparam integer IDX_SIZE = 4;
	localparam integer OUTPUT_WIDTH = 4;
	localparam integer WORD_SIZE = 32;
	localparam integer NO_OF_STATES_OFFSET = 8;
	localparam integer T_TOLERANCE = 10;
	*/


    logic sync_single_ended;
    logic sync;
    
    // Proc module
	
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
	logic FCLK_CLK0;
	logic FCLK_RESET0_N;
	logic FIXED_IO_ddr_vrn;
	logic FIXED_IO_ddr_vrp;
	logic FIXED_IO_mio;
	logic FIXED_IO_ps_clk;
	logic FIXED_IO_ps_porb;
	logic FIXED_IO_ps_srstb;
	// logic M_AXI_GP0_ACLK;
	

    // Gate driver
	logic external_err;
	logic [WORD_SIZE-1:0] ctrl_reg;
	
	// Myip axi
	logic [WORD_SIZE-1:0]status;
	logic enb;
	logic rstb;
	logic regceb;
	logic [IDX_SIZE:0]addrb;
	logic [WORD_SIZE-1:0]doutb;
	
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
    logic [WORD_SIZE-1 : 0] S_AXI_RDATA;
    logic [1 : 0] S_AXI_RRESP;
    logic S_AXI_RVALID;
    logic S_AXI_RREADY;
    
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
    assign ctrl_reg[NO_OF_STATES_OFFSET+IDX_SIZE-1 : NO_OF_STATES_OFFSET] = 4;
    assign ctrl_reg[0] = 1'b1;
    
    assign clk_dbg = FCLK_CLK0;
    assign sync_dbg = sync;
    
	gate_driver #(
		.COUNT_SIZE(COUNT_SIZE),
		.IDX_SIZE(IDX_SIZE),
		.OUTPUT_WIDTH(OUTPUT_WIDTH),
		.WORD_SIZE(WORD_SIZE),
		.NO_OF_STATES_OFFSET(NO_OF_STATES_OFFSET),
		.T_TOLERANCE(T_TOLERANCE)
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
		.sync(sync),
		.gate_output(gate_output)
	);

	myip_v1_0_S00_AXI #(
		.LOG2_BUFFER_SIZE(LOG2_BUFFER_SIZE),
		.C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
	) myip_v1_0_S00_AXI_instance(
	    .status(status),
		.enb(enb),
		.rstb(rstb),
		.regceb(regceb),
		.addrb(addrb),
		.doutb(doutb),
		.S_AXI_ACLK(FCLK_CLK0),
		.S_AXI_ARESETN(FCLK_RESET0_N),
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
	
	IBUFDS #(
      .DIFF_TERM("FALSE"),       // Differential Termination
      .IBUF_LOW_PWR("TRUE"),     // Low power="TRUE", Highest performance="FALSE" 
      .IOSTANDARD("DEFAULT")     // Specify the input I/O standard
   ) IBUFDS_inst (
      .O(sync_single_ended),  // Buffer output
      .I(sync_in_p),  // Diff_p buffer input (connect directly to top-level port)
      .IB(sync_in_n) // Diff_n buffer input (connect directly to top-level port)
   );
   
   BUFG BUFG_inst (
      .O(sync), // 1-bit output: Clock output
      .I(sync_single_ended)  // 1-bit input: Clock input
   );
	
    
endmodule
