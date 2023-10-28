// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtestrunner.h for the primary calling header

#ifndef VERILATED_VTESTRUNNER_JUNIT_XML_H_
#define VERILATED_VTESTRUNNER_JUNIT_XML_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vtestrunner__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtestrunner_junit_xml final : public VerilatedModule {
  public:

    // INTERNAL VARIABLES
    Vtestrunner__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtestrunner_junit_xml(Vtestrunner__Syms* symsp, const char* v__name);
    ~Vtestrunner_junit_xml();
    VL_UNCOPYABLE(Vtestrunner_junit_xml);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
