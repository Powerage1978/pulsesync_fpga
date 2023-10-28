// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtestrunner.h for the primary calling header

#ifndef VERILATED_VTESTRUNNER_SVUNIT_PKG__03A__03ASVUNIT_TESTSUITE__VCLPKG_H_
#define VERILATED_VTESTRUNNER_SVUNIT_PKG__03A__03ASVUNIT_TESTSUITE__VCLPKG_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
class Vtestrunner_junit_xml__03a__03aTestCase;
class Vtestrunner_junit_xml__03a__03aTestSuite;
class Vtestrunner_svunit_pkg__03a__03asvunit_base;
class Vtestrunner_svunit_pkg__03a__03asvunit_testcase;


class Vtestrunner__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg final : public VerilatedModule {
  public:

    // INTERNAL VARIABLES
    Vtestrunner__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg(Vtestrunner__Syms* symsp, const char* v__name);
    ~Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg();
    VL_UNCOPYABLE(Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};

#include "Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg.h"

class Vtestrunner__Syms;

class Vtestrunner_svunit_pkg__03a__03asvunit_testsuite : public Vtestrunner_svunit_pkg__03a__03asvunit_base {
  public:

    // DESIGN SPECIFIC STATE
    VlQueue<VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testcase>> __PVT__list_of_testcases;
    void __VnoInFunc_add_testcase(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testcase> svunit);
    void __VnoInFunc_as_junit_test_suite(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_junit_xml__03a__03aTestSuite> &as_junit_test_suite__Vfuncrtn);
    void __VnoInFunc_get_num_passing_testcases(Vtestrunner__Syms* __restrict vlSymsp, IData/*31:0*/ &get_num_passing_testcases__Vfuncrtn);
    void __VnoInFunc_report(Vtestrunner__Syms* __restrict vlSymsp);
    void __VnoInFunc_run(Vtestrunner__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset(Vtestrunner__Syms* __restrict vlSymsp);
  public:
    Vtestrunner_svunit_pkg__03a__03asvunit_testsuite(Vtestrunner__Syms* __restrict vlSymsp, std::string name);
    std::string to_string() const;
    std::string to_string_middle() const;
    virtual ~Vtestrunner_svunit_pkg__03a__03asvunit_testsuite();
};

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testsuite>& obj);

#endif  // guard
