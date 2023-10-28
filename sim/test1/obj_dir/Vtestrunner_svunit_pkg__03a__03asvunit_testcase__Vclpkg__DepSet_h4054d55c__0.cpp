// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_junit_xml__03a__03aTestCase__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_add_junit_test_case(Vtestrunner__Syms* __restrict vlSymsp, std::string name) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_add_junit_test_case\n"); );
    // Init
    std::string __Vfunc_get_name__1__Vfuncout;
    // Body
    this->__PVT__current_junit_test_case = VL_NEW(Vtestrunner_junit_xml__03a__03aTestCase, vlSymsp, name,
                                                  VL_CVT_PACK_STR_NN(
                                                                     ([&]() {
                    Vtestrunner_svunit_pkg__03a__03asvunit_base::__VnoInFunc_get_name(vlSymsp, __Vfunc_get_name__1__Vfuncout);
                }(), __Vfunc_get_name__1__Vfuncout)));
    this->__PVT__junit_test_cases.push_back(this->__PVT__current_junit_test_case);
}
