`timescale 1ns / 1ps

module blockram_file_tb(
    );
    import axi4lite_pkg::*;
    import gatedriver_pkg::*;
    import sim_pkg::*;

    //localparam integer C_COUNT_SIZE = 25;
    //localparam integer C_IDX_SIZE = 4;
    //localparam integer C_OUTPUT_WIDTH = 4;
    //localparam integer C_WORD_SIZE = 32;
    //localparam integer C_NO_OF_STATES_OFFSET = 8;
    //localparam integer C_T_TOLERANCE = 100;
    //localparam integer C_STATUS_SIZE = 3;
    //localparam integer C_CLOCK_PERIOD = 20;
    //localparam C_HALF_PERIOD = C_CLOCK_PERIOD / 2;
    localparam C_SYNC_LENGTH = 10;

    logic [C_DATA_WIDTH-1 : 0] status;
    logic axi_aclk;
    logic enb;
    logic rstb;
    logic regceb;
    logic [C_DATA_WIDTH-1 : 0] doutb;
    logic [C_ADDR_WIDTH-2 : 2] addrb;
	  // reg  s00_axi_aclk;
    logic  axi_aresetn;
    logic [C_ADDR_WIDTH-1 : 0] axi_awaddr;
    logic [2 : 0] axi_awprot;
    logic axi_awvalid;
    logic axi_awready;
    logic [C_DATA_WIDTH-1 : 0] axi_wdata;
    logic [(C_DATA_WIDTH/8)-1 : 0] axi_wstrb;
    logic axi_wvalid;
    logic axi_wready;
    logic [1 : 0] axi_bresp;
    logic axi_bvalid;
    logic axi_bready;
    logic [C_ADDR_WIDTH-1 : 0] axi_araddr;
    logic [2 : 0] axi_arprot;
    logic xi_arvalid;
    logic axi_arready;
    logic [C_DATA_WIDTH-1 : 0] axi_rdata;
    logic [1 : 0] axi_rresp;
    logic axi_rvalid;
    logic axi_rready;
    logic sync;
    logic [C_WORD_SIZE-1 : 0]ctrl_reg;
    logic gate_output[C_OUTPUT_WIDTH];
    logic [C_STATUS_SIZE-1 : 0] state_dbg;

  axi4lite_bram #(
  ) axi4lite_bram_instance(
    .status_reg(status),
    .enb(enb),
	  .regceb(regceb),
	  .addrb(addrb),
	  .doutb(doutb),

    .s_axi_aclk(axi_aclk),
    .s_axi_aresetn(axi_aresetn),
    .s_axi_awaddr(axi_awaddr),
    .s_axi_awprot(axi_awprot),
    .s_axi_awvalid(axi_awvalid),
    .s_axi_rready(axi_rready),
    .s_axi_wdata(axi_wdata),
    .s_axi_wstrb(axi_wstrb),
    .s_axi_wvalid(axi_wvalid),
    .s_axi_bready(axi_bready),
    .s_axi_araddr(axi_araddr),
    .s_axi_arprot(axi_arprot),
    .s_axi_arvalid(axi_arvalid),
    .s_axi_arready(axi_arready),
    .s_axi_rdata(axi_rdata),
    .s_axi_rresp(axi_rresp),
    .s_axi_rvalid(axi_rvalid),
    .s_axi_wready(axi_wready),
    .s_axi_bresp(axi_bresp),
    .s_axi_bvalid(axi_bvalid),
    .s_axi_awready(axi_awready)
  );

  gate_driver #(
    .COUNT_SIZE(C_COUNT_SIZE),
    .IDX_SIZE(C_IDX_SIZE),
    .OUTPUT_WIDTH(C_OUTPUT_WIDTH),
    .WORD_SIZE(C_WORD_SIZE),
    .NO_OF_STATES_OFFSET(C_NO_OF_STATES_OFFSET),
    .T_TOLERANCE(C_T_TOLERANCE)
  ) gate_driver_instance(
    .clk(axi_aclk),
    .rst_n(axi_aresetn),
    .doutb(doutb),
    .ctrl_reg(ctrl_reg),
    .external_err(external_err),
    .addrb(addrb),
    .status(status),
    .enb(enb),
    .regceb(regceb),
    .state_dbg(state_dbg),
    .sync(sync),
    .gate_output_pin(gate_output)
  );
    
    initial begin
        axi_aclk = 0;
        axi_wstrb = 4'b1111;
    end
    
    always begin
        #(C_HALF_PERIOD)
        axi_aclk = ~axi_aclk;
    end

    initial begin
      sync = 1'b0;
       axi_aresetn = 0;
       rstb = 1;
       axi_bready = 0;
       ctrl_reg[C_NO_OF_STATES_OFFSET+C_IDX_SIZE-1 : C_NO_OF_STATES_OFFSET] = 8;
       repeat (5) @(negedge axi_aclk);
       ctrl_reg[0] = 1'b1;
       axi_aresetn = 1;
       rstb = 0;
       // status = 32'd63;

      #250
      sync = 1'b1;
      //200
      repeat (C_SYNC_LENGTH) @(negedge axi_aclk);
      sync = 1'b0;
      
      // #((25-0.2)*1000)
      repeat (1240) @(negedge axi_aclk);    // 0x050F = 0d1295; 1295 - 5 - 50 = 1240
      sync = 1'b1;
      // #200
      repeat (C_SYNC_LENGTH) @(negedge axi_aclk);
      sync = 1'b0;
      
      // #((500-25-0.2)*1000)
      repeat (23740) @(negedge axi_aclk);   // 0x5CF3 = 0d23795; 23795 - 5 - 50 = 23740
      sync = 1'b1;
      // #200
      repeat (C_SYNC_LENGTH) @(negedge axi_aclk);
      sync = 1'b0;

      // #((25-1-0.2)*1000)
      repeat (1190) @(negedge axi_aclk);   // 0x04DD = 0d1245; 1245 - 5 - 50 = 1190
      sync = 1'b1;
      // #200
      repeat (C_SYNC_LENGTH) @(negedge axi_aclk);
      sync = 1'b0;

      //#((1000-(500+25-1)-0.2)*1000)
      repeat (23790) @(negedge axi_aclk);   // 0x5D25 = 0d23845; 23845 - 5 - 50 = 23790
      sync = 1'b1;
      // #200
      repeat (C_SYNC_LENGTH) @(negedge axi_aclk);
      sync = 1'b0;

      // #((25-0.2)*1000)
      repeat (1240) @(negedge axi_aclk);    // 0x050F = 0d1295; 1295 - 5 - 50 = 1240
      sync = 1'b1;
      // #200
      repeat (C_SYNC_LENGTH) @(negedge axi_aclk);
      sync = 1'b0;
      
      // #((500-25-0.2)*1000)
      repeat (23740) @(negedge axi_aclk);   // 0x5CF3 = 0d23795; 23795 - 5 - 50 = 23740
      sync = 1'b1;
      // #200
      repeat (C_SYNC_LENGTH) @(negedge axi_aclk);
      sync = 1'b0;

      // #((25-1-0.2)*1000)
      repeat (1190) @(negedge axi_aclk);   // 0x04DD = 0d1245; 1245 - 5 - 50 = 1190
      sync = 1'b1;
      // #200
      repeat (C_SYNC_LENGTH) @(negedge axi_aclk);
      sync = 1'b0;

      // #((1000-(500+25-1)-0.2)*1000)
      repeat (23790) @(negedge axi_aclk);   // 0x5D25 = 0d23845; 23845 - 5 - 50 = 23790
      sync = 1'b1;
      // #200
      repeat (C_SYNC_LENGTH) @(negedge axi_aclk);
      sync = 1'b0;
      
	   $display("Test done");
     #200 $finish;
	end
	
	
	

endmodule
