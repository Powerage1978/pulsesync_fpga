`timescale 1ns / 100ps

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
        rst_n = 1'b0;
        repeat (5) @(negedge clk);
        rst_n = 1'b1;
        //Reset the PL
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.fpga_soft_reset(32'h1);
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.fpga_soft_reset(32'h0);

        repeat (250000) @(negedge clk);
        $display("Test done");
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