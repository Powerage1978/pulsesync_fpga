`include "svunit_defines.svh"
`include "../../src/hdl/sys_pkg.sv"
`include "../../src/hdl/axi4lite_pkg.sv"
`include "../../src/hdl/mem_map_pkg.sv"
`include "../../src/hdl/async_rst.sv"
`include "../../src/hdl/pwm.sv"
`include "../../src/hdl/gatedriver_pkg.sv"
`include "../../src/hdl/gatedriver.sv"
// `include "clk_and_reset.svh"

`timescale 1ns / 100ps

module gatedriver_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "gatedriver_ut";
  svunit_testcase svunit_ut;

  localparam C_HALF_PERIOD = 5;

  //===================================
  // This is the UUT that we're
  // running the Unit Tests on
  //===================================

    logic clk;                                // Clock signal
    logic rst_n;                              // Reset, active low
    logic [C_DATA_WIDTH-1:0] doutb;           // Output word from BRAM
    logic [C_DATA_WIDTH-1:0] ctrl_reg;        // Control register
    logic [C_BRAM_REG_ADDR_BITS-1:0] addrb;  // Addres to read from BRAM region
    logic [C_DATA_WIDTH-1:0] status;         // Status register
    logic enb;                               // BRAM enable signal
    logic regceb;                            // BRAM output register enable
    logic mode;                              // Mode indicator, inactive or active. Active is when loacked with sync pulse

    // External clock domain
    logic sync;                               // Sync pulse from TS
    logic gate_output_pin[C_GATEDRIVE_WIDTH]; // Driver for resistor gates


  gatedriver dut_gatedriver(
    .clk(clk),
    .rst_n(rst_n),
    .doutb(doutb),
    .ctrl_reg(ctrl_reg),
    .addrb(addrb),
    .status(status),
    .enb(enb),
    .regceb(regceb),
    .mode(mode),
    .sync(sync),
    .gate_output_pin(gate_output_pin)
  );

//  initial begin
//    clk = 0;
//    forever #(C_HALF_PERIOD) clk = ~clk;
//  end

// clk generator
  initial begin
    clk = 0;
    forever begin
      #(C_HALF_PERIOD) clk = ~clk;
    end
  end

  //===================================
  // Build
  //===================================
  function void build();
    svunit_ut = new(name);
  endfunction


  //===================================
  // Setup for running the Unit Tests
  //===================================
  task setup();
    svunit_ut.setup();
    /* Place Setup Code Here */

    //-----------------------------
    // then do a reset for the uut
    //-----------------------------
    rst_n = 0;
    repeat (8) @(posedge clk);
    rst_n = 1;

    //async_reset_n = 1'b0;
    //repeat (5) @(posedge clk)
    //async_reset_n = 1'b1;

  endtask


  //===================================
  // Here we deconstruct anything we
  // need after running the Unit Tests
  //===================================
  task teardown();
    svunit_ut.teardown();
    /* Place Teardown Code Here */

  endtask


  //===================================
  // All tests are defined between the
  // SVUNIT_TESTS_BEGIN/END macros
  //
  // Each individual test must be
  // defined between `SVTEST(_NAME_)
  // `SVTEST_END
  //
  // i.e.
  //   `SVTEST(mytest)
  //     <test code>
  //   `SVTEST_END
  //===================================
  `SVUNIT_TESTS_BEGIN

  `SVTEST(test0)

  `SVTEST_END


  `SVUNIT_TESTS_END

endmodule
