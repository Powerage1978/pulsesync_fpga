// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner___024root.h"

VlCoroutine Vtestrunner___024root___eval_initial__TOP__0____Vfork_1__0____Vfork_2__0(Vtestrunner___024root* vlSelf);
VlCoroutine Vtestrunner___024root___eval_initial__TOP__0____Vfork_1__0____Vfork_2__1(Vtestrunner___024root* vlSelf);

VL_INLINE_OPT VlCoroutine Vtestrunner___024root___eval_initial__TOP__0____Vfork_1__0(Vtestrunner___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtestrunner___024root___eval_initial__TOP__0____Vfork_1__0\n"); );
    // Body
    vlSelf->__Vfork_2__sync.init(1U, nullptr);
    Vtestrunner___024root___eval_initial__TOP__0____Vfork_1__0____Vfork_2__0(vlSelf);
    Vtestrunner___024root___eval_initial__TOP__0____Vfork_1__0____Vfork_2__1(vlSelf);
    co_await vlSelf->__Vfork_2__sync.join(nullptr,
                                          "/app/sim/test1/./design_unit_test.sv",
                                          97);
    vlSelf->__Vfork_1__sync.done("/app/sim/test1/./design_unit_test.sv",
                                 97);
}

void Vtestrunner___024root___eval_act(Vtestrunner___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtestrunner___024root___eval_act\n"); );
}

void Vtestrunner___024root___eval_triggers__act(Vtestrunner___024root* vlSelf);
void Vtestrunner___024root___timing_commit(Vtestrunner___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtestrunner___024root___dump_triggers__act(Vtestrunner___024root* vlSelf);
#endif  // VL_DEBUG
void Vtestrunner___024root___timing_resume(Vtestrunner___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtestrunner___024root___dump_triggers__nba(Vtestrunner___024root* vlSelf);
#endif  // VL_DEBUG
void Vtestrunner___024root___eval_nba(Vtestrunner___024root* vlSelf);

void Vtestrunner___024root___eval(Vtestrunner___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtestrunner___024root___eval\n"); );
    // Init
    VlTriggerVec<4> __VpreTriggered;
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        __VnbaContinue = 0U;
        vlSelf->__VnbaTriggered.clear();
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            vlSelf->__VactContinue = 0U;
            Vtestrunner___024root___eval_triggers__act(vlSelf);
            Vtestrunner___024root___timing_commit(vlSelf);
            if (vlSelf->__VactTriggered.any()) {
                vlSelf->__VactContinue = 1U;
                if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                    Vtestrunner___024root___dump_triggers__act(vlSelf);
#endif
                    VL_FATAL_MT("/app/sim/test1/.testrunner.sv", 5, "", "Active region did not converge.");
                }
                vlSelf->__VactIterCount = ((IData)(1U)
                                           + vlSelf->__VactIterCount);
                __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
                vlSelf->__VnbaTriggered.thisOr(vlSelf->__VactTriggered);
                Vtestrunner___024root___timing_resume(vlSelf);
                Vtestrunner___024root___eval_act(vlSelf);
            }
        }
        if (vlSelf->__VnbaTriggered.any()) {
            __VnbaContinue = 1U;
            if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
                Vtestrunner___024root___dump_triggers__nba(vlSelf);
#endif
                VL_FATAL_MT("/app/sim/test1/.testrunner.sv", 5, "", "NBA region did not converge.");
            }
            __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
            Vtestrunner___024root___eval_nba(vlSelf);
        }
    }
}

void Vtestrunner___024root___timing_commit(Vtestrunner___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtestrunner___024root___timing_commit\n"); );
    // Body
    if ((! (2ULL & vlSelf->__VactTriggered.word(0U)))) {
        vlSelf->__VtrigSched_h1afa9c2d__0.commit("@(posedge testrunner.__ts.adder_ut.clk)");
    }
}

void Vtestrunner___024root___timing_resume(Vtestrunner___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtestrunner___024root___timing_resume\n"); );
    // Body
    if ((2ULL & vlSelf->__VactTriggered.word(0U))) {
        vlSelf->__VtrigSched_h1afa9c2d__0.resume("@(posedge testrunner.__ts.adder_ut.clk)");
    }
    if ((4ULL & vlSelf->__VactTriggered.word(0U))) {
        vlSelf->__VdlySched.resume();
    }
    if ((8ULL & vlSelf->__VactTriggered.word(0U))) {
        vlSelf->__VdynSched.resume();
    }
}

#ifdef VL_DEBUG
void Vtestrunner___024root___eval_debug_assertions(Vtestrunner___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtestrunner___024root___eval_debug_assertions\n"); );
}
#endif  // VL_DEBUG
