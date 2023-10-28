// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner___024root.h"

VlCoroutine Vtestrunner___024root___eval_initial__TOP__0(Vtestrunner___024root* vlSelf);
VlCoroutine Vtestrunner_adder_unit_test___eval_initial__TOP__testrunner__DOT_____05Fts__DOT__adder_ut__0(Vtestrunner_adder_unit_test* vlSelf);

void Vtestrunner___024root___eval_initial(Vtestrunner___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtestrunner___024root___eval_initial\n"); );
    // Body
    Vtestrunner___024root___eval_initial__TOP__0(vlSelf);
    Vtestrunner_adder_unit_test___eval_initial__TOP__testrunner__DOT_____05Fts__DOT__adder_ut__0((&vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut));
    vlSelf->__Vtrigprevexpr___TOP__testrunner__DOT_____05Fts__DOT__adder_ut__async_reset_n__0
        = vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.async_reset_n;
    vlSelf->__Vtrigprevexpr___TOP__testrunner__DOT_____05Fts__DOT__adder_ut__clk__0
        = vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.clk;
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtestrunner___024root___dump_triggers__act(Vtestrunner___024root* vlSelf);
#endif  // VL_DEBUG

void Vtestrunner___024root___eval_triggers__act(Vtestrunner___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtestrunner___024root___eval_triggers__act\n"); );
    // Body
    vlSelf->__VactTriggered.set(0U, (((~ (IData)(vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.async_reset_n))
                                      & (IData)(vlSelf->__Vtrigprevexpr___TOP__testrunner__DOT_____05Fts__DOT__adder_ut__async_reset_n__0))
                                     | ((IData)(vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.clk)
                                        & (~ (IData)(vlSelf->__Vtrigprevexpr___TOP__testrunner__DOT_____05Fts__DOT__adder_ut__clk__0)))));
    vlSelf->__VactTriggered.set(1U, ((IData)(vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.clk)
                                     & (~ (IData)(vlSelf->__Vtrigprevexpr___TOP__testrunner__DOT_____05Fts__DOT__adder_ut__clk__0))));
    vlSelf->__VactTriggered.set(2U, vlSelf->__VdlySched.awaitingCurrentTime());
    vlSelf->__VactTriggered.set(3U, vlSelf->__VdynSched.evaluate());
    vlSelf->__Vtrigprevexpr___TOP__testrunner__DOT_____05Fts__DOT__adder_ut__async_reset_n__0
        = vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.async_reset_n;
    vlSelf->__Vtrigprevexpr___TOP__testrunner__DOT_____05Fts__DOT__adder_ut__clk__0
        = vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut.clk;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtestrunner___024root___dump_triggers__act(vlSelf);
    }
#endif
    vlSelf->__VdynSched.doPostUpdates();
}

void Vtestrunner_adder_unit_test___nba_sequent__TOP__testrunner__DOT_____05Fts__DOT__adder_ut__0(Vtestrunner_adder_unit_test* vlSelf);

void Vtestrunner___024root___eval_nba(Vtestrunner___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtestrunner___024root___eval_nba\n"); );
    // Body
    if ((1ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vtestrunner_adder_unit_test___nba_sequent__TOP__testrunner__DOT_____05Fts__DOT__adder_ut__0((&vlSymsp->TOP__testrunner__DOT_____05Fts__DOT__adder_ut));
    }
}
