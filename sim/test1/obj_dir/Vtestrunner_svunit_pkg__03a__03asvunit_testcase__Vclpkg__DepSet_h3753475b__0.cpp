// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg.h"

Vtestrunner_svunit_pkg__03a__03asvunit_testcase::Vtestrunner_svunit_pkg__03a__03asvunit_testcase(Vtestrunner__Syms* __restrict vlSymsp, std::string name): Vtestrunner_svunit_pkg__03a__03asvunit_base(vlSymsp, name) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::new\n"); );
    // Init
    _ctor_var_reset(vlSymsp);
    // Body
    this->__PVT__running = 0U;
    this->__PVT__error_count = 0U;
    this->__PVT__test_count = 0U;
    ;
}

VlCoroutine Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_wait_for_error(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_wait_for_error\n"); );
    // Init
    VL_KEEP_THIS;
    // Body
    CData/*0:0*/ __VdynTrigger_h4909eafd__0;
    __VdynTrigger_h4909eafd__0 = 0;
    __VdynTrigger_h4909eafd__0 = 0U;
    IData/*31:0*/ __Vtrigprevexpr_h3ae615e3__0;
    __Vtrigprevexpr_h3ae615e3__0 = 0;
    __Vtrigprevexpr_h3ae615e3__0 = this->__PVT__error_count;
    while ((1U & (~ (IData)(__VdynTrigger_h4909eafd__0)))) {
        co_await vlSymsp->TOP.__VdynSched.evaluation(
                                                     nullptr,
                                                     "@([changed] svunit_pkg::svunit_testcase.error_count)",
                                                     "/opt/svunit/svunit-3.37.0/svunit_base/svunit_testcase.sv",
                                                     104);
        __VdynTrigger_h4909eafd__0 = (this->__PVT__error_count
                                      != __Vtrigprevexpr_h3ae615e3__0);
        __Vtrigprevexpr_h3ae615e3__0 = this->__PVT__error_count;
    }
    co_await vlSymsp->TOP.__VdynSched.resumption(nullptr,
                                                 "@([changed] svunit_pkg::svunit_testcase.error_count)",
                                                 "/opt/svunit/svunit-3.37.0/svunit_base/svunit_testcase.sv",
                                                 104);
}

VlCoroutine Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_give_up(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::__VnoInFunc_give_up\n"); );
    // Init
    VL_KEEP_THIS;
    // Body
    CData/*0:0*/ never_true;
    never_true = 0;
    never_true = 0U;
    CData/*0:0*/ __VdynTrigger_h14c4c9ea__0;
    __VdynTrigger_h14c4c9ea__0 = 0;
    __VdynTrigger_h14c4c9ea__0 = 0U;
    while ((1U & (~ (IData)(__VdynTrigger_h14c4c9ea__0)))) {
        co_await vlSymsp->TOP.__VdynSched.evaluation(
                                                     nullptr,
                                                     "@([true] svunit_pkg::svunit_testcase.never_true)",
                                                     "/opt/svunit/svunit-3.37.0/svunit_base/svunit_testcase.sv",
                                                     127);
        __VdynTrigger_h14c4c9ea__0 = never_true;
    }
    co_await vlSymsp->TOP.__VdynSched.resumption(nullptr,
                                                 "@([true] svunit_pkg::svunit_testcase.never_true)",
                                                 "/opt/svunit/svunit-3.37.0/svunit_base/svunit_testcase.sv",
                                                 127);
}

void Vtestrunner_svunit_pkg__03a__03asvunit_testcase::_ctor_var_reset(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testcase::_ctor_var_reset\n"); );
    // Body
    if (false && vlSymsp) {}  // Prevent unused
    __PVT__test_count = 0;
    __PVT__error_count = 0;
    __PVT__running = 0;
    }
