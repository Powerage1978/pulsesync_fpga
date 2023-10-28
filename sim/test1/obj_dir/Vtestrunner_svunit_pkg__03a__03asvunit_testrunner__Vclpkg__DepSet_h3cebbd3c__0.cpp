// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testrunner__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03asvunit_testrunner::__VnoInFunc_add_testsuite(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testsuite> suite) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testrunner::__VnoInFunc_add_testsuite\n"); );
    // Init
    std::string __Vtask_get_name__8__Vfuncout;
    std::string __Vtemp_1;
    std::string __Vtemp_2;
    // Body
    __Vtemp_1 = ([&]() {
            VL_NULL_CHECK(suite, "/opt/svunit/svunit-3.37.0/svunit_base/svunit_testrunner.sv", 83)
                 ->__VnoInFunc_get_name(vlSymsp, __Vtask_get_name__8__Vfuncout);
        }(), __Vtask_get_name__8__Vfuncout);
    __Vtemp_2 = VL_SFORMATF_NX("Registering Test Suite %0@",
                               -1,&(__Vtemp_1)) ;
    VL_WRITEF("INFO:  [%0t][%0@]: %@\n",64,VL_TIME_UNITED_Q(1),
              -12,-1,&(Vtestrunner_svunit_pkg__03a__03asvunit_base::__PVT__name),
              -1,&(__Vtemp_2));
    this->__PVT__list_of_suites.push_back(suite);
}
