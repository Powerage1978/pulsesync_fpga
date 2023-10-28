// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtestrunner.h for the primary calling header

#ifndef VERILATED_VTESTRUNNER_SVUNIT_PKG__03A__03ASVUNIT_TESTRUNNER__VCLPKG_H_
#define VERILATED_VTESTRUNNER_SVUNIT_PKG__03A__03ASVUNIT_TESTRUNNER__VCLPKG_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
class Vtestrunner_junit_xml__03a__03aTestSuite;
class Vtestrunner_junit_xml__03a__03aXmlElement;
class Vtestrunner_svunit_pkg__03a__03asvunit_base;
class Vtestrunner_svunit_pkg__03a__03asvunit_testsuite;


class Vtestrunner__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtestrunner_svunit_pkg__03a__03asvunit_testrunner__Vclpkg final : public VerilatedModule {
  public:

    // INTERNAL VARIABLES
    Vtestrunner__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtestrunner_svunit_pkg__03a__03asvunit_testrunner__Vclpkg(Vtestrunner__Syms* symsp, const char* v__name);
    ~Vtestrunner_svunit_pkg__03a__03asvunit_testrunner__Vclpkg();
    VL_UNCOPYABLE(Vtestrunner_svunit_pkg__03a__03asvunit_testrunner__Vclpkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};

#include "Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg.h"

class Vtestrunner__Syms;

class Vtestrunner_svunit_pkg__03a__03asvunit_testrunner : public Vtestrunner_svunit_pkg__03a__03asvunit_base {
  public:

    // DESIGN SPECIFIC STATE
    VlQueue<VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testsuite>> __PVT__list_of_suites;
    void __VnoInFunc_add_testsuite(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testsuite> suite);
    void __VnoInFunc_get_num_passing_testsuites(Vtestrunner__Syms* __restrict vlSymsp, IData/*31:0*/ &get_num_passing_testsuites__Vfuncrtn);
    void __VnoInFunc_report(Vtestrunner__Syms* __restrict vlSymsp);
    void __VnoInFunc_write_xml(Vtestrunner__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset(Vtestrunner__Syms* __restrict vlSymsp);
  public:
    Vtestrunner_svunit_pkg__03a__03asvunit_testrunner(Vtestrunner__Syms* __restrict vlSymsp, std::string name);
    std::string to_string() const;
    std::string to_string_middle() const;
    virtual ~Vtestrunner_svunit_pkg__03a__03asvunit_testrunner();
};

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testrunner>& obj);

#endif  // guard
