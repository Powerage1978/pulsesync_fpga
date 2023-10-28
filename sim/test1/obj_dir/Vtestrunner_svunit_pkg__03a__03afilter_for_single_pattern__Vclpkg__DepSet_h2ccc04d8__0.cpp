// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::__VnoInFunc_get_dot_idx(Vtestrunner__Syms* __restrict vlSymsp, std::string pattern, IData/*31:0*/ &get_dot_idx__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::__VnoInFunc_get_dot_idx\n"); );
    // Init
    IData/*31:0*/ __Vfunc_get_first_dot_idx__3__Vfuncout;
    __Vfunc_get_first_dot_idx__3__Vfuncout = 0;
    // Body
    IData/*31:0*/ first_dot_idx;
    first_dot_idx = 0;
    this->__VnoInFunc_get_first_dot_idx(vlSymsp, pattern, __Vfunc_get_first_dot_idx__3__Vfuncout);
    first_dot_idx = __Vfunc_get_first_dot_idx__3__Vfuncout;
    this->__VnoInFunc_ensure_no_more_dots(vlSymsp, pattern, first_dot_idx);
    get_dot_idx__Vfuncrtn = first_dot_idx;
}

void Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::__VnoInFunc_is_match(Vtestrunner__Syms* __restrict vlSymsp, std::string filter_val, std::string val, CData/*0:0*/ &is_match__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::__VnoInFunc_is_match\n"); );
    // Body
    is_match__Vfuncrtn = ((std::string{"*"} == filter_val)
                          | (filter_val == val));
}

Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::~Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern() {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::~\n"); );
}

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern>& obj) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::VL_TO_STRING\n"); );
    // Body
    return (obj ? obj->to_string() : "null");
}

std::string Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::to_string() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::to_string\n"); );
    // Body
    return (std::string{"'{"} + to_string_middle() + "}");
}

std::string Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::to_string_middle() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern::to_string_middle\n"); );
    // Body
    std::string out;
    out += "testcase:" + VL_TO_STRING(__PVT__testcase);
    out += ", test:" + VL_TO_STRING(__PVT__test);
    return out;
}
