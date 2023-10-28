// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner___024root.h"

void Vtestrunner___024root___ctor_var_reset(Vtestrunner___024root* vlSelf);

Vtestrunner___024root::Vtestrunner___024root(Vtestrunner__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , __VdlySched{*symsp->_vm_contextp__}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vtestrunner___024root___ctor_var_reset(this);
}

void Vtestrunner___024root::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vtestrunner___024root::~Vtestrunner___024root() {
}
