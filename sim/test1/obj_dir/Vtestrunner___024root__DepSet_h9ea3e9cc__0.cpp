// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner___024root.h"
#include "Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x55f8515e68f0__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testrunner__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg.h"

VlCoroutine Vtestrunner___024root___eval_initial__TOP__0____Vfork_1__0(Vtestrunner___024root* vlSelf);

VL_INLINE_OPT VlCoroutine Vtestrunner___024root___eval_initial__TOP__0(Vtestrunner___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtestrunner___024root___eval_initial__TOP__0\n"); );
    // Init
    VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testrunner> testrunner__DOT__svunit_tr;
    VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testsuite> testrunner__DOT_____05Fts__DOT__svunit_ts;
    std::string __Vtask_run__11__test0__DOT___testName;
    CData/*0:0*/ __Vtask_is_selected__12__Vfuncout;
    __Vtask_is_selected__12__Vfuncout = 0;
    IData/*31:0*/ __Vtask_get_error_count__14__Vfuncout;
    __Vtask_get_error_count__14__Vfuncout = 0;
    IData/*31:0*/ __Vtask_get_error_count__28__Vfuncout;
    __Vtask_get_error_count__28__Vfuncout = 0;
    std::string __Vtemp_1;
    std::string __Vtemp_2;
    // Body
    testrunner__DOT__svunit_tr = VL_NEW(Vtestrunner_svunit_pkg__03a__03asvunit_testrunner, vlSymsp,
                                        std::string{"testrunner"});
    vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.svunit_ut
        = VL_NEW(Vtestrunner_svunit_pkg__03a__03asvunit_testcase, vlSymsp,
                 std::string{"adder_ut"});
    testrunner__DOT_____05Fts__DOT__svunit_ts = VL_NEW(Vtestrunner_svunit_pkg__03a__03asvunit_testsuite, vlSymsp,
                                                       std::string{"__ts"});
    VL_NULL_CHECK(testrunner__DOT_____05Fts__DOT__svunit_ts, "/app/sim/test1/.__testsuite.sv", 21)->__VnoInFunc_add_testcase(vlSymsp, vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.svunit_ut);
    VL_NULL_CHECK(testrunner__DOT__svunit_tr, "/app/sim/test1/.testrunner.sv", 50)->__VnoInFunc_add_testsuite(vlSymsp, testrunner__DOT_____05Fts__DOT__svunit_ts);
    VL_NULL_CHECK(testrunner__DOT_____05Fts__DOT__svunit_ts, "/app/sim/test1/.__testsuite.sv", 29)->__VnoInFunc_run(vlSymsp);
    VL_WRITEF("INFO:  [%0t][adder_ut]: RUNNING\n",64,
              VL_TIME_UNITED_Q(1),-12);
    if (VL_UNLIKELY(([&]() {
                    VL_NULL_CHECK(vlSymsp->TOP__svunit_pkg._filter, "/app/sim/test1/./design_unit_test.sv", 78)
                     ->__VnoInFunc_is_selected(vlSymsp, vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.svunit_ut,
                                               std::string{"test0"}, __Vtask_is_selected__12__Vfuncout);
                }(), (IData)(__Vtask_is_selected__12__Vfuncout)))) {
        vlSelf->__Vtask_run__11__test0__DOT____VDynScope_test0
            = VL_NEW(Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x55f8515e68f0, vlSymsp);
        __Vtask_run__11__test0__DOT___testName = std::string{"test0"};
        VL_NULL_CHECK(vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.svunit_ut, "/app/sim/test1/./design_unit_test.sv", 78)->__VnoInFunc_get_error_count(vlSymsp, __Vtask_get_error_count__14__Vfuncout);
        VL_NULL_CHECK(vlSelf->__Vtask_run__11__test0__DOT____VDynScope_test0, "/app/sim/test1/./design_unit_test.sv", 78)->__PVT__local_error_count
            = __Vtask_get_error_count__14__Vfuncout;
        VL_WRITEF("INFO:  [%0t][adder_ut]: test0::RUNNING\n",
                  64,VL_TIME_UNITED_Q(1),-12);
        vlSymsp->TOP__svunit_pkg.current_tc = vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.svunit_ut;
        VL_NULL_CHECK(vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.svunit_ut, "/app/sim/test1/./design_unit_test.sv", 78)->__VnoInFunc_add_junit_test_case(vlSymsp,
                                                                                std::string{"test0"});
        VL_NULL_CHECK(vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.svunit_ut, "/app/sim/test1/./design_unit_test.sv", 78)->__VnoInFunc_start(vlSymsp);
        VL_NULL_CHECK(vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.svunit_ut, "/app/sim/test1/./design_unit_test.sv", 42)->__VnoInFunc_setup(vlSymsp);
        vlSelf->__Vfork_1__sync.init(1U, nullptr);
        Vtestrunner___024root___eval_initial__TOP__0____Vfork_1__0(vlSelf);
        co_await vlSelf->__Vfork_1__sync.join(nullptr,
                                              "/app/sim/test1/./design_unit_test.sv",
                                              78);
        VL_NULL_CHECK(vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.svunit_ut, "/app/sim/test1/./design_unit_test.sv", 83)->__VnoInFunc_stop(vlSymsp);
        VL_NULL_CHECK(vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.svunit_ut, "/app/sim/test1/./design_unit_test.sv", 57)->__VnoInFunc_teardown(vlSymsp);
        if ((([&]() {
                        VL_NULL_CHECK(vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.svunit_ut, "/app/sim/test1/./design_unit_test.sv", 83)
              ->__VnoInFunc_get_error_count(vlSymsp, __Vtask_get_error_count__28__Vfuncout);
                    }(), __Vtask_get_error_count__28__Vfuncout)
             == VL_NULL_CHECK(vlSelf->__Vtask_run__11__test0__DOT____VDynScope_test0, "/app/sim/test1/./design_unit_test.sv", 83)
             ->__PVT__local_error_count)) {
            __Vtemp_1 = VL_SFORMATF_NX("%@::PASSED",
                                       -1,&(__Vtask_run__11__test0__DOT___testName)) ;
            VL_WRITEF("INFO:  [%0t][adder_ut]: %@\n",
                      64,VL_TIME_UNITED_Q(1),-12,-1,
                      &(__Vtemp_1));
        } else {
            __Vtemp_2 = VL_SFORMATF_NX("%@::FAILED",
                                       -1,&(__Vtask_run__11__test0__DOT___testName)) ;
            VL_WRITEF("INFO:  [%0t][adder_ut]: %@\n",
                      64,VL_TIME_UNITED_Q(1),-12,-1,
                      &(__Vtemp_2));
        }
        VL_NULL_CHECK(vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.svunit_ut, "/app/sim/test1/./design_unit_test.sv", 83)->__VnoInFunc_update_exit_status(vlSymsp);
    }
    VL_NULL_CHECK(testrunner__DOT_____05Fts__DOT__svunit_ts, "/app/sim/test1/.__testsuite.sv", 31)->__VnoInFunc_report(vlSymsp);
    VL_NULL_CHECK(testrunner__DOT__svunit_tr, "/app/sim/test1/.testrunner.sv", 59)->__VnoInFunc_report(vlSymsp);
    VL_FINISH_MT("/app/sim/test1/.testrunner.sv", 40, "");
}
