// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtestrunner.h for the primary calling header

#ifndef VERILATED_VTESTRUNNER_JUNIT_XML__03A__03AXMLELEMENT__VCLPKG_H_
#define VERILATED_VTESTRUNNER_JUNIT_XML__03A__03AXMLELEMENT__VCLPKG_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
class Vtestrunner_junit_xml__03a__03aXmlElement;


class Vtestrunner__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtestrunner_junit_xml__03a__03aXmlElement__Vclpkg final : public VerilatedModule {
  public:

    // INTERNAL VARIABLES
    Vtestrunner__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtestrunner_junit_xml__03a__03aXmlElement__Vclpkg(Vtestrunner__Syms* symsp, const char* v__name);
    ~Vtestrunner_junit_xml__03a__03aXmlElement__Vclpkg();
    VL_UNCOPYABLE(Vtestrunner_junit_xml__03a__03aXmlElement__Vclpkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


class Vtestrunner__Syms;

class Vtestrunner_junit_xml__03a__03aXmlElement : public VlClass {
  public:

    // DESIGN SPECIFIC STATE
    VlAssocArray<std::string, std::string> __PVT__attributes;
    std::string __PVT__tag;
    VlQueue<VlClassRef<Vtestrunner_junit_xml__03a__03aXmlElement>> __PVT__children;
    void __VnoInFunc_add_child(Vtestrunner__Syms* __restrict vlSymsp, VlClassRef<Vtestrunner_junit_xml__03a__03aXmlElement> child);
    void __VnoInFunc_as_string(Vtestrunner__Syms* __restrict vlSymsp, std::string &as_string__Vfuncrtn);
    void __VnoInFunc_as_string_with_indent(Vtestrunner__Syms* __restrict vlSymsp, std::string indent, std::string &as_string_with_indent__Vfuncrtn);
    void __VnoInFunc_get_start_tag_contents(Vtestrunner__Syms* __restrict vlSymsp, std::string &get_start_tag_contents__Vfuncrtn);
    void __VnoInFunc_set_attribute(Vtestrunner__Syms* __restrict vlSymsp, std::string name, std::string value);
  private:
    void _ctor_var_reset(Vtestrunner__Syms* __restrict vlSymsp);
  public:
    Vtestrunner_junit_xml__03a__03aXmlElement(Vtestrunner__Syms* __restrict vlSymsp, std::string tag);
    std::string to_string() const;
    std::string to_string_middle() const;
    ~Vtestrunner_junit_xml__03a__03aXmlElement();
};

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_junit_xml__03a__03aXmlElement>& obj);

#endif  // guard
