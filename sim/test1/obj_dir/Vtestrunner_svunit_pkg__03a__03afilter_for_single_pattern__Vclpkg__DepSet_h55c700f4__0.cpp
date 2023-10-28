// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg::__VnoInFunc_str_contains_char(Vtestrunner__Syms* __restrict vlSymsp, std::string s, std::string c, CData/*0:0*/ &str_contains_char__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+  Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg::__VnoInFunc_str_contains_char\n"); );
    // Body
    IData/*31:0*/ unnamedblk2_1__DOT__i;
    unnamedblk2_1__DOT__i = 0;
    {
        if (VL_UNLIKELY((1U != VL_LEN_IN(c)))) {
            VL_WRITEF("[%0t] %%Fatal: svunit_filter_for_single_pattern.svh:70: Assertion failed in %Nsvunit_pkg.filter_for_single_pattern.str_contains_char: Expected a single character\n",
                      64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
            VL_STOP_MT("/opt/svunit/svunit-3.37.0/svunit_base/svunit_filter_for_single_pattern.svh", 70, "");
        }
        unnamedblk2_1__DOT__i = 0U;
        while (VL_LTS_III(32, unnamedblk2_1__DOT__i,
                          VL_LEN_IN(s))) {
            if ((VL_GETC_N(s,unnamedblk2_1__DOT__i)
                 == VL_GETC_N(c,0U))) {
                str_contains_char__Vfuncrtn = 1U;
                goto __Vlabel1;
            }
            unnamedblk2_1__DOT__i = ((IData)(1U) + unnamedblk2_1__DOT__i);
        }
        str_contains_char__Vfuncrtn = 0U;
        __Vlabel1: ;
    }
}

Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern(Vtestrunner__Syms* __restrict vlSymsp, std::string pattern) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::new\n"); );
    // Init
    _ctor_var_reset(vlSymsp);
    IData/*31:0*/ __Vfunc_get_dot_idx__0__Vfuncout;
    __Vfunc_get_dot_idx__0__Vfuncout = 0;
    // Body
    IData/*31:0*/ dot_idx;
    dot_idx = 0;
    this->__VnoInFunc_get_dot_idx(vlSymsp, pattern, __Vfunc_get_dot_idx__0__Vfuncout);
    dot_idx = __Vfunc_get_dot_idx__0__Vfuncout;
    this->__PVT__testcase = VL_SUBSTR_N(pattern,0U,
                                        (dot_idx - (IData)(1U)));
    this->__VnoInFunc_disallow_partial_wildcards(vlSymsp,
                                                 std::string{"testcase"}, this->__PVT__testcase);
    this->__PVT__test = VL_SUBSTR_N(pattern,((IData)(1U)
                                             + dot_idx),
                                    (VL_LEN_IN(pattern)
                                     - (IData)(1U)));
    this->__VnoInFunc_disallow_partial_wildcards(vlSymsp,
                                                 std::string{"test"}, this->__PVT__test);
}

void Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::__VnoInFunc_get_first_dot_idx(Vtestrunner__Syms* __restrict vlSymsp, std::string pattern, IData/*31:0*/ &get_first_dot_idx__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::__VnoInFunc_get_first_dot_idx\n"); );
    // Body
    IData/*31:0*/ unnamedblk1__DOT__i;
    unnamedblk1__DOT__i = 0;
    {
        unnamedblk1__DOT__i = 0U;
        while (VL_LTS_III(32, unnamedblk1__DOT__i,
                          VL_LEN_IN(pattern))) {
            if ((0x2eU == VL_GETC_N(pattern,unnamedblk1__DOT__i))) {
                get_first_dot_idx__Vfuncrtn = unnamedblk1__DOT__i;
                goto __Vlabel2;
            }
            unnamedblk1__DOT__i = ((IData)(1U) + unnamedblk1__DOT__i);
        }
        VL_WRITEF("[%0t] %%Fatal: svunit_filter_for_single_pattern.svh:50: Assertion failed in %Nsvunit_pkg.filter_for_single_pattern.get_first_dot_idx: Expected the filter to be of the type '<test_case>.<test>[:<test_case>.<test>]'\n",
                  64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("/opt/svunit/svunit-3.37.0/svunit_base/svunit_filter_for_single_pattern.svh", 50, "");
        __Vlabel2: ;
    }
}

void Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::__VnoInFunc_ensure_no_more_dots(Vtestrunner__Syms* __restrict vlSymsp, std::string pattern, IData/*31:0*/ first_dot_idx) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::__VnoInFunc_ensure_no_more_dots\n"); );
    // Body
    IData/*31:0*/ unnamedblk2__DOT__i;
    unnamedblk2__DOT__i = 0;
    unnamedblk2__DOT__i = ((IData)(1U) + first_dot_idx);
    while (VL_LTS_III(32, unnamedblk2__DOT__i, VL_LEN_IN(pattern))) {
        if (VL_UNLIKELY((0x2eU == VL_GETC_N(pattern,unnamedblk2__DOT__i)))) {
            VL_WRITEF("[%0t] %%Fatal: svunit_filter_for_single_pattern.svh:57: Assertion failed in %Nsvunit_pkg.filter_for_single_pattern.ensure_no_more_dots.unnamedblk2: Expected the filter to be of the type '<test_case>.<test>[:<test_case>.<test>]'\n",
                      64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
            VL_STOP_MT("/opt/svunit/svunit-3.37.0/svunit_base/svunit_filter_for_single_pattern.svh", 57, "");
        }
        unnamedblk2__DOT__i = ((IData)(1U) + unnamedblk2__DOT__i);
    }
}

void Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::__VnoInFunc_disallow_partial_wildcards(Vtestrunner__Syms* __restrict vlSymsp, std::string field_name, std::string field_value) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::__VnoInFunc_disallow_partial_wildcards\n"); );
    // Init
    CData/*0:0*/ __Vfunc_str_contains_char__5__Vfuncout;
    __Vfunc_str_contains_char__5__Vfuncout = 0;
    std::string __Vtemp_1;
    // Body
    if ((std::string{"*"} != field_value)) {
        if (VL_UNLIKELY(([&]() {
                        vlSymsp->TOP__svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg.__VnoInFunc_str_contains_char(vlSymsp, field_value,
                                                                                std::string{"*"}, __Vfunc_str_contains_char__5__Vfuncout);
                    }(), (IData)(__Vfunc_str_contains_char__5__Vfuncout)))) {
            __Vtemp_1 = VL_SFORMATF_NX("Partial wildcards in %@ names aren't currently supported",
                                       -1,&(field_name)) ;
            VL_WRITEF("[%0t] %%Fatal: svunit_filter_for_single_pattern.svh:64: Assertion failed in %Nsvunit_pkg.filter_for_single_pattern.disallow_partial_wildcards: %@\n",
                      64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name(),
                      -1,&(__Vtemp_1));
            VL_STOP_MT("/opt/svunit/svunit-3.37.0/svunit_base/svunit_filter_for_single_pattern.svh", 64, "");
        }
    }
}

void Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::_ctor_var_reset(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::_ctor_var_reset\n"); );
    // Body
    if (false && vlSymsp) {}  // Prevent unused
    }
