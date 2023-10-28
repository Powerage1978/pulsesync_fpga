// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testrunner__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03asvunit_testrunner::__VnoInFunc_get_num_passing_testsuites(Vtestrunner__Syms* __restrict vlSymsp, IData/*31:0*/ &get_num_passing_testsuites__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testrunner::__VnoInFunc_get_num_passing_testsuites\n"); );
    // Init
    CData/*0:0*/ __Vtask_get_results__0__Vfuncout;
    __Vtask_get_results__0__Vfuncout = 0;
    // Body
    IData/*31:0*/ unnamedblk2_1__DOT__i;
    unnamedblk2_1__DOT__i = 0;
    IData/*31:0*/ result;
    result = 0;
    unnamedblk2_1__DOT__i = 0U;
    while (VL_LTS_III(32, unnamedblk2_1__DOT__i, this->__PVT__list_of_suites.size())) {
        if (([&]() {
                    VL_NULL_CHECK(this->__PVT__list_of_suites.at(unnamedblk2_1__DOT__i), "/opt/svunit/svunit-3.37.0/svunit_base/svunit_testrunner.sv", 44)
             ->__VnoInFunc_get_results(vlSymsp, __Vtask_get_results__0__Vfuncout);
                }(), (IData)(__Vtask_get_results__0__Vfuncout))) {
            result = ((IData)(1U) + result);
        }
        unnamedblk2_1__DOT__i = ((IData)(1U) + unnamedblk2_1__DOT__i);
    }
    get_num_passing_testsuites__Vfuncrtn = result;
}
