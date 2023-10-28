// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_adder_unit_test.h"

VL_INLINE_OPT VlCoroutine Vtestrunner_adder_unit_test___eval_initial__TOP__testrunner__DOT_____05Fts__DOT__adder_ut__0(Vtestrunner_adder_unit_test* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_adder_unit_test___eval_initial__TOP__testrunner__DOT_____05Fts__DOT__adder_ut__0\n"); );
    // Body
    vlSelf->clk = 0U;
    while (1U) {
        co_await vlSymsp->TOP.__VdlySched.delay(5ULL,
                                                nullptr,
                                                "/app/sim/test1/./design_unit_test.sv",
                                                38);
        vlSelf->clk = (1U & (~ (IData)(vlSelf->clk)));
    }
}
