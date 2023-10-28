// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03astring_utils__Vclpkg.h"

Vtestrunner_svunit_pkg__03a__03astring_utils::~Vtestrunner_svunit_pkg__03a__03astring_utils() {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03astring_utils::~\n"); );
}

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_svunit_pkg__03a__03astring_utils>& obj) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03astring_utils::VL_TO_STRING\n"); );
    // Body
    return (obj ? obj->to_string() : "null");
}

std::string Vtestrunner_svunit_pkg__03a__03astring_utils::to_string() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03astring_utils::to_string\n"); );
    // Body
    return (std::string{"'{"} + to_string_middle() + "}");
}

std::string Vtestrunner_svunit_pkg__03a__03astring_utils::to_string_middle() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03astring_utils::to_string_middle\n"); );
    // Body
    std::string out;
    return out;
}
