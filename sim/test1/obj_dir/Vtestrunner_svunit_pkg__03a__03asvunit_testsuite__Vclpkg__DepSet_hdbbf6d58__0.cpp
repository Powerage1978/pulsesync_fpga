// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_junit_xml__03a__03aTestSuite__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03asvunit_testsuite::__VnoInFunc_as_junit_test_suite(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_junit_xml__03a__03aTestSuite> &as_junit_test_suite__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testsuite::__VnoInFunc_as_junit_test_suite\n"); );
    // Init
    std::string __Vfunc_get_name__2__Vfuncout;
    VlQueue<VlClassRef<Vtestrunner_junit_xml__03a__03aTestCase>> __Vtask_as_junit_test_cases__3__Vfuncout;
    // Body
    IData/*31:0*/ unnamedblk2_2__DOT__i;
    unnamedblk2_2__DOT__i = 0;
    VlQueue<VlClassRef<Vtestrunner_junit_xml__03a__03aTestCase>> unnamedblk2_2__DOT__unnamedblk1__DOT__junit_test_cases;
    IData/*31:0*/ unnamedblk2_2__DOT__unnamedblk1__DOT__unnamedblk2_3__DOT__i;
    unnamedblk2_2__DOT__unnamedblk1__DOT__unnamedblk2_3__DOT__i = 0;
    VlClassRef<Vtestrunner_junit_xml__03a__03aTestSuite> result;
    result = VL_NEW(Vtestrunner_junit_xml__03a__03aTestSuite, vlSymsp,
                    VL_CVT_PACK_STR_NN(([&]() {
                    Vtestrunner_svunit_pkg__03a__03asvunit_base::__VnoInFunc_get_name(vlSymsp, __Vfunc_get_name__2__Vfuncout);
                }(), __Vfunc_get_name__2__Vfuncout)));
    unnamedblk2_2__DOT__i = 0U;
    while (VL_LTS_III(32, unnamedblk2_2__DOT__i, this->__PVT__list_of_testcases.size())) {
        VL_NULL_CHECK(this->__PVT__list_of_testcases.at(unnamedblk2_2__DOT__i), "/opt/svunit/svunit-3.37.0/svunit_base/svunit_testsuite.sv", 54)->__VnoInFunc_as_junit_test_cases(vlSymsp, __Vtask_as_junit_test_cases__3__Vfuncout);
        unnamedblk2_2__DOT__unnamedblk1__DOT__junit_test_cases
            = __Vtask_as_junit_test_cases__3__Vfuncout;
        unnamedblk2_2__DOT__unnamedblk1__DOT__unnamedblk2_3__DOT__i = 0U;
        while (VL_LTS_III(32, unnamedblk2_2__DOT__unnamedblk1__DOT__unnamedblk2_3__DOT__i, unnamedblk2_2__DOT__unnamedblk1__DOT__junit_test_cases.size())) {
            VL_NULL_CHECK(result, "/opt/svunit/svunit-3.37.0/svunit_base/svunit_testsuite.sv", 56)->__VnoInFunc_add_test_case(vlSymsp, unnamedblk2_2__DOT__unnamedblk1__DOT__junit_test_cases.at(unnamedblk2_2__DOT__unnamedblk1__DOT__unnamedblk2_3__DOT__i));
            unnamedblk2_2__DOT__unnamedblk1__DOT__unnamedblk2_3__DOT__i
                = ((IData)(1U) + unnamedblk2_2__DOT__unnamedblk1__DOT__unnamedblk2_3__DOT__i);
        }
        unnamedblk2_2__DOT__i = ((IData)(1U) + unnamedblk2_2__DOT__i);
    }
    as_junit_test_suite__Vfuncrtn = result;
}
