// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg::__VnoInFunc_get(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter> &get__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+  Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg::__VnoInFunc_get\n"); );
    // Body
    if ((VlNull{} == this->__PVT__single_instance)) {
        this->__PVT__single_instance = VL_NEW(Vtestrunner_svunit_pkg__03a__03afilter, vlSymsp);
    }
    get__Vfuncrtn = this->__PVT__single_instance;
}

Vtestrunner_svunit_pkg__03a__03afilter::Vtestrunner_svunit_pkg__03a__03afilter(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter::new\n"); );
    // Init
    _ctor_var_reset(vlSymsp);
    std::string __Vfunc_get_filter_value_from_run_script__0__Vfuncout;
    Vtestrunner_filter_expression_parts__struct__0 __Vfunc_get_filter_expression_parts__1__Vfuncout;
    VlQueue<VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern>> __Vfunc_get_subfilters__2__Vfuncout;
    VlQueue<VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern>> __Vfunc_get_subfilters__3__Vfuncout;
    // Body
    std::string raw_filter;
    this->__VnoInFunc_get_filter_value_from_run_script(vlSymsp, __Vfunc_get_filter_value_from_run_script__0__Vfuncout);
    raw_filter = __Vfunc_get_filter_value_from_run_script__0__Vfuncout;
    Vtestrunner_filter_expression_parts__struct__0 parts;
    this->__VnoInFunc_get_filter_expression_parts(vlSymsp, raw_filter, __Vfunc_get_filter_expression_parts__1__Vfuncout);
    parts = __Vfunc_get_filter_expression_parts__1__Vfuncout;
    this->__VnoInFunc_get_subfilters(vlSymsp, VL_CVT_PACK_STR_NN(parts
                                                                 .__PVT__positive), __Vfunc_get_subfilters__2__Vfuncout);
    this->__PVT__positive_subfilters = __Vfunc_get_subfilters__2__Vfuncout;
    if ((std::string{""} != parts.__PVT__negative)) {
        this->__VnoInFunc_get_subfilters(vlSymsp, VL_CVT_PACK_STR_NN(parts
                                                                     .__PVT__negative), __Vfunc_get_subfilters__3__Vfuncout);
        this->__PVT__negative_subfilters = __Vfunc_get_subfilters__3__Vfuncout;
    }
}

void Vtestrunner_svunit_pkg__03a__03afilter::__VnoInFunc_get_filter_expression_parts(Vtestrunner__Syms* __restrict vlSymsp, std::string raw_filter, Vtestrunner_filter_expression_parts__struct__0 &get_filter_expression_parts__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter::__VnoInFunc_get_filter_expression_parts\n"); );
    // Init
    VlQueue<std::string> __Vfunc_split_by_char__4__Vfuncout;
    // Body
    VlQueue<std::string> parts;
    {
        if ((0x2dU == VL_GETC_N(raw_filter,0U))) {
            raw_filter = VL_CONCATN_NNN(std::string{"*"}, raw_filter);
        }
        vlSymsp->TOP__svunit_pkg__03a__03astring_utils__Vclpkg.__VnoInFunc_split_by_char(vlSymsp,
                                                                                std::string{"-"}, raw_filter, __Vfunc_split_by_char__4__Vfuncout);
        parts = __Vfunc_split_by_char__4__Vfuncout;
        if (VL_UNLIKELY(VL_LTS_III(32, 2U, parts.size()))) {
            VL_WRITEF("[%0t] %%Fatal: svunit_filter.svh:72: Assertion failed in %Nsvunit_pkg.filter.get_filter_expression_parts: Expected at most a single '-' character.\n",
                      64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
            VL_STOP_MT("/opt/svunit/svunit-3.37.0/svunit_base/svunit_filter.svh", 72, "");
        }
        if ((1U == parts.size())) {
            get_filter_expression_parts__Vfuncrtn =
                Vtestrunner_filter_expression_parts__struct__0{
                .__PVT__positive = parts.at(0U), .__PVT__negative =
                std::string{""}};
            goto __Vlabel1;
        }
        get_filter_expression_parts__Vfuncrtn = Vtestrunner_filter_expression_parts__struct__0{
            .__PVT__positive = parts.at(0U), .__PVT__negative = parts.at(1U)};
        __Vlabel1: ;
    }
}

void Vtestrunner_svunit_pkg__03a__03afilter::_ctor_var_reset(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter::_ctor_var_reset\n"); );
    // Body
    if (false && vlSymsp) {}  // Prevent unused
    }
