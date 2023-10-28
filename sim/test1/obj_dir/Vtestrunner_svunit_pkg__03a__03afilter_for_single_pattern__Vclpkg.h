// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtestrunner.h for the primary calling header

#ifndef VERILATED_VTESTRUNNER_SVUNIT_PKG__03A__03AFILTER_FOR_SINGLE_PATTERN__VCLPKG_H_
#define VERILATED_VTESTRUNNER_SVUNIT_PKG__03A__03AFILTER_FOR_SINGLE_PATTERN__VCLPKG_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
class Vtestrunner_svunit_pkg__03a__03asvunit_testcase;


class Vtestrunner__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    std::string __PVT__error_msg;

    // INTERNAL VARIABLES
    Vtestrunner__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg(Vtestrunner__Syms* symsp, const char* v__name);
    ~Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg();
    VL_UNCOPYABLE(Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
    void __VnoInFunc_str_contains_char(Vtestrunner__Syms* __restrict vlSymsp, std::string s, std::string c, CData/*0:0*/ &str_contains_char__Vfuncrtn);
};


class Vtestrunner__Syms;

class Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern : public VlClass {
  public:

    // DESIGN SPECIFIC STATE
    std::string __PVT__testcase;
    std::string __PVT__test;
    void __VnoInFunc_disallow_partial_wildcards(Vtestrunner__Syms* __restrict vlSymsp, std::string field_name, std::string field_value);
    void __VnoInFunc_ensure_no_more_dots(Vtestrunner__Syms* __restrict vlSymsp, std::string pattern, IData/*31:0*/ first_dot_idx);
    void __VnoInFunc_get_dot_idx(Vtestrunner__Syms* __restrict vlSymsp, std::string pattern, IData/*31:0*/ &get_dot_idx__Vfuncrtn);
    void __VnoInFunc_get_first_dot_idx(Vtestrunner__Syms* __restrict vlSymsp, std::string pattern, IData/*31:0*/ &get_first_dot_idx__Vfuncrtn);
    void __VnoInFunc_is_match(Vtestrunner__Syms* __restrict vlSymsp, std::string filter_val, std::string val, CData/*0:0*/ &is_match__Vfuncrtn);
    virtual void __VnoInFunc_is_selected(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testcase> tc, std::string test_name, CData/*0:0*/ &is_selected__Vfuncrtn);
  private:
    void _ctor_var_reset(Vtestrunner__Syms* __restrict vlSymsp);
  public:
    Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern(Vtestrunner__Syms* __restrict vlSymsp, std::string pattern);
    std::string to_string() const;
    std::string to_string_middle() const;
    ~Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern();
};

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern>& obj);

#endif  // guard
