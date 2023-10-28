// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtestrunner.h for the primary calling header

#ifndef VERILATED_VTESTRUNNER_SVUNIT_PKG__03A__03AFILTER__VCLPKG_H_
#define VERILATED_VTESTRUNNER_SVUNIT_PKG__03A__03AFILTER__VCLPKG_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
#include "Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg.h"
class Vtestrunner_svunit_pkg__03a__03afilter;
class Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern;
class Vtestrunner_svunit_pkg__03a__03asvunit_testcase;


class Vtestrunner__Syms;

// UNPACKED STRUCT TYPES
struct Vtestrunner_filter_expression_parts__struct__0 {
    std::string __PVT__positive;
    std::string __PVT__negative;

    bool operator==(const Vtestrunner_filter_expression_parts__struct__0& rhs) const {
        return __PVT__positive == rhs.__PVT__positive
            && __PVT__negative == rhs.__PVT__negative;
    }
    bool operator!=(const Vtestrunner_filter_expression_parts__struct__0& rhs) const {
        return !(*this == rhs);
    }
};

class alignas(VL_CACHE_LINE_BYTES) Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter> __PVT__single_instance;

    // INTERNAL VARIABLES
    Vtestrunner__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg(Vtestrunner__Syms* symsp, const char* v__name);
    ~Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg();
    VL_UNCOPYABLE(Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
    void __VnoInFunc_get(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter> &get__Vfuncrtn);
};

std::string VL_TO_STRING(const Vtestrunner_filter_expression_parts__struct__0& obj);

class Vtestrunner__Syms;

class Vtestrunner_svunit_pkg__03a__03afilter : public VlClass {
  public:

    // DESIGN SPECIFIC STATE
    VlQueue<VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern>> __PVT__positive_subfilters;
    VlQueue<VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern>> __PVT__negative_subfilters;
    void __VnoInFunc_get_filter_expression_parts(Vtestrunner__Syms* __restrict vlSymsp, std::string raw_filter, Vtestrunner_filter_expression_parts__struct__0 &get_filter_expression_parts__Vfuncrtn);
    void __VnoInFunc_get_filter_value_from_run_script(Vtestrunner__Syms* __restrict vlSymsp, std::string &get_filter_value_from_run_script__Vfuncrtn);
    void __VnoInFunc_get_subfilter_from_non_trivial_expr(Vtestrunner__Syms* __restrict vlSymsp, std::string pattern, VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern> &get_subfilter_from_non_trivial_expr__Vfuncrtn);
    void __VnoInFunc_get_subfilters(Vtestrunner__Syms* __restrict vlSymsp, std::string raw_filter, VlQueue<VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern>> &get_subfilters__Vfuncrtn);
    void __VnoInFunc_is_selected(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testcase> tc, std::string test_name, CData/*0:0*/ &is_selected__Vfuncrtn);
  private:
    void _ctor_var_reset(Vtestrunner__Syms* __restrict vlSymsp);
  public:
    Vtestrunner_svunit_pkg__03a__03afilter(Vtestrunner__Syms* __restrict vlSymsp);
    std::string to_string() const;
    std::string to_string_middle() const;
    ~Vtestrunner_svunit_pkg__03a__03afilter();
};

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter>& obj);

#endif  // guard
