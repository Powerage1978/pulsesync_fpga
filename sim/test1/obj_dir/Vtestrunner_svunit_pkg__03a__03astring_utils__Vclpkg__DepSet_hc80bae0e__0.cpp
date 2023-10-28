// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg__03a__03astring_utils__Vclpkg.h"

void Vtestrunner_svunit_pkg__03a__03astring_utils__Vclpkg::__VnoInFunc_split_by_char(Vtestrunner__Syms* __restrict vlSymsp, std::string c, std::string s, VlQueue<std::string> &split_by_char__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+  Vtestrunner_svunit_pkg__03a__03astring_utils__Vclpkg::__VnoInFunc_split_by_char\n"); );
    // Body
    IData/*31:0*/ unnamedblk1__DOT__i;
    unnamedblk1__DOT__i = 0;
    VlQueue<std::string> parts;
    IData/*31:0*/ last_char_position;
    last_char_position = 0;
    last_char_position = 0xffffffffU;
    if (VL_UNLIKELY((1U != VL_LEN_IN(c)))) {
        VL_WRITEF("[%0t] %%Fatal: svunit_string_utils.svh:11: Assertion failed in %Nsvunit_pkg.string_utils.split_by_char: Internal error: expected a single character string\n",
                  64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("/opt/svunit/svunit-3.37.0/svunit_base/svunit_string_utils.svh", 11, "");
    }
    unnamedblk1__DOT__i = 0U;
    while (VL_LTS_III(32, unnamedblk1__DOT__i, VL_LEN_IN(s))) {
        if ((unnamedblk1__DOT__i == (VL_LEN_IN(s) - (IData)(1U)))) {
            parts.push_back(VL_SUBSTR_N(s,((IData)(1U)
                                           + last_char_position),unnamedblk1__DOT__i));
        }
        if ((VL_CVT_PACK_STR_NI(VL_GETC_N(s,unnamedblk1__DOT__i))
             == c)) {
            parts.push_back(VL_SUBSTR_N(s,((IData)(1U)
                                           + last_char_position),
                                        (unnamedblk1__DOT__i
                                         - (IData)(1U))));
            last_char_position = unnamedblk1__DOT__i;
        }
        unnamedblk1__DOT__i = ((IData)(1U) + unnamedblk1__DOT__i);
    }
    split_by_char__Vfuncrtn = parts;
}

Vtestrunner_svunit_pkg__03a__03astring_utils::Vtestrunner_svunit_pkg__03a__03astring_utils(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03astring_utils::new\n"); );
    // Init
    _ctor_var_reset(vlSymsp);
}

void Vtestrunner_svunit_pkg__03a__03astring_utils::_ctor_var_reset(Vtestrunner__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+              Vtestrunner_svunit_pkg__03a__03astring_utils::_ctor_var_reset\n"); );
    // Body
    if (false && vlSymsp) {}  // Prevent unused
}
