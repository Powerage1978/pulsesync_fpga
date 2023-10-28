// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtestrunner.h for the primary calling header

#ifndef VERILATED_VTESTRUNNER_ADDER_UNIT_TEST_H_
#define VERILATED_VTESTRUNNER_ADDER_UNIT_TEST_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
class Vtestrunner_svunit_pkg__03a__03asvunit_testcase;


class Vtestrunner__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtestrunner_adder_unit_test final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ clk;
    CData/*0:0*/ async_reset_n;
    CData/*3:0*/ a;
    CData/*3:0*/ b;
    CData/*0:0*/ valid;
    CData/*4:0*/ __PVT__my_adder__DOT__tmp_c;
    VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testcase> svunit_ut;

    // INTERNAL VARIABLES
    Vtestrunner__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtestrunner_adder_unit_test(Vtestrunner__Syms* symsp, const char* v__name);
    ~Vtestrunner_adder_unit_test();
    VL_UNCOPYABLE(Vtestrunner_adder_unit_test);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
