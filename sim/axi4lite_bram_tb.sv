`timescale 1ns / 1ps

module axi4lite_bram_tb (

);
    import axi4lite_pkg::*;

    localparam C_HALF_PERIOD = 5;

    localparam C_CTRL_REG = 0; 
    localparam C_STATUS_REG = 4; 

    logic clk;
    logic rst_n;
    logic [C_ADDR_WIDTH-1 : 0] axi_awaddr;
    logic [2 : 0] axi_awprot;
    logic axi_awvalid;
    logic axi_rready;
    logic [C_DATA_WIDTH-1 : 0] axi_wdata;
    logic [(C_DATA_WIDTH/8)-1 : 0] axi_wstrb;
    logic axi_wvalid;
    logic axi_bready;
    logic [C_ADDR_WIDTH-1 : 0] axi_araddr;
    logic [2 : 0] axi_arprot;
    logic axi_arvalid;
    logic axi_arready;
    logic [C_DATA_WIDTH-1 : 0] axi_rdata;
    logic [1 : 0] axi_rresp;
    logic axi_rvalid;
    logic axi_wready;
    logic [1 : 0] axi_bresp;
    logic axi_bvalid;
    logic axi_awready;

    logic [C_DATA_WIDTH-1 : 0] status;
    logic [C_DATA_WIDTH-1 : 0] doutb;
    logic enb;
    logic regceb;

    axi4lite_bram #(
    ) axi4lite_bram_instance(
        .s_axi_aclk(clk),
        .s_axi_aresetn(rst_n),
        .doutb(doutb),
        .status_reg(status),
        .enb(enb),
        .regceb(regceb),
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

    // Clock generation
    initial begin
        clk <= 0;
        forever #(C_HALF_PERIOD) clk = ~clk;
    end

    
    // Reset generation
    initial begin
        rst_n = 1'b0;
        axi_awvalid = 1'b0;
        axi_wvalid = 1'b0;
        axi_bready = 1'b0;
        status = 32'b0;
        #100
        rst_n = 1'b1;
        axi_wstrb = 4'b1111;
    end

    // Test stimuli
    initial begin
        wait(rst_n);
        axi4lite_bram_tb.axi_write(C_CTRL_REG, 32'd63);
        //axi4lite_bram_tb.axi_write(C_STATUS_REG, 32'd127);
        status = 32'd127;
        axi4lite_bram_tb.enforce_axi_read(C_CTRL_REG, 32'd63);
        repeat (3) @(posedge clk);
        axi4lite_bram_tb.enforce_axi_read(C_STATUS_REG, 32'd127);
        /*
        for(int i = 0; i < 32; i++)
        begin
            repeat (3) @(posedge clk);
            axi4lite_bram_tb.axi_write(2 ** (C_ADDR_WIDTH - 1) + (i * 4), i);
            repeat (3) @(posedge clk);
            axi4lite_bram_tb.enforce_bram_read(i, i);
        end
        */
	    $display("Test done");
        #200 $finish;
    end

	task automatic enforce_axi_read;
      input [C_ADDR_WIDTH - 1 : 0] addr;
      input [C_DATA_WIDTH - 1 : 0] expected_data;
      begin
        $display("Running axi read test begin");
        axi_araddr = addr;
        axi_arvalid = 1;
        axi_rready = 1;
        wait(axi_arready);
        wait(axi_rvalid);
    
        if (axi_rdata != expected_data) begin
            $display("Error: Mismatch in AXI4 read at %x: ", addr,
            "expected %x, received %x",
            expected_data, axi_rdata);
        end
    
        @(posedge clk) #1;
        axi_arvalid = 0;
        axi_rready = 0;
        $display("Running axi read test end");
      end
    endtask
    
    task automatic axi_write;
      input [C_ADDR_WIDTH - 1 : 0] addr;
      input [C_DATA_WIDTH - 1 : 0] data;
      begin
        $display("Running axi write test begin");
        axi_wdata = data;
        axi_awaddr = addr;
        axi_awvalid = 1;
        axi_wvalid = 1;
        wait(axi_awready && axi_wready);
        @(posedge clk) #1;
        axi_awvalid = 0;
        axi_wvalid = 0;
        wait(axi_bvalid);
        axi_bready = 1;
        @(posedge clk) #1;
        axi_bready = 0;
        $display("Running axi write test end");
      end
    endtask
endmodule