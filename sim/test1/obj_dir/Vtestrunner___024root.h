// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtestrunner.h for the primary calling header

#ifndef VERILATED_VTESTRUNNER___024ROOT_H_
#define VERILATED_VTESTRUNNER___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
class Vtestrunner_adder_unit_test;
class Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x560a83c57040;
class Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x560a83c57040__Vclpkg;
class Vtestrunner_junit_xml;
class Vtestrunner_junit_xml__03a__03aTestCase__Vclpkg;
class Vtestrunner_junit_xml__03a__03aTestSuite__Vclpkg;
class Vtestrunner_junit_xml__03a__03aXmlElement__Vclpkg;
class Vtestrunner_svunit_pkg;
class Vtestrunner_svunit_pkg__03a__03afilter;
class Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg;
class Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg;
class Vtestrunner_svunit_pkg__03a__03astring_utils__Vclpkg;
class Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg;
class Vtestrunner_svunit_pkg__03a__03asvunit_testcase;
class Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg;
class Vtestrunner_svunit_pkg__03a__03asvunit_testrunner;
class Vtestrunner_svunit_pkg__03a__03asvunit_testrunner__Vclpkg;
class Vtestrunner_svunit_pkg__03a__03asvunit_testsuite;
class Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg;


class Vtestrunner__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtestrunner___024root final : public VerilatedModule {
  public:
    // CELLS
    Vtestrunner_junit_xml* __PVT__junit_xml;
    Vtestrunner_svunit_pkg* __PVT__svunit_pkg;
    Vtestrunner_adder_unit_test* __PVT__testrunner__DOT_____05Fts__DOT__adder_ut;
    Vtestrunner_junit_xml__03a__03aXmlElement__Vclpkg* junit_xml__03a__03aXmlElement__Vclpkg;
    Vtestrunner_junit_xml__03a__03aTestCase__Vclpkg* junit_xml__03a__03aTestCase__Vclpkg;
    Vtestrunner_junit_xml__03a__03aTestSuite__Vclpkg* junit_xml__03a__03aTestSuite__Vclpkg;
    Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x560a83c57040__Vclpkg* adder_unit_test__03a__03a__VDynScope__test0__0x560a83c57040__Vclpkg;
    Vtestrunner_svunit_pkg__03a__03astring_utils__Vclpkg* svunit_pkg__03a__03astring_utils__Vclpkg;
    Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg* svunit_pkg__03a__03asvunit_base__Vclpkg;
    Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg* svunit_pkg__03a__03asvunit_testcase__Vclpkg;
    Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg* svunit_pkg__03a__03asvunit_testsuite__Vclpkg;
    Vtestrunner_svunit_pkg__03a__03asvunit_testrunner__Vclpkg* svunit_pkg__03a__03asvunit_testrunner__Vclpkg;
    Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg* svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg;
    Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg* svunit_pkg__03a__03afilter__Vclpkg;

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ __Vtrigprevexpr___TOP__testrunner__DOT_____05Fts__DOT__adder_ut__async_reset_n__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__testrunner__DOT_____05Fts__DOT__adder_ut__clk__0;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlTriggerScheduler __VtrigSched_h1afa9c2d__0;
    VlDelayScheduler __VdlySched;
    VlForkSync __Vfork_2__sync;
    VlForkSync __Vfork_1__sync;
    VlDynamicTriggerScheduler __VdynSched;
    VlTriggerVec<4> __VactTriggered;
    VlTriggerVec<4> __VnbaTriggered;
    VlClassRef<Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x560a83c57040> __Vtask_run__11__test0__DOT____VDynScope_test0;

    // INTERNAL VARIABLES
    Vtestrunner__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtestrunner___024root(Vtestrunner__Syms* symsp, const char* v__name);
    ~Vtestrunner___024root();
    VL_UNCOPYABLE(Vtestrunner___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
