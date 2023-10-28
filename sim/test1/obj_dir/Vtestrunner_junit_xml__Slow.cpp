// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_junit_xml.h"

void Vtestrunner_junit_xml___ctor_var_reset(Vtestrunner_junit_xml* vlSelf);

Vtestrunner_junit_xml::Vtestrunner_junit_xml(Vtestrunner__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vtestrunner_junit_xml___ctor_var_reset(this);
}

void Vtestrunner_junit_xml::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vtestrunner_junit_xml::~Vtestrunner_junit_xml() {
}
