// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03asvunit_base__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03asvunit_base::__VnoInFunc_get_name(Vtestrunner__Syms* __restrict vlSymsp, std::string &get_name__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_base::__VnoInFunc_get_name\n"); );
    // Body
    get_name__Vfuncrtn = this->__PVT__name;
}

void Vtestrunner_svunit_pkg__03a__03asvunit_base::__VnoInFunc_report(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_base::__VnoInFunc_report\n"); );
    // Init
    std::string __Vtemp_1;
    // Body
    std::string str;
    str = VL_CVT_PACK_STR_NQ(((IData)(this->__PVT__success)
                               ? 0x504153534544ULL : 0x4641494c4544ULL));
    __Vtemp_1 = VL_SFORMATF_NX("%0@::%0@",-1,&(this->__PVT__name),
                               -1,&(str)) ;
    VL_WRITEF("INFO:  [%0t][%0@]: %@\n",64,VL_TIME_UNITED_Q(1),
              -12,-1,&(this->__PVT__name),-1,&(__Vtemp_1));
}

void Vtestrunner_svunit_pkg__03a__03asvunit_base::__VnoInFunc_get_results(Vtestrunner__Syms* __restrict vlSymsp, CData/*0:0*/ &get_results__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_base::__VnoInFunc_get_results\n"); );
    // Body
    get_results__Vfuncrtn = this->__PVT__success;
}

Vtestrunner_svunit_pkg__03a__03asvunit_base::~Vtestrunner_svunit_pkg__03a__03asvunit_base() {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_base::~\n"); );
}

std::string VL_TO_STRING(const VlClassRef<Vtestrunner_svunit_pkg__03a__03asvunit_base>& obj) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_base::VL_TO_STRING\n"); );
    // Body
    return (obj ? obj->to_string() : "null");
}

std::string Vtestrunner_svunit_pkg__03a__03asvunit_base::to_string() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_base::to_string\n"); );
    // Body
    return (std::string{"'{"} + to_string_middle() + "}");
}

std::string Vtestrunner_svunit_pkg__03a__03asvunit_base::to_string_middle() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03asvunit_base::to_string_middle\n"); );
    // Body
    std::string out;
    out += "name:" + VL_TO_STRING(__PVT__name);
    out += ", success:" + VL_TO_STRING(__PVT__success);
    return out;
}
