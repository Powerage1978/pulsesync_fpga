// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_junit_xml__03a__03aTestSuite__Vclpkg.h"
#include "Vtestrunner_junit_xml__03a__03aXmlElement__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testrunner__Vclpkg.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_testsuite__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03asvunit_testrunner::__VnoInFunc_write_xml(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_testrunner::__VnoInFunc_write_xml\n"); );
    // Init
    VlClassRef<Vtestrunner_junit_xml__03a__03aTestSuite> __Vtask_as_junit_test_suite__1__Vfuncout;
    std::string __Vfunc_to_xml_report_string__2__Vfuncout;
    VlQueue<VlClassRef<Vtestrunner_junit_xml__03a__03aTestSuite>> __Vfunc_to_xml_report_string__2__test_suites;
    IData/*31:0*/ __Vfunc_to_xml_report_string__2__unnamedblk2_1__DOT__i;
    __Vfunc_to_xml_report_string__2__unnamedblk2_1__DOT__i = 0;
    VlClassRef<Vtestrunner_junit_xml__03a__03aXmlElement> __Vfunc_to_xml_report_string__2__testsuites;
    VlClassRef<Vtestrunner_junit_xml__03a__03aXmlElement> __Vtask_as_xml_element__5__Vfuncout;
    std::string __Vtask_as_string__6__Vfuncout;
    VlWide<3>/*95:0*/ __Vtemp_1;
    std::string __Vtemp_4;
    // Body
    IData/*31:0*/ unnamedblk2_2__DOT__i;
    unnamedblk2_2__DOT__i = 0;
    IData/*31:0*/ xml;
    xml = 0;
    __Vtemp_1[0U] = 0x2e786d6cU;
    __Vtemp_1[1U] = 0x65737473U;
    __Vtemp_1[2U] = 0x74U;
    xml = VL_FOPEN_NN(VL_CVT_PACK_STR_NW(3, __Vtemp_1)
                      , std::string{"w"});
    ;
    VlQueue<VlClassRef<Vtestrunner_junit_xml__03a__03aTestSuite>> test_suites;
    unnamedblk2_2__DOT__i = 0U;
    while (VL_LTS_III(32, unnamedblk2_2__DOT__i, this->__PVT__list_of_suites.size())) {
        test_suites.push_back(([&]() {
                    VL_NULL_CHECK(this->__PVT__list_of_suites.at(unnamedblk2_2__DOT__i), "/opt/svunit/svunit-3.37.0/svunit_base/svunit_testrunner.sv", 54)
                               ->__VnoInFunc_as_junit_test_suite(vlSymsp, __Vtask_as_junit_test_suite__1__Vfuncout);
                }(), __Vtask_as_junit_test_suite__1__Vfuncout));
        unnamedblk2_2__DOT__i = ((IData)(1U) + unnamedblk2_2__DOT__i);
    }
    __Vtemp_4 = ([&]() {
            __Vfunc_to_xml_report_string__2__test_suites
                = test_suites;
            __Vfunc_to_xml_report_string__2__testsuites
                = VL_NEW(Vtestrunner_junit_xml__03a__03aXmlElement, vlSymsp,
                         std::string{"testsuites"});
            __Vfunc_to_xml_report_string__2__unnamedblk2_1__DOT__i = 0U;
            while (VL_LTS_III(32, __Vfunc_to_xml_report_string__2__unnamedblk2_1__DOT__i, __Vfunc_to_xml_report_string__2__test_suites.size())) {
                VL_NULL_CHECK(__Vfunc_to_xml_report_string__2__testsuites, "/opt/svunit/svunit-3.37.0/svunit_base/junit-xml/junit_xml.sv", 29)
                 ->__VnoInFunc_add_child(vlSymsp, ([&]() {
                            VL_NULL_CHECK(__Vfunc_to_xml_report_string__2__test_suites.at(__Vfunc_to_xml_report_string__2__unnamedblk2_1__DOT__i), "/opt/svunit/svunit-3.37.0/svunit_base/junit-xml/junit_xml.sv", 29)
                                                   ->__VnoInFunc_as_xml_element(vlSymsp, __Vtask_as_xml_element__5__Vfuncout);
                        }(), __Vtask_as_xml_element__5__Vfuncout));
                __Vfunc_to_xml_report_string__2__unnamedblk2_1__DOT__i
                    = ((IData)(1U) + __Vfunc_to_xml_report_string__2__unnamedblk2_1__DOT__i);
            }
            VL_NULL_CHECK(__Vfunc_to_xml_report_string__2__testsuites, "/opt/svunit/svunit-3.37.0/svunit_base/junit-xml/junit_xml.sv", 30)
                 ->__VnoInFunc_as_string(vlSymsp, __Vtask_as_string__6__Vfuncout);
            __Vfunc_to_xml_report_string__2__Vfuncout
                = __Vtask_as_string__6__Vfuncout;
        }(), __Vfunc_to_xml_report_string__2__Vfuncout);
    VL_FWRITEF(xml,"%@\n",-1,&(__Vtemp_4));
}
