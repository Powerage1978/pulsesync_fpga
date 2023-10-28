// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg___ctor_var_reset(Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg* vlSelf);

Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg::Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg(Vtestrunner__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg___ctor_var_reset(this);
}

void Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg::~Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg() {
}
