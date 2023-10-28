// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::__VnoInFunc_is_selected(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testcase> tc, std::string test_name, CData/*0:0*/ &is_selected__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::__VnoInFunc_is_selected\n"); );
    // Init
    CData/*0:0*/ __Vfunc_is_match__6__Vfuncout;
    __Vfunc_is_match__6__Vfuncout = 0;
    std::string __Vtask_get_name__7__Vfuncout;
    CData/*0:0*/ __Vfunc_is_match__8__Vfuncout;
    __Vfunc_is_match__8__Vfuncout = 0;
    // Body
    {
        if ((([&]() {
                        this->__VnoInFunc_is_match(vlSymsp, this->__PVT__testcase,
                                                   VL_CVT_PACK_STR_NN(
                                                                      ([&]() {
                                        VL_NULL_CHECK(tc, "/opt/svunit/svunit-3.37.0/svunit_base/svunit_filter_for_single_pattern.svh", 79)
                                                                       ->__VnoInFunc_get_name(vlSymsp, __Vtask_get_name__7__Vfuncout);
                                    }(), __Vtask_get_name__7__Vfuncout)), __Vfunc_is_match__6__Vfuncout);
                    }(), (IData)(__Vfunc_is_match__6__Vfuncout))
             & ([&]() {
                        this->__VnoInFunc_is_match(vlSymsp, this->__PVT__test, test_name, __Vfunc_is_match__8__Vfuncout);
                    }(), (IData)(__Vfunc_is_match__8__Vfuncout)))) {
            is_selected__Vfuncrtn = 1U;
            goto __Vlabel3;
        }
        is_selected__Vfuncrtn = 0U;
        __Vlabel3: ;
    }
}
