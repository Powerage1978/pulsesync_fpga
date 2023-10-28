// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner___024root.h"

VL_ATTR_COLD void Vtestrunner_svunit_pkg___eval_static__TOP__svunit_pkg(Vtestrunner_svunit_pkg* vlSelf);

VL_ATTR_COLD void Vtestrunner___024root___eval_static(Vtestrunner___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtestrunner___024root___eval_static\n"); );
    // Body
    Vtestrunner_svunit_pkg___eval_static__TOP__svunit_pkg((&vlSymsp->TOP__svunit_pkg));
}
