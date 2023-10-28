// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_junit_xml__03a__03aTestCase__Vclpkg.h"

Vtestrunner_junit_xml__03a__03aTestCase::Vtestrunner_junit_xml__03a__03aTestCase(Vtestrunner__Syms* __restrict vlSymsp, std::string name, std::string class_name) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aTestCase::new\n"); );
    // Init
    _ctor_var_reset(vlSymsp);
    // Body
    this->__PVT__name = name;
    this->__PVT__class_name = class_name;
}

void Vtestrunner_junit_xml__03a__03aTestCase::_ctor_var_reset(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aTestCase::_ctor_var_reset\n"); );
    // Body
    if (false && vlSymsp) {}  // Prevent unused
    }
