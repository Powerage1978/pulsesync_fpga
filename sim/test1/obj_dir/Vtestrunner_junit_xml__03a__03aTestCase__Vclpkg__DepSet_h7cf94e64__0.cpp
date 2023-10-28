// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_junit_xml__03a__03aTestCase__Vclpkg.h"
#include "Vtestrunner_junit_xml__03a__03aXmlElement__Vclpkg.h"

void Vtestrunner_junit_xml__03a__03aTestCase::__VnoInFunc_add_failure(Vtestrunner__Syms* __restrict vlSymsp, std::string message) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aTestCase::__VnoInFunc_add_failure\n"); );
    // Body
    this->__PVT__failure = VL_NEW(Vtestrunner_junit_xml__03a__03aXmlElement, vlSymsp,
                                  std::string{"failure"});
    VL_NULL_CHECK(this->__PVT__failure, "/opt/svunit/svunit-3.37.0/svunit_base/junit-xml/TestCase.svh", 46)->__VnoInFunc_set_attribute(vlSymsp,
                                                                                std::string{"message"}, message);
    VL_NULL_CHECK(this->__PVT__failure, "/opt/svunit/svunit-3.37.0/svunit_base/junit-xml/TestCase.svh", 47)->__VnoInFunc_set_attribute(vlSymsp,
                                                                                std::string{"type"},
                                                                                std::string{"failure"});
}

void Vtestrunner_junit_xml__03a__03aTestCase::__VnoInFunc_as_xml_element(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_junit_xml__03a__03aXmlElement> &as_xml_element__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aTestCase::__VnoInFunc_as_xml_element\n"); );
    // Body
    VlClassRef<Vtestrunner_junit_xml__03a__03aXmlElement> result;
    result = VL_NEW(Vtestrunner_junit_xml__03a__03aXmlElement, vlSymsp,
                    std::string{"testcase"});
    VL_NULL_CHECK(result, "/opt/svunit/svunit-3.37.0/svunit_base/junit-xml/TestCase.svh", 53)->__VnoInFunc_set_attribute(vlSymsp,
                                                                                std::string{"name"}, this->__PVT__name);
    VL_NULL_CHECK(result, "/opt/svunit/svunit-3.37.0/svunit_base/junit-xml/TestCase.svh", 54)->__VnoInFunc_set_attribute(vlSymsp,
                                                                                std::string{"classname"}, this->__PVT__class_name);
    if ((VlNull{} != this->__PVT__failure)) {
        VL_NULL_CHECK(result, "/opt/svunit/svunit-3.37.0/svunit_base/junit-xml/TestCase.svh", 56)->__VnoInFunc_add_child(vlSymsp, this->__PVT__failure);
    }
    as_xml_element__Vfuncrtn = result;
}
