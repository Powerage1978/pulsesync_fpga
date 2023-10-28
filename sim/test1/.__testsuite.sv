module __testsuite;
  import svunit_pkg::svunit_testsuite;

  string name = "__ts";
  svunit_testsuite svunit_ts;


  //===================================
  // These are the unit tests that we
  // want included in this testsuite
  //===================================
  adder_unit_test adder_ut();


  //===================================
  // Build
  //===================================
  function void build();
    adder_ut.build();
    svunit_ts = new(name);
    svunit_ts.add_testcase(adder_ut.svunit_ut);
  endfunction


  //===================================
  // Run
  //===================================
  task run();
    svunit_ts.run();
    adder_ut.run();
    svunit_ts.report();
  endtask

endmodule
