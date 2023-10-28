// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg.h"

std::string VL_TO_STRING(const Vtestrunner_filter_expression_parts__struct__0& obj) {
    VL_DEBUG_IF(VL_DBG_MSGF("+  Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg::VL_TO_STRING\n"); );
    // Body
    std::string out;
    out += "'{positive:" + VL_TO_STRING(obj.__PVT__positive);
        out += ", negative:" + VL_TO_STRING(obj.__PVT__negative);
        out += "}";
    return out;
}

void Vtestrunner_svunit_pkg__03a__03afilter::__VnoInFunc_get_filter_value_from_run_script(Vtestrunner__Syms* __restrict vlSymsp, std::string &get_filter_value_from_run_script__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter::__VnoInFunc_get_filter_value_from_run_script\n"); );
    // Init
    VlWide<4>/*127:0*/ __Vtemp_1;
    // Body
    std::string result;
    __Vtemp_1[0U] = 0x523d2573U;
    __Vtemp_1[1U] = 0x494c5445U;
    __Vtemp_1[2U] = 0x49545f46U;
    __Vtemp_1[3U] = 0x5356554eU;
    if ((! VL_VALUEPLUSARGS_INN(64, VL_CVT_PACK_STR_NW(4, __Vtemp_1),
                                result))) {
        result = std::string{"*"};
    }
    get_filter_value_from_run_script__Vfuncrtn = result;
}

Vtestrunner_svunit_pkg__03a__03afilter::~Vtestrunner_svunit_pkg__03a__03afilter() {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter::~\n"); );
}

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter>& obj) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter::VL_TO_STRING\n"); );
    // Body
    return (obj ? obj->to_string() : "null");
}

std::string Vtestrunner_svunit_pkg__03a__03afilter::to_string() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter::to_string\n"); );
    // Body
    return (std::string{"'{"} + to_string_middle() + "}");
}

std::string Vtestrunner_svunit_pkg__03a__03afilter::to_string_middle() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03afilter::to_string_middle\n"); );
    // Body
    std::string out;
    out += "positive_subfilters:" + VL_TO_STRING(__PVT__positive_subfilters);
    out += ", negative_subfilters:" + VL_TO_STRING(__PVT__negative_subfilters);
    return out;
}
