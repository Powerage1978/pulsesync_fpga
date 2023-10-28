// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03afilter::__VnoInFunc_is_selected(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testcase> tc, std::string test_name, CData/*0:0*/ &is_selected__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter::__VnoInFunc_is_selected\n"); );
    // Init
    CData/*0:0*/ __Vtask_is_selected__9__Vfuncout;
    __Vtask_is_selected__9__Vfuncout = 0;
    CData/*0:0*/ __Vtask_is_selected__10__Vfuncout;
    __Vtask_is_selected__10__Vfuncout = 0;
    // Body
    IData/*31:0*/ unnamedblk2_2__DOT__i;
    unnamedblk2_2__DOT__i = 0;
    IData/*31:0*/ unnamedblk2_3__DOT__i;
    unnamedblk2_3__DOT__i = 0;
    {
        unnamedblk2_2__DOT__i = 0U;
        while (VL_LTS_III(32, unnamedblk2_2__DOT__i, this->__PVT__negative_subfilters.size())) {
            if (([&]() {
                        VL_NULL_CHECK(this->__PVT__negative_subfilters.at(unnamedblk2_2__DOT__i), "/opt/svunit/svunit-3.37.0/svunit_base/svunit_filter.svh", 105)
                 ->__VnoInFunc_is_selected(vlSymsp, tc, test_name, __Vtask_is_selected__9__Vfuncout);
                    }(), (IData)(__Vtask_is_selected__9__Vfuncout))) {
                is_selected__Vfuncrtn = 0U;
                goto __Vlabel3;
            }
            unnamedblk2_2__DOT__i = ((IData)(1U) + unnamedblk2_2__DOT__i);
        }
        unnamedblk2_3__DOT__i = 0U;
        while (VL_LTS_III(32, unnamedblk2_3__DOT__i, this->__PVT__positive_subfilters.size())) {
            if (([&]() {
                        VL_NULL_CHECK(this->__PVT__positive_subfilters.at(unnamedblk2_3__DOT__i), "/opt/svunit/svunit-3.37.0/svunit_base/svunit_filter.svh", 109)
                 ->__VnoInFunc_is_selected(vlSymsp, tc, test_name, __Vtask_is_selected__10__Vfuncout);
                    }(), (IData)(__Vtask_is_selected__10__Vfuncout))) {
                is_selected__Vfuncrtn = 1U;
                goto __Vlabel3;
            }
            unnamedblk2_3__DOT__i = ((IData)(1U) + unnamedblk2_3__DOT__i);
        }
        is_selected__Vfuncrtn = 0U;
        __Vlabel3: ;
    }
}
