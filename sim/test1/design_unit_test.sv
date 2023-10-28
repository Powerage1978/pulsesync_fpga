`include "svunit_defines.svh"
`include "design.sv"
// `include "clk_and_reset.svh"

module adder_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "adder_ut";
  svunit_testcase svunit_ut;

  localparam C_HALF_PERIOD = 5;

  //===================================
  // This is the UUT that we're
  // running the Unit Tests on
  //===================================
  logic         clk;
  logic         async_reset_n;
  logic   [3:0] a;
  logic   [3:0] b;
  logic         valid;
  logic   [4:0] c;
  adder my_adder(.clk(clk),
                 .async_reset_n(async_reset_n),
                 .a(a),
                 .b(b),
                 .valid(valid),
                 .c(c));
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
    async_reset_n = 0;
    repeat (8) @(posedge clk);
    async_reset_n = 1;

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
    a = 3;
    b = 7;
    valid = 1;



    #1 `FAIL_IF(c !== 10)
  `SVTEST_END


  `SVUNIT_TESTS_END

endmodule
