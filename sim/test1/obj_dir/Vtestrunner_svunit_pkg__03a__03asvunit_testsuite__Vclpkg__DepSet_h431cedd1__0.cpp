// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg.h"

Vtestrunner_svunit_pkg__03a__03asvunit_testsuite::~Vtestrunner_svunit_pkg__03a__03asvunit_testsuite() {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testsuite::~\n"); );
}

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testsuite>& obj) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testsuite::VL_TO_STRING\n"); );
    // Body
    return (obj ? obj->to_string() : "null");
}

std::string Vtestrunner_svunit_pkg__03a__03asvunit_testsuite::to_string() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testsuite::to_string\n"); );
    // Body
    return (std::string{"'{"} + to_string_middle() + "}");
}

std::string Vtestrunner_svunit_pkg__03a__03asvunit_testsuite::to_string_middle() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testsuite::to_string_middle\n"); );
    // Body
    std::string out;
    out += "list_of_testcases:" + VL_TO_STRING(__PVT__list_of_testcases);
    out += ", "+ Vtestrunner_svunit_pkg__03a__03asvunit_base::to_string_middle();
    return out;
}
