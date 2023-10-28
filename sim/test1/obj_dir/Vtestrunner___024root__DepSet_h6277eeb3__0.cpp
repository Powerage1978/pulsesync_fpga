// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner___024root.h"
#include "Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x55f8515e68f0__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg.h"

VL_INLINE_OPT VlCoroutine Vtestrunner___024root___eval_initial__TOP__0____Vfork_1__0____Vfork_2__1(Vtestrunner___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtestrunner___024root___eval_initial__TOP__0____Vfork_1__0____Vfork_2__1\n"); );
    // Init
    VlClassRef<Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x55f8515e68f0> __Vtask___V__FORK_BEGIN_UNNAMED__0x55f8515f04e0__22____VDynScope_test0;
    IData/*31:0*/ __Vtask_get_error_count__23__Vfuncout;
    __Vtask_get_error_count__23__Vfuncout = 0;
    // Body
    __Vtask___V__FORK_BEGIN_UNNAMED__0x55f8515f04e0__22____VDynScope_test0
        = vlSelf->__Vtask_run__11__test0__DOT____VDynScope_test0;
    if ((([&]() {
                    VL_NULL_CHECK(vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.svunit_ut, "/app/sim/test1/./design_unit_test.sv", 83)
          ->__VnoInFunc_get_error_count(vlSymsp, __Vtask_get_error_count__23__Vfuncout);
                }(), __Vtask_get_error_count__23__Vfuncout)
         == VL_NULL_CHECK(__Vtask___V__FORK_BEGIN_UNNAMED__0x55f8515f04e0__22____VDynScope_test0, "/app/sim/test1/./design_unit_test.sv", 83)
         ->__PVT__local_error_count)) {
        co_await VL_NULL_CHECK(vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.svunit_ut, "/app/sim/test1/./design_unit_test.sv", 83)->__VnoInFunc_wait_for_error(vlSymsp);
    }
    vlSelf->__Vfork_2__sync.done("/app/sim/test1/./design_unit_test.sv",
                                 83);
}
