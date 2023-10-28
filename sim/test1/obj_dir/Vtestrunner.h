// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary model header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef VERILATED_VTESTRUNNER_H_
#define VERILATED_VTESTRUNNER_H_  // guard

#include "verilated.h"

class Vtestrunner__Syms;
class Vtestrunner___024root;
class Vtestrunner_adder_unit_test;
class Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x560a83c57040;
class Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x560a83c57040__Vclpkg;
class Vtestrunner_junit_xml;
class Vtestrunner_junit_xml__03a__03aTestCase__Vclpkg;
class Vtestrunner_junit_xml__03a__03aTestSuite__Vclpkg;
class Vtestrunner_junit_xml__03a__03aXmlElement__Vclpkg;
class Vtestrunner_svunit_pkg;
class Vtestrunner_svunit_pkg__03a__03afilter;
class Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg;
class Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg;
class Vtestrunner_svunit_pkg__03a__03astring_utils__Vclpkg;
class Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg;
class Vtestrunner_svunit_pkg__03a__03asvunit_testcase;
class Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg;
class Vtestrunner_svunit_pkg__03a__03asvunit_testrunner;
class Vtestrunner_svunit_pkg__03a__03asvunit_testrunner__Vclpkg;
class Vtestrunner_svunit_pkg__03a__03asvunit_testsuite;
class Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg;


// This class is the main interface to the Verilated model
class alignas(VL_CACHE_LINE_BYTES) Vtestrunner VL_NOT_FINAL : public VerilatedModel {
  private:
    // Symbol table holding complete model state (owned by this class)
    Vtestrunner__Syms* const vlSymsp;

  public:

    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.

    // CELLS
    // Public to allow access to /* verilator public */ items.
    // Otherwise the application code can consider these internals.
    Vtestrunner_junit_xml* const __PVT__junit_xml;
    Vtestrunner_svunit_pkg* const __PVT__svunit_pkg;
    Vtestrunner_adder_unit_test* const __PVT__testrunner__DOT_____05Fts__DOT__adder_ut;
    Vtestrunner_junit_xml__03a__03aXmlElement__Vclpkg* const junit_xml__03a__03aXmlElement__Vclpkg;
    Vtestrunner_junit_xml__03a__03aTestCase__Vclpkg* const junit_xml__03a__03aTestCase__Vclpkg;
    Vtestrunner_junit_xml__03a__03aTestSuite__Vclpkg* const junit_xml__03a__03aTestSuite__Vclpkg;
    Vtestrunner_adder_unit_test__03a__03a__VDynScope__test0__0x560a83c57040__Vclpkg* const adder_unit_test__03a__03a__VDynScope__test0__0x560a83c57040__Vclpkg;
    Vtestrunner_svunit_pkg__03a__03astring_utils__Vclpkg* const svunit_pkg__03a__03astring_utils__Vclpkg;
    Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg* const svunit_pkg__03a__03asvunit_base__Vclpkg;
    Vtestrunner_svunit_pkg__03a__03asvunit_testcase__Vclpkg* const svunit_pkg__03a__03asvunit_testcase__Vclpkg;
    Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg* const svunit_pkg__03a__03asvunit_testsuite__Vclpkg;
    Vtestrunner_svunit_pkg__03a__03asvunit_testrunner__Vclpkg* const svunit_pkg__03a__03asvunit_testrunner__Vclpkg;
    Vtestrunner_svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg* const svunit_pkg__03a__03afilter_for_single_pattern__Vclpkg;
    Vtestrunner_svunit_pkg__03a__03afilter__Vclpkg* const svunit_pkg__03a__03afilter__Vclpkg;

    // Root instance pointer to allow access to model internals,
    // including inlined /* verilator public_flat_* */ items.
    Vtestrunner___024root* const rootp;

    // CONSTRUCTORS
    /// Construct the model; called by application code
    /// If contextp is null, then the model will use the default global context
    /// If name is "", then makes a wrapper with a
    /// single model invisible with respect to DPI scope names.
    explicit Vtestrunner(VerilatedContext* contextp, const char* name = "TOP");
    explicit Vtestrunner(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    virtual ~Vtestrunner();
  private:
    VL_UNCOPYABLE(Vtestrunner);  ///< Copying not allowed

  public:
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval() { eval_step(); }
    /// Evaluate when calling multiple units/models per time step.
    void eval_step();
    /// Evaluate at end of a timestep for tracing, when using eval_step().
    /// Application must call after all eval() and before time changes.
    void eval_end_step() {}
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    /// Are there scheduled events to handle?
    bool eventsPending();
    /// Returns time at next time slot. Aborts if !eventsPending()
    uint64_t nextTimeSlot();
    /// Retrieve name of this model instance (as passed to constructor).
    const char* name() const;

    // Abstract methods from VerilatedModel
    const char* hierName() const override final;
    const char* modelName() const override final;
    unsigned threads() const override final;
    /// Prepare for cloning the model at the process level (e.g. fork in Linux)
    /// Release necessary resources. Called before cloning.
    void prepareClone() const;
    /// Re-init after cloning the model at the process level (e.g. fork in Linux)
    /// Re-allocate necessary resources. Called after cloning.
    void atClone() const;
};

#endif  // guard
