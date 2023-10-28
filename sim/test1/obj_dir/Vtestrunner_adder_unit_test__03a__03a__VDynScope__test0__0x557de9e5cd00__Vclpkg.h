// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtestrunner.h for the primary calling header

#ifndef VERILATED_VTESTRUNNER_ADDER_UNIT_TEST__03A__03A__VDYNSCOPE__TEST0__0X557DE9E5CD00__VCLPKG_H_
#define VERILATED_VTESTRUNNER_ADDER_UNIT_TEST__03A__03A__VDYNSCOPE__TEST0__0X557DE9E5CD00__VCLPKG_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vtestrunner__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x557de9e5cd00__Vclpkg final : public VerilatedModule {
  public:

    // INTERNAL VARIABLES
    Vtestrunner__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x557de9e5cd00__Vclpkg(Vtestrunner__Syms* symsp, const char* v__name);
    ~Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x557de9e5cd00__Vclpkg();
    VL_UNCOPYABLE(Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x557de9e5cd00__Vclpkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


class Vtestrunner__Syms;

class Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x557de9e5cd00 : public VlClass {
  public:

    // DESIGN SPECIFIC STATE
    IData/*31:0*/ __PVT__local_error_count;
  private:
    void _ctor_var_reset(Vtestrunner__Syms* __restrict vlSymsp);
  public:
    Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x557de9e5cd00(Vtestrunner__Syms* __restrict vlSymsp);
    std::string to_string() const;
    std::string to_string_middle() const;
    ~Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x557de9e5cd00();
};

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x557de9e5cd00>& obj);

#endif  // guard
