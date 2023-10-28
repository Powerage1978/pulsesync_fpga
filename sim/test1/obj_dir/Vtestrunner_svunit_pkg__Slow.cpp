// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg.h"

void Vtestrunner_svunit_pkg___ctor_var_reset(Vtestrunner_svunit_pkg* vlSelf);

Vtestrunner_svunit_pkg::Vtestrunner_svunit_pkg(Vtestrunner__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vtestrunner_svunit_pkg___ctor_var_reset(this);
}

void Vtestrunner_svunit_pkg::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vtestrunner_svunit_pkg::~Vtestrunner_svunit_pkg() {
}
