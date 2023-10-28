// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x558c1ac9cd00__Vclpkg.h"

Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x558c1ac9cd00::~Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x558c1ac9cd00() {
    VL_DEBUG_IF(VL_DBG_MSGF("+  Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x558c1ac9cd00::~\n"); );
}

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x558c1ac9cd00>& obj) {
    VL_DEBUG_IF(VL_DBG_MSGF("+  Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x558c1ac9cd00::VL_TO_STRING\n"); );
    // Body
    return (obj ? obj->to_string() : "null");
}

std::string Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x558c1ac9cd00::to_string() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+  Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x558c1ac9cd00::to_string\n"); );
    // Body
    return (std::string{"'{"} + to_string_middle() + "}");
}

std::string Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x558c1ac9cd00::to_string_middle() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+  Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x558c1ac9cd00::to_string_middle\n"); );
    // Body
    std::string out;
    out += "local_error_count:" + VL_TO_STRING(__PVT__local_error_count);
    return out;
}
