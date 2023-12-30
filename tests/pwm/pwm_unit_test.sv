`include "svunit_defines.svh"
`include "../../src/hdl/sys_pkg.sv"
`include "../../src/hdl/axi4lite_pkg.sv"
`include "../../src/hdl/mem_map_pkg.sv"
`include "../../src/hdl/async_rst.sv"
`include "../../src/hdl/pwm.sv"
// `include "clk_and_reset.svh"

`timescale 1ns / 100ps

module pwm_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "pwm_ut";
  svunit_testcase svunit_ut;

  localparam C_HALF_PERIOD = 5;

  //===================================
  // This is the UUT that we're
  // running the Unit Tests on
  //===================================

  logic clk;                                  // Clock signal
  logic rst_n;                                // Reset, active low
  logic enable;                               // Enable signal, active high
  logic [C_PWM_VAL_DUTY_SIZE-1 : 0]pwm_duty;  // PWM duty cycle
  logic pwm_out;                              // PWM output bit
  logic [C_PWM_STATUS_INFO_SIZE-1 : 0]status; // PWM current status

  pwm dut_pwm(
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .pwm_duty(pwm_duty),
    .pwm_out(pwm_out),
    .status(status)
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
//     a = 3;
//     b = 7;
//     valid = 1;



//     #1 `FAIL_IF(c !== 10)
  `SVTEST_END


  `SVUNIT_TESTS_END

endmodule
