`include "svunit_defines.svh"
`include "../../src/hdl/sys_pkg.sv"
`include "../../src/hdl/axi4lite_pkg.sv"
`include "../../src/hdl/mem_map_pkg.sv"
`include "../../src/hdl/async_rst.sv"
`include "../../src/hdl/pwm.sv"
`include "../../src/hdl/dcdc.sv"
// `include "clk_and_reset.svh"

`timescale 1ns / 100ps

module dcdc_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "dcdc_ut";
  svunit_testcase svunit_ut;

  localparam C_HALF_PERIOD = 5;

  //===================================
  // This is the UUT that we're
  // running the Unit Tests on
  //===================================



  logic clk;                                // Clock
  logic rst_n;                              // Reset, active low
  logic [C_DATA_WIDTH-1 : 0] pwm_control;   // PWM control word
  logic mode;                               // System mode, inactive or active
  logic [C_DATA_WIDTH-1 : 0] pwm_val;       // PWM value word
  logic [C_DATA_WIDTH-1 : 0] pwm_status;   // WPM status word
  logic pwm_out_curr;                      // Current PWM output
  logic pwm_out_volt;                      // Voltage PWM output
  logic ena_psu;                           // PSU enable bit

  dcdc dut_dcdc(
    .clk(clk),
    .rst_n(rst_n),
    .pwm_control(pwm_control),
    .mode(mode),
    .pwm_val(pwm_val),
    .pwm_status(pwm_status),
    .pwm_out_curr(pwm_out_curr),
    .pwm_out_volt(pwm_out_volt),
    .ena_psu(ena_psu)
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
