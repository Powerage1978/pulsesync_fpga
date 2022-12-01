`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2022 02:32:17 PM
// Design Name: 
// Module Name: myip_v1_0_S00_AXI_tb
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


module myip_v1_0_S00_AXI_tb(
    );
    
    localparam C_S00_AXI_DATA_WIDTH = 32;
    localparam LOG2_BUFFER_SIZE = 5;
    localparam C_S00_AXI_ADDR_WIDTH	= LOG2_BUFFER_SIZE + 3;

    
    reg s00_axi_aclk;
    
    // Instantiation of Axi Bus Interface S00_AXI
	myip_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.LOG2_BUFFER_SIZE(LOG2_BUFFER_SIZE)
	) myip_v1_0_S00_AXI_dut (
		.enb(enb),
        .rstb(rstb),
        .regceb(regceb),
        .addrb(addrb),
        .doutb(doutb),
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);
	
	reg enb;
    reg rstb;
    reg regceb;
    reg [C_S00_AXI_DATA_WIDTH-1 : 0] doutb;
    reg [C_S00_AXI_ADDR_WIDTH-2 : 2] addrb;
	reg  s00_axi_aclk;
    reg  s00_axi_aresetn;
    reg [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr;
    wire [2 : 0] s00_axi_awprot;
    reg  s00_axi_awvalid;
    wire  s00_axi_awready;
    reg [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata;
    reg [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb;
    reg  s00_axi_wvalid;
    wire  s00_axi_wready;
    wire [1 : 0] s00_axi_bresp;
    wire  s00_axi_bvalid;
    reg  s00_axi_bready;
    reg [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr;
    wire [2 : 0] s00_axi_arprot;
    reg  s00_axi_arvalid;
    wire  s00_axi_arready;
    wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata;
    wire [1 : 0] s00_axi_rresp;
    wire  s00_axi_rvalid;
    reg  s00_axi_rready;
    
    initial begin
        s00_axi_aclk = 0;
        s00_axi_wstrb = 4'b1111;
    end
    
    always 
    #5 s00_axi_aclk = ~s00_axi_aclk;

    initial begin
       s00_axi_aresetn = 0;
       rstb = 1;
       s00_axi_bready = 0;
       #50
       s00_axi_aresetn = 1;
       rstb = 0;
       
       myip_v1_0_S00_AXI_tb.axi_write(0, 32'd127);
       myip_v1_0_S00_AXI_tb.enforce_axi_read(0, 32'd127);
       repeat (5) @(posedge s00_axi_aclk);
	   myip_v1_0_S00_AXI_tb.axi_write(2 ** (C_S00_AXI_ADDR_WIDTH - 1), 32'd255);
	   repeat (5) @(posedge s00_axi_aclk);
	   myip_v1_0_S00_AXI_tb.enforce_bram_read(2 ** (C_S00_AXI_ADDR_WIDTH - 1), 32'd255);
	   $display("Test done");
	end
	
	
	
	task automatic enforce_axi_read;
      input [C_S00_AXI_ADDR_WIDTH - 1 : 0] addr;
      input [C_S00_AXI_DATA_WIDTH - 1 : 0] expected_data;
      begin
        s00_axi_araddr = addr;
        s00_axi_arvalid = 1;
        s00_axi_rready = 1;
        wait(s00_axi_arready);
        wait(s00_axi_rvalid);
    
        if (s00_axi_rdata != expected_data) begin
          $display("Error: Mismatch in AXI4 read at %x: ", addr,
            "expected %x, received %x",
            expected_data, s00_axi_rdata);
        end
    
        @(posedge s00_axi_aclk) #1;
        s00_axi_arvalid = 0;
        s00_axi_rready = 0;
      end
    endtask
    
    task automatic enforce_bram_read;
      input [C_S00_AXI_ADDR_WIDTH - 1 : 0] addr;
      input [C_S00_AXI_DATA_WIDTH - 1 : 0] expected_data;
      begin
        $display("Running BRAM read test");
        
        @(posedge s00_axi_aclk) #1;
        enb = 1;
        regceb = 1;
        addrb = addr;
            
        repeat (3) @(posedge s00_axi_aclk);
        
    
        if (doutb != expected_data) begin
          $display("Error: Mismatch in BRAM read at %x: ", addr,
            "expected %x, received %x",
            expected_data, doutb);
        end

        @(posedge s00_axi_aclk) #1;
        enb = 0;
        regceb = 0;
      end
    endtask
    
    task automatic axi_write;
      input [C_S00_AXI_ADDR_WIDTH - 1 : 0] addr;
      input [C_S00_AXI_DATA_WIDTH - 1 : 0] data;
      begin
        s00_axi_wdata = data;
        s00_axi_awaddr = addr;
        s00_axi_awvalid = 1;
        s00_axi_wvalid = 1;
        wait(s00_axi_awready && s00_axi_wready);
        @(posedge s00_axi_aclk) #1;
        s00_axi_awvalid = 0;
        s00_axi_wvalid = 0;
        wait(s00_axi_bvalid);
        s00_axi_bready = 1;
        @(posedge s00_axi_aclk) #1;
        s00_axi_bready = 0;
      end
    endtask
endmodule
