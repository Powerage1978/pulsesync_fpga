`timescale 1ns / 100ps

/*
 * Instantiate modules on toplevel and maps the moduels I/O together.
 */

import axi4lite_pkg::*;
import gatedriver_pkg::*;
import zynq_interface_pkg::*;
import mem_map_pkg::*;

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

    // Sync generator
    output logic sync_gen,
    output logic sync_gen_n,

    // PSU control
    output logic curr_pwm,
    output logic volt_pwm,
    output logic psu_en,
    
    // External clock domain
    input logic sync_in,
    output logic gate_output_dbg[C_GATEDRIVE_WIDTH],
    output logic sync_a,
    output logic sync_b,
    output logic sync_k
    );

    // Local parameters

    // Logic definitions
    logic sync_out;
    logic sync_signal;
    logic gate_output[C_GATEDRIVE_WIDTH];

    logic system_mode;
    
    // Proc module
    logic FCLK_CLK0;
    logic FCLK_RESET0_N;

    // Gate driver
    logic [C_DATA_WIDTH-1:0] ctrl_reg;
    logic [C_DATA_WIDTH-1:0] pulsesync_status;
    logic [C_DATA_WIDTH-1:0] pulsesync_ctrl;

    // BRAM/Gatedriver interface
    logic enb;
    logic regceb;
    logic [C_BRAM_REG_ADDR_BITS-1:0]addrb;
    logic [C_DATA_WIDTH-1:0]doutb;
    
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
    logic [2:0]M00_AXI_arprot;
    logic [2:0]M00_AXI_awprot;
    logic [31:0]M00_AXI_araddr;
    logic [31:0]M00_AXI_awaddr;
    logic [31:0]M00_AXI_wdata;
    logic [3:0]M00_AXI_wstrb;
    logic M00_AXI_ACLK;
    logic M00_AXI_arready;
    logic M00_AXI_awready;
    logic M00_AXI_bvalid;
    logic M00_AXI_rvalid;
    logic M00_AXI_wready;
    logic [11:0]M00_AXI_bid;
    logic [11:0]M00_AXI_rid;
    logic [1:0]M00_AXI_bresp;
    logic [1:0]M00_AXI_rresp;
    logic [31:0]M00_AXI_rdata;

    // DCDC setup
    logic [C_DATA_WIDTH-1 : 0] pwm_control;
    logic [C_DATA_WIDTH-1 : 0] pwm_status;
    logic [C_DATA_WIDTH-1 : 0] pwm_val;

    // Test generator
    logic [C_DATA_WIDTH-1:0]gen_ctrl;
    logic [C_DATA_WIDTH-1:0]gen_status;

    // Async reset
    logic asyncrst_n;
    logic rst_n;

    // Assignemnts
    assign sync_a = gate_output[0];
    assign sync_b = gate_output[1];
    assign sync_k = gate_output[2];

    generate
        genvar i;
        for (i = 0; i < C_GATEDRIVE_WIDTH; i++) begin
            assign gate_output_dbg[i] = (gate_output[i] == 1'b0) ? 1'b1 : 1'b0; // Reverts the output from gate driver for measurement on pins
        end
    endgenerate
    

    async_reset #(

    ) async_reset_instance(
        .clk(FCLK_CLK0),
        .asyncrst_n(FCLK_RESET0_N),
        .rst_n(asyncrst_n)
    );

    gate_driver #(

    ) gate_driver_instance(
        .clk(FCLK_CLK0),
        .rst_n	        (rst_n),
        .doutb(doutb),
        .ctrl_reg(pulsesync_ctrl),
        .addrb(addrb),
        .status(pulsesync_status),
        .enb(enb),
        .regceb(regceb),
        .mode(system_mode),
        .sync(~sync_out),
        .gate_output_pin(gate_output)
    );

    pulsesync_memory_block #(

    ) pulsesync_memory_block_instance(
        .s_axi_aclk(FCLK_CLK0),
        .s_axi_aresetn(rst_n),
        .pulsesync_status(pulsesync_status),
        .pulsesync_ctrl(pulsesync_ctrl),
        .gen_status    (gen_status),
        .gen_ctrl       (gen_ctrl),
        .pwm_status(pwm_status),
        .pwm_ctrl(pwm_control),
        .pwm_val(pwm_val),
        .addrb(addrb),
        .doutb(doutb),
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
        .M00_AXI_arprot(M00_AXI_arprot),
        .M00_AXI_arready(M00_AXI_arready),
        .M00_AXI_arvalid(M00_AXI_arvalid),
        .M00_AXI_awaddr(M00_AXI_awaddr),
        .M00_AXI_awprot(M00_AXI_awprot),
        .M00_AXI_awready(M00_AXI_awready),
        .M00_AXI_awvalid(M00_AXI_awvalid),
        .M00_AXI_bready(M00_AXI_bready),
        .M00_AXI_bresp(M00_AXI_bresp),
        .M00_AXI_bvalid(M00_AXI_bvalid),
        .M00_AXI_rdata(M00_AXI_rdata),
        .M00_AXI_rready(M00_AXI_rready),
        .M00_AXI_rresp(M00_AXI_rresp),
        .M00_AXI_rvalid(M00_AXI_rvalid),
        .M00_AXI_wdata(M00_AXI_wdata),
        .M00_AXI_wready(M00_AXI_wready),
        .M00_AXI_wstrb(M00_AXI_wstrb),
        .M00_AXI_wvalid(M00_AXI_wvalid),
        .peripheral_aresetn(peripheral_aresetn)
    );

    dcdc#()
    dcdc_instance(
        .clk			(FCLK_CLK0),
        .rst_n	        (rst_n),
        .pwm_control	(pwm_control),
        .mode           (system_mode),
        .pwm_status     (pwm_status),
        .pwm_out_curr	(curr_pwm),
        .pwm_out_volt	(volt_pwm),
        .pwm_val        (pwm_val),
        .ena_psu		(psu_en)
    );

    sync_generator#()
    sync_generator_instance(
        .clk	        (FCLK_CLK0),
        .rst_n	        (rst_n),
        .gen_ctrl       (gen_ctrl),
        .gen_status     (gen_status),
        .sync_signal    (sync_gen),
        .sync_signal_n  (sync_gen_n)
    );
   
   BUFG BUFG_sync_inst (
      .O(sync_out),     // 1-bit output: Clock output
      .I(sync_in)       // 1-bit input: Clock input
   );

   BUFG BUFG_rst_instance (
      .O(rst_n),
      .I(asyncrst_n)
   );
    
endmodule
