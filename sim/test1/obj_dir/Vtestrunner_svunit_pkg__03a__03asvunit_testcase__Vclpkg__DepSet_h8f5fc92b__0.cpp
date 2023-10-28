// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_as_junit_test_cases(Vtestrunner__Syms* __restrict vlSymsp, VlQueue<VlClassRef<Vtestrunner_junit_xml__03a__03aTestCase>> &as_junit_test_cases__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_as_junit_test_cases\n"); );
    // Body
    as_junit_test_cases__Vfuncrtn = this->__PVT__junit_test_cases;
}

void Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_get_error_count(Vtestrunner__Syms* __restrict vlSymsp, IData/*31:0*/ &get_error_count__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_get_error_count\n"); );
    // Body
    get_error_count__Vfuncrtn = this->__PVT__error_count;
}

void Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_start(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_start\n"); );
    // Body
    this->__PVT__running = 1U;
    this->__PVT__test_count = ((IData)(1U) + this->__PVT__test_count);
}

void Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_stop(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_stop\n"); );
    // Body
    this->__PVT__running = 0U;
}

void Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_is_running(Vtestrunner__Syms* __restrict vlSymsp, CData/*0:0*/ &is_running__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_is_running\n"); );
    // Body
    is_running__Vfuncrtn = this->__PVT__running;
}

void Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_setup(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_setup\n"); );
}

void Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_teardown(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_teardown\n"); );
}

Vtestrunner_svunit_pkg__03a__03asvunit_testcase::~Vtestrunner_svunit_pkg__03a__03asvunit_testcase() {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::~\n"); );
}

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testcase>& obj) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::VL_TO_STRING\n"); );
    // Body
    return (obj ? obj->to_string() : "null");
}

std::string Vtestrunner_svunit_pkg__03a__03asvunit_testcase::to_string() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::to_string\n"); );
    // Body
    return (std::string{"'{"} + to_string_middle() + "}");
}

std::string Vtestrunner_svunit_pkg__03a__03asvunit_testcase::to_string_middle() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::to_string_middle\n"); );
    // Body
    std::string out;
    out += "test_count:" + VL_TO_STRING(__PVT__test_count);
    out += ", error_count:" + VL_TO_STRING(__PVT__error_count);
    out += ", running:" + VL_TO_STRING(__PVT__running);
    out += ", current_junit_test_case:" + VL_TO_STRING(__PVT__current_junit_test_case);
    out += ", junit_test_cases:" + VL_TO_STRING(__PVT__junit_test_cases);
    out += ", "+ Vtestrunner_svunit_pkg__03a__03asvunit_base::to_string_middle();
    return out;
}
