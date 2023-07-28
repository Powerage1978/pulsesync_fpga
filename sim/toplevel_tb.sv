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
    import mem_map_pkg::*;

    logic sync_gen;
    logic sync_gen_n;
    logic sync_in;
    logic gate_output_dbg[C_GATEDRIVE_WIDTH];
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

    wire temp_clk;
    wire temp_rst_n;

    localparam C_BASE_ADDR      = 32'h43C00000;
    localparam C_RW_BYTE_SIZE   = 4;
    localparam C_BRAM_BASE      = 'd32;

    assign sync_in = sync_gen_n;
    // assign sync_in = sync_gen;

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
        repeat (20) @(negedge clk);
        rst_n = 1'b1;
        repeat (5) @(negedge clk);
        //Reset the PL
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.fpga_soft_reset(32'h1);
        repeat (20) @(negedge clk);
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.fpga_soft_reset(32'h0);
        
        repeat (1000) @(negedge clk);

        $display("Toplevel write to BRAM");
        // Base_period: 1538.4
        // hm_ontime: 400
        // Kickin: 11
        // Kickout: 15
        // pulse_sync_damping_setuptime: 3
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 0) << 2), C_RW_BYTE_SIZE, 32'h00000008, resp);  // Control word defining number of id pairs
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 1) << 2), C_RW_BYTE_SIZE, 32'h00000000, resp);  // Spare control word
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 2) << 2), C_RW_BYTE_SIZE, 32'h0000dc07, resp);  // 
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 3) << 2), C_RW_BYTE_SIZE, 32'h00000015, resp);  // A, K, DCDC
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 4) << 2), C_RW_BYTE_SIZE, 32'h0000022d, resp);  // 
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 5) << 2), C_RW_BYTE_SIZE, 32'h00000011, resp);  // A, DCDC
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 6) << 2), C_RW_BYTE_SIZE, 32'h00004c01, resp);  // 
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 7) << 2), C_RW_BYTE_SIZE, 32'h00000010, resp);  // DCDC
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 8) << 2), C_RW_BYTE_SIZE, 32'h0000025f, resp);  // 
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 9) << 2), C_RW_BYTE_SIZE, 32'h00000014, resp);  // Damper, DCDC
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 10) << 2), C_RW_BYTE_SIZE, 32'h0000dc07, resp); // 
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 11) << 2), C_RW_BYTE_SIZE, 32'h00000016, resp); // B, K, DCDC
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 12) << 2), C_RW_BYTE_SIZE, 32'h0000022d, resp); // 
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 13) << 2), C_RW_BYTE_SIZE, 32'h00000012, resp); // B, DCDC
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 14) << 2), C_RW_BYTE_SIZE, 32'h00004c01, resp); // 
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 15) << 2), C_RW_BYTE_SIZE, 32'h00000010, resp); // DCDC
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 16) << 2), C_RW_BYTE_SIZE, 32'h0000025f, resp); // 
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + ((C_BRAM_BASE + 17) << 2), C_RW_BYTE_SIZE, 32'h00000014, resp); // Damper, DCDC

        $display("Toplevel read");
        for (int i = 0; i < 64; i++) begin
            automatic int j = 'h43C00000 + (i << 2); 
            toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.read_data(j,4,read_data,resp);
            repeat (250) @(negedge clk);
            $display ("%t, running the testbench, data read from BRAM was 32'h%x",$time, read_data);
        end

        repeat (250) @(negedge clk);
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + (C_PWM_CTRL_ADDR << 2), C_RW_BYTE_SIZE, 32'h00000005, resp);  // enable curr_pwm
        repeat (250) @(negedge clk);
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + (C_PWM_VAL_ADDR << 2), C_RW_BYTE_SIZE, 32'h503C2814, resp);  // pwm_value setup
        repeat (250) @(negedge clk);
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + (C_CONTROL_ADDR << 2), C_RW_BYTE_SIZE, 32'h00000001, resp);  // Arm gate driver and set number of id's
        repeat (250) @(negedge clk);
        toplevel_tb.toplevel_instance.proc_module_wrapper_instance.proc_module_i.processing_system7_0.inst.write_data(C_BASE_ADDR + (C_GEN_CTRL_ADDR << 2), C_RW_BYTE_SIZE, 32'h00000001, resp);  // enable generator

        repeat (2500000) @(negedge clk);
        
        // repeat (250000) @(negedge clk); // When enabled, can bu used to debug pulsesync test -> needs to run for a longer time to validate timing
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
        .sync_gen       (sync_gen),
        .sync_gen_n     (sync_gen_n),

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
