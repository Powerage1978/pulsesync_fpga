// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vtestrunner.h"
#include "Vtestrunner__Syms.h"

//============================================================
// Constructors

Vtestrunner::Vtestrunner(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vtestrunner__Syms(contextp(), _vcname__, this)}
    , __PVT__junit_xml{vlSymsp->TOP.__PVT__junit_xml}
    , __PVT__svunit_pkg{vlSymsp->TOP.__PVT__svunit_pkg}
    , __PVT__testrunner__DOT_____05Fts__DOT__adder_ut{vlSymsp->TOP.__PVT__testrunner__DOT_____05Fts__DOT__adder_ut}
    , junit_xml__03a__03aXmlElement__Vclpkg{vlSymsp->TOP.junit_xml__03a__03aXmlElement__Vclpkg}
    , junit_xml__03a__03aTestCase__Vclpkg{vlSymsp->TOP.junit_xml__03a__03aTestCase__Vclpkg}
    , junit_xml__03a__03aTestSuite__Vclpkg{vlSymsp->TOP.junit_xml__03a__03aTestSuite__Vclpkg}
    , adder_unit_test__03a__03a__VDynScope__test0__0x560a83c57040__Vclpkg{vlSymsp->TOP.adder_unit_test__03a__03a__VDynScope__test0__0x560a83c57040__Vclpkg}
    , svunit_pkg__03a__03astring_utils__Vclpkg{vlSymsp->TOP.svunit_pkg__03a__03astring_utils__Vclpkg}
    , svunit_pkg__03a__03asvunit_base__Vclpkg{vlSymsp->TOP.svunit_pkg__03a__03asvunit_base__Vclpkg}
    , svunit_pkg__03a__03asvunit_testcase__Vclpkg{vlSymsp->TOP.svunit_pkg__03a__03asvunit_testcase__Vclpkg}
    , svunit_pkg__03a__03asvunit_testsuite__Vclpkg{vlSymsp->TOP.svunit_pkg__03a__03asvunit_testsuite__Vclpkg}
    , svunit_pkg__03a__03asvunit_testrunner__Vclpkg{vlSymsp->TOP.svunit_pkg__03a__03asvunit_testrunner__Vclpkg}
    , svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg{vlSymsp->TOP.svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg}
    , svunit_pkg__03a__03afilter__Vclpkg{vlSymsp->TOP.svunit_pkg__03a__03afilter__Vclpkg}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vtestrunner::Vtestrunner(const char* _vcname__)
    : Vtestrunner(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vtestrunner::~Vtestrunner() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vtestrunner___024root___eval_debug_assertions(Vtestrunner___024root* vlSelf);
#endif  // VL_DEBUG
void Vtestrunner___024root___eval_static(Vtestrunner___024root* vlSelf);
void Vtestrunner___024root___eval_initial(Vtestrunner___024root* vlSelf);
void Vtestrunner___024root___eval_settle(Vtestrunner___024root* vlSelf);
void Vtestrunner___024root___eval(Vtestrunner___024root* vlSelf);

void Vtestrunner::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vtestrunner::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vtestrunner___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vtestrunner___024root___eval_static(&(vlSymsp->TOP));
        Vtestrunner___024root___eval_initial(&(vlSymsp->TOP));
        Vtestrunner___024root___eval_settle(&(vlSymsp->TOP));
    }
    // MTask 0 start
    VL_DEBUG_IF(VL_DBG_MSGF("MTask0 starting\n"););
    Verilated::mtaskId(0);
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vtestrunner___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfThreadMTask(vlSymsp->__Vm_evalMsgQp);
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vtestrunner::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t Vtestrunner::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Vtestrunner::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vtestrunner___024root___eval_final(Vtestrunner___024root* vlSelf);

VL_ATTR_COLD void Vtestrunner::final() {
    Vtestrunner___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vtestrunner::hierName() const { return vlSymsp->name(); }
const char* Vtestrunner::modelName() const { return "Vtestrunner"; }
unsigned Vtestrunner::threads() const { return 1; }
void Vtestrunner::prepareClone() const { contextp()->prepareClone(); }
void Vtestrunner::atClone() const {
    contextp()->threadPoolpOnClone();
}
