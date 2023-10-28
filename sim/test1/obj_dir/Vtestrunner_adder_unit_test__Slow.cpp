// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_adder_unit_test.h"

void Vtestrunner_adder_unit_test___ctor_var_reset(Vtestrunner_adder_unit_test* vlSelf);

Vtestrunner_adder_unit_test::Vtestrunner_adder_unit_test(Vtestrunner__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vtestrunner_adder_unit_test___ctor_var_reset(this);
}

void Vtestrunner_adder_unit_test::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vtestrunner_adder_unit_test::~Vtestrunner_adder_unit_test() {
}
