// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03asvunit_testsuite::__VnoInFunc_add_testcase(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testcase> svunit) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testsuite::__VnoInFunc_add_testcase\n"); );
    // Init
    std::string __Vtask_get_name__6__Vfuncout;
    std::string __Vtemp_1;
    std::string __Vtemp_2;
    // Body
    __Vtemp_1 = ([&]() {
            VL_NULL_CHECK(svunit, "/opt/svunit/svunit-3.37.0/svunit_base/svunit_testsuite.sv", 84)
                 ->__VnoInFunc_get_name(vlSymsp, __Vtask_get_name__6__Vfuncout);
        }(), __Vtask_get_name__6__Vfuncout);
    __Vtemp_2 = VL_SFORMATF_NX("Registering Unit Test Case %@",
                               -1,&(__Vtemp_1)) ;
    VL_WRITEF("INFO:  [%0t][%0@]: %@\n",64,VL_TIME_UNITED_Q(1),
              -12,-1,&(Vtestrunner_svunit_pkg__03a__03asvunit_base::__PVT__name),
              -1,&(__Vtemp_2));
    this->__PVT__list_of_testcases.push_back(svunit);
}

void Vtestrunner_svunit_pkg__03a__03asvunit_testsuite::__VnoInFunc_report(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testsuite::__VnoInFunc_report\n"); );
    // Init
    IData/*31:0*/ __Vfunc_get_num_passing_testcases__8__Vfuncout;
    __Vfunc_get_num_passing_testcases__8__Vfuncout = 0;
    std::string __Vtemp_2;
    // Body
    IData/*31:0*/ unnamedblk2_4__DOT__i;
    unnamedblk2_4__DOT__i = 0;
    IData/*31:0*/ pass_cnt;
    pass_cnt = 0;
    std::string success_str;
    unnamedblk2_4__DOT__i = 0U;
    while (VL_LTS_III(32, unnamedblk2_4__DOT__i, this->__PVT__list_of_testcases.size())) {
        VL_NULL_CHECK(this->__PVT__list_of_testcases.at(unnamedblk2_4__DOT__i), "/opt/svunit/svunit-3.37.0/svunit_base/svunit_testsuite.sv", 107)->__VnoInFunc_report(vlSymsp);
        unnamedblk2_4__DOT__i = ((IData)(1U) + unnamedblk2_4__DOT__i);
    }
    this->__VnoInFunc_get_num_passing_testcases(vlSymsp, __Vfunc_get_num_passing_testcases__8__Vfuncout);
    pass_cnt = __Vfunc_get_num_passing_testcases__8__Vfuncout;
    if ((pass_cnt == this->__PVT__list_of_testcases.size())) {
        success_str = std::string{"PASSED"};
        Vtestrunner_svunit_pkg__03a__03asvunit_base::__PVT__success = 1U;
    } else {
        success_str = std::string{"FAILED"};
        Vtestrunner_svunit_pkg__03a__03asvunit_base::__PVT__success = 0U;
    }
    VL_WRITEF("\n");
    __Vtemp_2 = VL_SFORMATF_NX("%0@ (%0d of %0d testcases passing)",
                               -1,&(success_str),32,
                               pass_cnt,32,this->__PVT__list_of_testcases.size()) ;
    VL_WRITEF("INFO:  [%0t][%0@]: %@\n",64,VL_TIME_UNITED_Q(1),
              -12,-1,&(Vtestrunner_svunit_pkg__03a__03asvunit_base::__PVT__name),
              -1,&(__Vtemp_2));
}
