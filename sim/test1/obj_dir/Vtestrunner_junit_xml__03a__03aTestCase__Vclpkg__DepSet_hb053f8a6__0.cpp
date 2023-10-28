// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_junit_xml__03a__03aTestCase__Vclpkg.h"

void Vtestrunner_junit_xml__03a__03aTestCase::__VnoInFunc_get_name(Vtestrunner__Syms* __restrict vlSymsp, std::string &get_name__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aTestCase::__VnoInFunc_get_name\n"); );
    // Body
    get_name__Vfuncrtn = this->__PVT__name;
}

Vtestrunner_junit_xml__03a__03aTestCase::~Vtestrunner_junit_xml__03a__03aTestCase() {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aTestCase::~\n"); );
}

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_junit_xml__03a__03aTestCase>& obj) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aTestCase::VL_TO_STRING\n"); );
    // Body
    return (obj ? obj->to_string() : "null");
}

std::string Vtestrunner_junit_xml__03a__03aTestCase::to_string() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aTestCase::to_string\n"); );
    // Body
    return (std::string{"'{"} + to_string_middle() + "}");
}

std::string Vtestrunner_junit_xml__03a__03aTestCase::to_string_middle() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aTestCase::to_string_middle\n"); );
    // Body
    std::string out;
    out += "name:" + VL_TO_STRING(__PVT__name);
    out += ", class_name:" + VL_TO_STRING(__PVT__class_name);
    out += ", failure:" + VL_TO_STRING(__PVT__failure);
    return out;
}
