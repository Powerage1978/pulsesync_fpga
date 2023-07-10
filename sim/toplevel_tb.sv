`timescale 1ns / 100ps

/*
 * Simple test on top level that reads and write to select addresses mapped
 * into BRAM. 
 */

module toplevel_tb(
    );

    import sim_pkg::*;
    import axi4lite_pkg::*;
    import gatedriver_pkg::*;

    logic [C_STATUS_SIZE-1 : 0]state_dbg;
    logic clk_dbg;
    logic sync_dbg;
    logic sync_in;
    logic gate_output_dbg[C_OUTPUT_WIDTH];
    logic sync_a;
    logic sync_b;
	logic sync_k;

    logic curr_pwm;
	logic volt_pwm;
	logic psu_en;
    
    logic rs232_rx;
	logic rs232_tx;
	logic rs232_dir;
	logic fault;

    logic clk;
    logic rst_n;
    
    logic [31:0] read_data;
    logic resp;

    // logic temp_clk;
    wire temp_clk;
    wire temp_rst_n;

    initial begin
        clk = 0;
    end
    
    always begin
        #(C_HALF_PERIOD)
        clk = ~clk;
    end

    initial begin
        $display("Test begin");
        rst_n = 1'b0;
        repeat (5) @(negedge clk);
        rst_n = 1'b1;
        repeat (5) @(negedge clk);
        //Reset the PL
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.fpga_soft_reset(32'h1);
        repeat (20) @(negedge clk);
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.fpga_soft_reset(32'h0);
        
        $display("Toplevel write");
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(32'h43C00000,4, 32'h01020304, resp);
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(32'h43C00080,4, 32'h0A0A0A0A, resp);
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(32'h43C00084,4, 32'h0B0B0B0B, resp);
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(32'h43C00088,4, 32'h0C0C0C0C, resp);
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(32'h43C0008C,4, 32'h0D0D0D0D, resp);

        $display("Toplevel read");
        for (int i = 0; i < 64; i++) begin
            int j = 'h43C00000 + (i << 2); 
            toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.read_data(j,4,read_data,resp);
            $display ("%t, running the testbench, data read from BRAM was 32'h%x",$time, read_data);
        end
        repeat (250000) @(negedge clk); // When enabled, can bu used to debug pulsesync test -> needs to run for a longer time to validate timing
        $display("Test done");
        $stop;
        #200 $finish;
    end

    assign temp_clk = clk;
    assign temp_rst_n = rst_n;

    toplevel#()
    toplevel_instance(
        // ZYNQ interface
        .DDR_addr(),
		.DDR_ba(),
		.DDR_cas_n(),
		.DDR_ck_n(),
		.DDR_ck_p(),
		.DDR_cke(),
		.DDR_cs_n(),
		.DDR_dm(),
		.DDR_dq(),
		.DDR_dqs_n(),
		.DDR_dqs_p(),
		.DDR_odt(),
		.DDR_ras_n(),
		.DDR_reset_n(),
		.DDR_we_n(),
		.FIXED_IO_ddr_vrn(),
		.FIXED_IO_ddr_vrp(),
		.FIXED_IO_mio(),
		.FIXED_IO_ps_clk(temp_clk),
		.FIXED_IO_ps_porb(temp_rst_n),
		.FIXED_IO_ps_srstb(temp_rst_n),

        // Internal clock domain
        .state_dbg      (state_dbg),
        .clk_dbg        (clk_dbg),
        .sync_dbg       (sync_dbg),
        .rs232_rx       (rs232_rx),
	    .rs232_tx       (rs232_tx),
	    .rs232_dir      (rs232_dir),
	    .fault          (fault),

        // PSU control
	    .curr_pwm       (curr_pwm),
	    .volt_pwm       (volt_pwm),
	    .psu_en         (psu_en),
        
        // External clock domain
        .sync_in        (sync_in),
        .gate_output_dbg(gate_output_dbg),
	    .sync_a         (sync_a),
        .sync_b         (sync_b),
	    .sync_k         (sync_k)
    );

endmodule