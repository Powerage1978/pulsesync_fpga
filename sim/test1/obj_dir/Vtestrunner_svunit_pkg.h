// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtestrunner.h for the primary calling header

#ifndef VERILATED_VTESTRUNNER_SVUNIT_PKG_H_
#define VERILATED_VTESTRUNNER_SVUNIT_PKG_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
class Vtestrunner_svunit_pkg__03a__03afilter;
class Vtestrunner_svunit_pkg__03a__03asvunit_testcase;


class Vtestrunner__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtestrunner_svunit_pkg final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testcase> current_tc;
    VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter> _filter;

    // INTERNAL VARIABLES
    Vtestrunner__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtestrunner_svunit_pkg(Vtestrunner__Syms* symsp, const char* v__name);
    ~Vtestrunner_svunit_pkg();
    VL_UNCOPYABLE(Vtestrunner_svunit_pkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
