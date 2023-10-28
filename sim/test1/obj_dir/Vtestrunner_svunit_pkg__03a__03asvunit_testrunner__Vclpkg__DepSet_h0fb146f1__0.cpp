// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testrunner__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03asvunit_testrunner::__VnoInFunc_report(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testrunner::__VnoInFunc_report\n"); );
    // Init
    IData/*31:0*/ __Vfunc_get_num_passing_testsuites__9__Vfuncout;
    __Vfunc_get_num_passing_testsuites__9__Vfuncout = 0;
    std::string __Vtemp_1;
    // Body
    IData/*31:0*/ pass_cnt;
    pass_cnt = 0;
    std::string success_str;
    this->__VnoInFunc_get_num_passing_testsuites(vlSymsp, __Vfunc_get_num_passing_testsuites__9__Vfuncout);
    pass_cnt = __Vfunc_get_num_passing_testsuites__9__Vfuncout;
    if ((pass_cnt == this->__PVT__list_of_suites.size())) {
        success_str = std::string{"PASSED"};
        Vtestrunner_svunit_pkg__03a__03asvunit_base::__PVT__success = 1U;
    } else {
        success_str = std::string{"FAILED"};
        Vtestrunner_svunit_pkg__03a__03asvunit_base::__PVT__success = 0U;
    }
    VL_WRITEF("\n");
    __Vtemp_1 = VL_SFORMATF_NX("%0@ (%0d of %0d suites passing) [SVUnit 3.37.0]",
                               -1,&(success_str),32,
                               pass_cnt,32,this->__PVT__list_of_suites.size()) ;
    VL_WRITEF("INFO:  [%0t][%0@]: %@\n",64,VL_TIME_UNITED_Q(1),
              -12,-1,&(Vtestrunner_svunit_pkg__03a__03asvunit_base::__PVT__name),
              -1,&(__Vtemp_1));
    this->__VnoInFunc_write_xml(vlSymsp);
}
