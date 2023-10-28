// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtestrunner.h for the primary calling header

#ifndef VERILATED_VTESTRUNNER_SVUNIT_PKG__03A__03ASVUNIT_BASE__VCLPKG_H_
#define VERILATED_VTESTRUNNER_SVUNIT_PKG__03A__03ASVUNIT_BASE__VCLPKG_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vtestrunner__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg final : public VerilatedModule {
  public:

    // INTERNAL VARIABLES
    Vtestrunner__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg(Vtestrunner__Syms* symsp, const char* v__name);
    ~Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg();
    VL_UNCOPYABLE(Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


class Vtestrunner__Syms;

class Vtestrunner_svunit_pkg__03a__03asvunit_base : public VlClass {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ __PVT__success;
    std::string __PVT__name;
    void __VnoInFunc_get_name(Vtestrunner__Syms* __restrict vlSymsp, std::string &get_name__Vfuncrtn);
    void __VnoInFunc_get_results(Vtestrunner__Syms* __restrict vlSymsp, CData/*0:0*/ &get_results__Vfuncrtn);
    virtual void __VnoInFunc_report(Vtestrunner__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset(Vtestrunner__Syms* __restrict vlSymsp);
  public:
    Vtestrunner_svunit_pkg__03a__03asvunit_base(Vtestrunner__Syms* __restrict vlSymsp, std::string name);
    std::string to_string() const;
    std::string to_string_middle() const;
    virtual ~Vtestrunner_svunit_pkg__03a__03asvunit_base();
};

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_base>& obj);

#endif  // guard
