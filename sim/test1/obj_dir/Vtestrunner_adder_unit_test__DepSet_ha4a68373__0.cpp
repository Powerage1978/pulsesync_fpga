// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_adder_unit_test.h"

VL_INLINE_OPT void Vtestrunner_adder_unit_test___nba_sequent__TOP__testrunner__DOT_____05Fts__DOT__adder_ut__0(Vtestrunner_adder_unit_test* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_adder_unit_test___nba_sequent__TOP__testrunner__DOT_____05Fts__DOT__adder_ut__0\n"); );
    // Body
    if (vlSelf->async_reset_n) {
        if (vlSelf->valid) {
            vlSelf->__PVT__my_adder__DOT__tmp_c = (0x1fU
                                                   & ((IData)(vlSelf->a)
                                                      + (IData)(vlSelf->b)));
        }
    } else {
        vlSelf->__PVT__my_adder__DOT__tmp_c = 0U;
    }
}
