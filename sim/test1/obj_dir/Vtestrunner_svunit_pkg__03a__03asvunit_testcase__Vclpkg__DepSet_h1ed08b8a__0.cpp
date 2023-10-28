// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_update_exit_status(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_update_exit_status\n"); );
    // Body
    Vtestrunner_svunit_pkg__03a__03asvunit_base::__PVT__success
        = (0U == this->__PVT__error_count);
}

void Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_report(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_report\n"); );
    // Init
    std::string __Vtemp_1;
    // Body
    std::string success_str;
    success_str = VL_CVT_PACK_STR_NQ(((IData)(Vtestrunner_svunit_pkg__03a__03asvunit_base::__PVT__success)
                                       ? 0x504153534544ULL
                                       : 0x4641494c4544ULL));
    __Vtemp_1 = VL_SFORMATF_NX("%0@ (%0# of %0# tests passing)",
                               -1,&(success_str),32,
                               (this->__PVT__test_count
                                - this->__PVT__error_count),
                               32,this->__PVT__test_count) ;
    VL_WRITEF("INFO:  [%0t][%0@]: %@\n",64,VL_TIME_UNITED_Q(1),
              -12,-1,&(Vtestrunner_svunit_pkg__03a__03asvunit_base::__PVT__name),
              -1,&(__Vtemp_1));
}
