// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtestrunner.h for the primary calling header

#include "verilated.h"

#include "Vtestrunner__Syms.h"
#include "Vtestrunner__Syms.h"
#include "Vtestrunner_svunit_pkg.h"

VL_ATTR_COLD void Vtestrunner_svunit_pkg___eval_static__TOP__svunit_pkg(Vtestrunner_svunit_pkg* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtestrunner__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+            Vtestrunner_svunit_pkg___eval_static__TOP__svunit_pkg\n"); );
    // Init
    VlClassRef<Vtestrunner_svunit_pkg__03a__03afilter> __Vfunc_get__0__Vfuncout;
    // Body
    vlSymsp->TOP__svunit_pkg__03a__03afilter__Vclpkg.__VnoInFunc_get(vlSymsp, __Vfunc_get__0__Vfuncout);
    vlSelf->_filter = __Vfunc_get__0__Vfuncout;
}
