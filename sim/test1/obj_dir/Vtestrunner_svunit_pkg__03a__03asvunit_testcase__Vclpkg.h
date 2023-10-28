// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtestrunner.h for the primary calling header

#ifndef VERILATED_VTESTRUNNER_SVUNIT_PKG__03A__03ASVUNIT_TESTCASE__VCLPKG_H_
#define VERILATED_VTESTRUNNER_SVUNIT_PKG__03A__03ASVUNIT_TESTCASE__VCLPKG_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
class Vtestrunner_junit_xml__03a__03aTestCase;
class Vtestrunner_svunit_pkg__03a__03asvunit_base;


class Vtestrunner__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg final : public VerilatedModule {
  public:

    // INTERNAL VARIABLES
    Vtestrunner__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg(Vtestrunner__Syms* symsp, const char* v__name);
    ~Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg();
    VL_UNCOPYABLE(Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};

#include "Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg.h"

class Vtestrunner__Syms;

class Vtestrunner_svunit_pkg__03a__03asvunit_testcase : public Vtestrunner_svunit_pkg__03a__03asvunit_base {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ __PVT__running;
    IData/*31:0*/ __PVT__test_count;
    IData/*31:0*/ __PVT__error_count;
    VlClassRef<Vtestrunner_junit_xml__03a__03aTestCase> __PVT__current_junit_test_case;
    VlQueue<VlClassRef<Vtestrunner_junit_xml__03a__03aTestCase>> __PVT__junit_test_cases;
    void __VnoInFunc_add_junit_test_case(Vtestrunner__Syms* __restrict vlSymsp, std::string name);
    void __VnoInFunc_as_junit_test_cases(Vtestrunner__Syms* __restrict vlSymsp, VlQueue<VlClassRef<Vtestrunner_junit_xml__03a__03aTestCase>> &as_junit_test_cases__Vfuncrtn);
    void __VnoInFunc_fail(Vtestrunner__Syms* __restrict vlSymsp, std::string c, CData/*0:0*/ b, std::string s, std::string f, IData/*31:0*/ l, std::string d, CData/*0:0*/ &fail__Vfuncrtn);
    void __VnoInFunc_get_error_count(Vtestrunner__Syms* __restrict vlSymsp, IData/*31:0*/ &get_error_count__Vfuncrtn);
    VlCoroutine __VnoInFunc_give_up(Vtestrunner__Syms* __restrict vlSymsp);
    void __VnoInFunc_is_running(Vtestrunner__Syms* __restrict vlSymsp, CData/*0:0*/ &is_running__Vfuncrtn);
    void __VnoInFunc_report(Vtestrunner__Syms* __restrict vlSymsp);
    virtual void __VnoInFunc_setup(Vtestrunner__Syms* __restrict vlSymsp);
    void __VnoInFunc_start(Vtestrunner__Syms* __restrict vlSymsp);
    void __VnoInFunc_stop(Vtestrunner__Syms* __restrict vlSymsp);
    virtual void __VnoInFunc_teardown(Vtestrunner__Syms* __restrict vlSymsp);
    void __VnoInFunc_update_exit_status(Vtestrunner__Syms* __restrict vlSymsp);
    VlCoroutine __VnoInFunc_wait_for_error(Vtestrunner__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset(Vtestrunner__Syms* __restrict vlSymsp);
  public:
    Vtestrunner_svunit_pkg__03a__03asvunit_testcase(Vtestrunner__Syms* __restrict vlSymsp, std::string name);
    std::string to_string() const;
    std::string to_string_middle() const;
    virtual ~Vtestrunner_svunit_pkg__03a__03asvunit_testcase();
};

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_testcase>& obj);

#endif  // guard
