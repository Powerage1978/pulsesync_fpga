// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03afilter::__VnoInFunc_get_subfilters(Vtestrunner__Syms* __restrict vlSymsp, std::string raw_filter, VlQueue<VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern>> &get_subfilters__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter::__VnoInFunc_get_subfilters\n"); );
    // Init
    VlQueue<std::string> __Vfunc_split_by_char__6__Vfuncout;
    VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern> __Vfunc_get_subfilter_from_non_trivial_expr__7__Vfuncout;
    // Body
    VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern> unnamedblk1__DOT__filter_that_always_matches;
    IData/*31:0*/ unnamedblk2_1__DOT__i;
    unnamedblk2_1__DOT__i = 0;
    VlQueue<VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern>> result;
    VlQueue<std::string> patterns;
    {
        if ((std::string{"*"} == raw_filter)) {
            unnamedblk1__DOT__filter_that_always_matches
                = VL_NEW(Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern, vlSymsp,
                         std::string{"*.*"});
            get_subfilters__Vfuncrtn = VlQueue<VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern>>::cons(unnamedblk1__DOT__filter_that_always_matches,
                                                                                VlQueue<VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern>>());
            goto __Vlabel2;
        }
        vlSymsp->TOP__svunit_pkg__03a__03astring_utils__Vclpkg.__VnoInFunc_split_by_char(vlSymsp,
                                                                                std::string{":"}, raw_filter, __Vfunc_split_by_char__6__Vfuncout);
        patterns = __Vfunc_split_by_char__6__Vfuncout;
        unnamedblk2_1__DOT__i = 0U;
        while (VL_LTS_III(32, unnamedblk2_1__DOT__i, patterns.size())) {
            result.push_back(([&]() {
                        this->__VnoInFunc_get_subfilter_from_non_trivial_expr(vlSymsp,
                                                                              VL_CVT_PACK_STR_NN(patterns.at(unnamedblk2_1__DOT__i)), __Vfunc_get_subfilter_from_non_trivial_expr__7__Vfuncout);
                    }(), __Vfunc_get_subfilter_from_non_trivial_expr__7__Vfuncout));
            unnamedblk2_1__DOT__i = ((IData)(1U) + unnamedblk2_1__DOT__i);
        }
        get_subfilters__Vfuncrtn = result;
        __Vlabel2: ;
    }
}

void Vtestrunner_svunit_pkg__03a__03afilter::__VnoInFunc_get_subfilter_from_non_trivial_expr(Vtestrunner__Syms* __restrict vlSymsp, std::string pattern, VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern> &get_subfilter_from_non_trivial_expr__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter::__VnoInFunc_get_subfilter_from_non_trivial_expr\n"); );
    // Body
    VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern> result;
    result = VL_NEW(Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern, vlSymsp, pattern);
    get_subfilter_from_non_trivial_expr__Vfuncrtn = result;
}
