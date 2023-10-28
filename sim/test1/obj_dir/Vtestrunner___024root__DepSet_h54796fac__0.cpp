// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner___024root.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg.h"

VL_INLINE_OPT VlCoroutine Vtestrunner___024root___eval_initial__TOP__0____Vfork_1__0____Vfork_2__0(Vtestrunner___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtestrunner___024root___eval_initial__TOP__0____Vfork_1__0____Vfork_2__0\n"); );
    // Init
    CData/*0:0*/ __Vtask_fail__19__Vfuncout;
    __Vtask_fail__19__Vfuncout = 0;
    CData/*0:0*/ __Vtask_is_running__20__Vfuncout;
    __Vtask_is_running__20__Vfuncout = 0;
    // Body
    vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.a = 3U;
    vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.b = 7U;
    vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.valid = 1U;
    co_await vlSelf->__VdlySched.delay(1ULL, nullptr,
                                       "/app/sim/test1/./design_unit_test.sv",
                                       104);
    if (([&]() {
                VL_NULL_CHECK(vlSymsp->TOP__svunit_pkg.current_tc, "/app/sim/test1/./design_unit_test.sv", 104)
         ->__VnoInFunc_fail(vlSymsp, std::string{"fail_if"},
                            (0xaU != (IData)(vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.__PVT__my_adder__DOT__tmp_c)),
                            std::string{"c !== 10"},
                            std::string{"/app/sim/test1/./design_unit_test.sv"}, 0x68U,
                            std::string{""}, __Vtask_fail__19__Vfuncout);
            }(), (IData)(__Vtask_fail__19__Vfuncout))) {
        if (([&]() {
                    VL_NULL_CHECK(vlSymsp->TOP__svunit_pkg.current_tc, "/app/sim/test1/./design_unit_test.sv", 104)
             ->__VnoInFunc_is_running(vlSymsp, __Vtask_is_running__20__Vfuncout);
                }(), (IData)(__Vtask_is_running__20__Vfuncout))) {
            co_await VL_NULL_CHECK(vlSymsp->TOP__svunit_pkg.current_tc, "/app/sim/test1/./design_unit_test.sv", 104)->__VnoInFunc_give_up(vlSymsp);
        }
    }
    vlSelf->__Vfork_2__sync.done("/app/sim/test1/./design_unit_test.sv",
                                 97);
}
