// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_junit_xml__03a__03aTestSuite__Vclpkg.h"

void Vtestrunner_junit_xml__03a__03aTestSuite::__VnoInFunc_get_name(Vtestrunner__Syms* __restrict vlSymsp, std::string &get_name__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aTestSuite::__VnoInFunc_get_name\n"); );
    // Body
    get_name__Vfuncrtn = this->__PVT__name;
}

void Vtestrunner_junit_xml__03a__03aTestSuite::__VnoInFunc_add_test_case(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_junit_xml__03a__03aTestCase> test_case) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aTestSuite::__VnoInFunc_add_test_case\n"); );
    // Body
    this->__PVT__test_cases.push_back(test_case);
}

Vtestrunner_junit_xml__03a__03aTestSuite::~Vtestrunner_junit_xml__03a__03aTestSuite() {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aTestSuite::~\n"); );
}

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_junit_xml__03a__03aTestSuite>& obj) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aTestSuite::VL_TO_STRING\n"); );
    // Body
    return (obj ? obj->to_string() : "null");
}

std::string Vtestrunner_junit_xml__03a__03aTestSuite::to_string() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aTestSuite::to_string\n"); );
    // Body
    return (std::string{"'{"} + to_string_middle() + "}");
}

std::string Vtestrunner_junit_xml__03a__03aTestSuite::to_string_middle() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aTestSuite::to_string_middle\n"); );
    // Body
    std::string out;
    out += "name:" + VL_TO_STRING(__PVT__name);
    out += ", test_cases:" + VL_TO_STRING(__PVT__test_cases);
    return out;
}
