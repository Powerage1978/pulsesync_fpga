// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_adder_unit_test.h"

VL_ATTR_COLD void Vtestrunner_adder_unit_test___ctor_var_reset(Vtestrunner_adder_unit_test* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_adder_unit_test___ctor_var_reset\n"); );
    // Body
    vlSelf->clk = VL_RAND_RESET_I(1);
    vlSelf->async_reset_n = VL_RAND_RESET_I(1);
    vlSelf->a = VL_RAND_RESET_I(4);
    vlSelf->b = VL_RAND_RESET_I(4);
    vlSelf->valid = VL_RAND_RESET_I(1);
    vlSelf->__PVT__my_adder__DOT__tmp_c = VL_RAND_RESET_I(5);
}
