// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_junit_xml__03a__03aXmlElement__Vclpkg.h"

void Vtestrunner_junit_xml__03a__03aXmlElement::__VnoInFunc_set_attribute(Vtestrunner__Syms* __restrict vlSymsp, std::string name, std::string value) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aXmlElement::__VnoInFunc_set_attribute\n"); );
    // Body
    this->__PVT__attributes.at(name) = value;
}

void Vtestrunner_junit_xml__03a__03aXmlElement::__VnoInFunc_add_child(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_junit_xml__03a__03aXmlElement> child) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aXmlElement::__VnoInFunc_add_child\n"); );
    // Body
    this->__PVT__children.push_back(child);
}

void Vtestrunner_junit_xml__03a__03aXmlElement::__VnoInFunc_as_string(Vtestrunner__Syms* __restrict vlSymsp, std::string &as_string__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aXmlElement::__VnoInFunc_as_string\n"); );
    // Init
    std::string __Vfunc_as_string_with_indent__0__Vfuncout;
    // Body
    this->__VnoInFunc_as_string_with_indent(vlSymsp,
                                            std::string{""}, __Vfunc_as_string_with_indent__0__Vfuncout);
    as_string__Vfuncrtn = __Vfunc_as_string_with_indent__0__Vfuncout;
}

void Vtestrunner_junit_xml__03a__03aXmlElement::__VnoInFunc_as_string_with_indent(Vtestrunner__Syms* __restrict vlSymsp, std::string indent, std::string &as_string_with_indent__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aXmlElement::__VnoInFunc_as_string_with_indent\n"); );
    // Init
    std::string __Vfunc_get_start_tag_contents__1__Vfuncout;
    std::string __Vtask_as_string_with_indent__2__Vfuncout;
    std::string __Vtemp_1;
    std::string __Vtemp_2;
    // Body
    IData/*31:0*/ unnamedblk2_1__DOT__i;
    unnamedblk2_1__DOT__i = 0;
    std::string unnamedblk2_1__DOT__unnamedblk1__DOT__child_indent;
    std::string result;
    __Vtemp_1 = ([&]() {
            this->__VnoInFunc_get_start_tag_contents(vlSymsp, __Vfunc_get_start_tag_contents__1__Vfuncout);
        }(), __Vfunc_get_start_tag_contents__1__Vfuncout);
    result = VL_SFORMATF_NX("%@<%@>",-1,&(indent),-1,
                            &(__Vtemp_1)) ;
    unnamedblk2_1__DOT__i = 0U;
    while (VL_LTS_III(32, unnamedblk2_1__DOT__i, this->__PVT__children.size())) {
        unnamedblk2_1__DOT__unnamedblk1__DOT__child_indent
            = VL_CONCATN_NNN(indent, std::string{"  "});
        __Vtemp_2 = VL_CONCATN_NNN(VL_CONCATN_NNN(result,
                                                  std::string{"\n"}),
                                   ([&]() {
                    VL_NULL_CHECK(this->__PVT__children.at(unnamedblk2_1__DOT__i), "/opt/svunit/svunit-3.37.0/svunit_base/junit-xml/XmlElement.svh", 53)
                                    ->__VnoInFunc_as_string_with_indent(vlSymsp, unnamedblk2_1__DOT__unnamedblk1__DOT__child_indent, __Vtask_as_string_with_indent__2__Vfuncout);
                }(), __Vtask_as_string_with_indent__2__Vfuncout));
        result = __Vtemp_2;
        unnamedblk2_1__DOT__i = ((IData)(1U) + unnamedblk2_1__DOT__i);
    }
    result = VL_CONCATN_NNN(VL_CONCATN_NNN(result,
                                           std::string{"\n"}), VL_SFORMATF_NX("%@</%@>",
                                                                              -1,
                                                                              &(indent),
                                                                              -1,
                                                                              &(this->__PVT__tag)) );
    as_string_with_indent__Vfuncrtn = result;
}

void Vtestrunner_junit_xml__03a__03aXmlElement::__VnoInFunc_get_start_tag_contents(Vtestrunner__Syms* __restrict vlSymsp, std::string &get_start_tag_contents__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aXmlElement::__VnoInFunc_get_start_tag_contents\n"); );
    // Init
    std::string __Vtemp_2;
    // Body
    std::string unnamedblk2_2__DOT__i;
    CData/*0:0*/ unnamedblk2_2__DOT__i__Vfirst;
    unnamedblk2_2__DOT__i__Vfirst = 0;
    std::string result;
    result = this->__PVT__tag;
    if ((0U != this->__PVT__attributes.first(unnamedblk2_2__DOT__i))) {
        unnamedblk2_2__DOT__i__Vfirst = 1U;
        while (((IData)(unnamedblk2_2__DOT__i__Vfirst)
                || (0U != this->__PVT__attributes.next(unnamedblk2_2__DOT__i)))) {
            unnamedblk2_2__DOT__i__Vfirst = 0U;
            __Vtemp_2 = this->__PVT__attributes.at(unnamedblk2_2__DOT__i);
            result = VL_CONCATN_NNN(VL_CONCATN_NNN(result,
                                                   std::string{" "}), VL_SFORMATF_NX("%@=\"%@\"",
                                                                                -1,
                                                                                &(unnamedblk2_2__DOT__i),
                                                                                -1,
                                                                                &(__Vtemp_2)) );
        }
    }
    get_start_tag_contents__Vfuncrtn = result;
}

Vtestrunner_junit_xml__03a__03aXmlElement::~Vtestrunner_junit_xml__03a__03aXmlElement() {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aXmlElement::~\n"); );
}

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_junit_xml__03a__03aXmlElement>& obj) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aXmlElement::VL_TO_STRING\n"); );
    // Body
    return (obj ? obj->to_string() : "null");
}

std::string Vtestrunner_junit_xml__03a__03aXmlElement::to_string() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aXmlElement::to_string\n"); );
    // Body
    return (std::string{"'{"} + to_string_middle() + "}");
}

std::string Vtestrunner_junit_xml__03a__03aXmlElement::to_string_middle() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Vtestrunner_junit_xml__03a__03aXmlElement::to_string_middle\n"); );
    // Body
    std::string out;
    out += "tag:" + VL_TO_STRING(__PVT__tag);
    out += ", attributes:" + VL_TO_STRING(__PVT__attributes);
    out += ", children:" + VL_TO_STRING(__PVT__children);
    return out;
}
