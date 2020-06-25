//===--- BuiltinsPPC.def - PowerPC Builtin function database ----*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the PowerPC-specific builtin function database.  Users of
// this file must define the BUILTIN macro to make use of this information.
//
//===----------------------------------------------------------------------===//

// FIXME: this needs to be the full list supported by GCC.  Right now, I'm just
// adding stuff on demand.

// Type and attribute strings are as defined in Builtins.td.

include "BuiltinTableGenDefs.inc"

let TargetArch = "PPC" in {
def __builtin_ppc_get_timebase: Builtin<"ULLi", "n">;

// This is just a placeholder, the types and attributes are wrong.
def __builtin_altivec_vaddcuw: Builtin<"V4UiV4UiV4Ui", "">;

def __builtin_altivec_vaddsbs: Builtin<"V16ScV16ScV16Sc", "">;
def __builtin_altivec_vaddubs: Builtin<"V16UcV16UcV16Uc", "">;
def __builtin_altivec_vaddshs: Builtin<"V8SsV8SsV8Ss", "">;
def __builtin_altivec_vadduhs: Builtin<"V8UsV8UsV8Us", "">;
def __builtin_altivec_vaddsws: Builtin<"V4SiV4SiV4Si", "">;
def __builtin_altivec_vadduws: Builtin<"V4UiV4UiV4Ui", "">;
def __builtin_altivec_vaddeuqm: Builtin<"V1ULLLiV1ULLLiV1ULLLiV1ULLLi", "">;
def __builtin_altivec_vaddcuq: Builtin<"V1ULLLiV1ULLLiV1ULLLi", "">;
def __builtin_altivec_vaddecuq: Builtin<"V1ULLLiV1ULLLiV1ULLLiV1ULLLi", "">;

def __builtin_altivec_vsubsbs: Builtin<"V16ScV16ScV16Sc", "">;
def __builtin_altivec_vsububs: Builtin<"V16UcV16UcV16Uc", "">;
def __builtin_altivec_vsubshs: Builtin<"V8SsV8SsV8Ss", "">;
def __builtin_altivec_vsubuhs: Builtin<"V8UsV8UsV8Us", "">;
def __builtin_altivec_vsubsws: Builtin<"V4SiV4SiV4Si", "">;
def __builtin_altivec_vsubuws: Builtin<"V4UiV4UiV4Ui", "">;
def __builtin_altivec_vsubeuqm: Builtin<"V1ULLLiV1ULLLiV1ULLLiV1ULLLi", "">;
def __builtin_altivec_vsubcuq: Builtin<"V1ULLLiV1ULLLiV1ULLLi", "">;
def __builtin_altivec_vsubecuq: Builtin<"V1ULLLiV1ULLLiV1ULLLiV1ULLLi", "">;

def __builtin_altivec_vavgsb: Builtin<"V16ScV16ScV16Sc", "">;
def __builtin_altivec_vavgub: Builtin<"V16UcV16UcV16Uc", "">;
def __builtin_altivec_vavgsh: Builtin<"V8SsV8SsV8Ss", "">;
def __builtin_altivec_vavguh: Builtin<"V8UsV8UsV8Us", "">;
def __builtin_altivec_vavgsw: Builtin<"V4SiV4SiV4Si", "">;
def __builtin_altivec_vavguw: Builtin<"V4UiV4UiV4Ui", "">;

def __builtin_altivec_vrfip: Builtin<"V4fV4f", "">;

def __builtin_altivec_vcfsx: Builtin<"V4fV4SiIi", "">;
def __builtin_altivec_vcfux: Builtin<"V4fV4UiIi", "">;
def __builtin_altivec_vctsxs: Builtin<"V4SiV4fIi", "">;
def __builtin_altivec_vctuxs: Builtin<"V4UiV4fIi", "">;

def __builtin_altivec_dss: Builtin<"vUIi", "">;
def __builtin_altivec_dssall: Builtin<"v", "">;
def __builtin_altivec_dst: Builtin<"vvC*iUIi", "">;
def __builtin_altivec_dstt: Builtin<"vvC*iUIi", "">;
def __builtin_altivec_dstst: Builtin<"vvC*iUIi", "">;
def __builtin_altivec_dststt: Builtin<"vvC*iUIi", "">;

def __builtin_altivec_vexptefp: Builtin<"V4fV4f", "">;

def __builtin_altivec_vrfim: Builtin<"V4fV4f", "">;

def __builtin_altivec_lvx: Builtin<"V4iivC*", "">;
def __builtin_altivec_lvxl: Builtin<"V4iivC*", "">;
def __builtin_altivec_lvebx: Builtin<"V16civC*", "">;
def __builtin_altivec_lvehx: Builtin<"V8sivC*", "">;
def __builtin_altivec_lvewx: Builtin<"V4iivC*", "">;

def __builtin_altivec_vlogefp: Builtin<"V4fV4f", "">;

def __builtin_altivec_lvsl: Builtin<"V16cUcvC*", "">;
def __builtin_altivec_lvsr: Builtin<"V16cUcvC*", "">;

def __builtin_altivec_vmaddfp: Builtin<"V4fV4fV4fV4f", "">;
def __builtin_altivec_vmhaddshs: Builtin<"V8sV8sV8sV8s", "">;
def __builtin_altivec_vmhraddshs: Builtin<"V8sV8sV8sV8s", "">;

def __builtin_altivec_vmsumubm: Builtin<"V4UiV16UcV16UcV4Ui", "">;
def __builtin_altivec_vmsummbm: Builtin<"V4SiV16ScV16UcV4Si", "">;
def __builtin_altivec_vmsumuhm: Builtin<"V4UiV8UsV8UsV4Ui", "">;
def __builtin_altivec_vmsumshm: Builtin<"V4SiV8SsV8SsV4Si", "">;
def __builtin_altivec_vmsumuhs: Builtin<"V4UiV8UsV8UsV4Ui", "">;
def __builtin_altivec_vmsumshs: Builtin<"V4SiV8SsV8SsV4Si", "">;

def __builtin_altivec_vmuleub: Builtin<"V8UsV16UcV16Uc", "">;
def __builtin_altivec_vmulesb: Builtin<"V8SsV16ScV16Sc", "">;
def __builtin_altivec_vmuleuh: Builtin<"V4UiV8UsV8Us", "">;
def __builtin_altivec_vmulesh: Builtin<"V4SiV8SsV8Ss", "">;
def __builtin_altivec_vmuleuw: Builtin<"V2ULLiV4UiV4Ui", "">;
def __builtin_altivec_vmulesw: Builtin<"V2SLLiV4SiV4Si", "">;
def __builtin_altivec_vmuloub: Builtin<"V8UsV16UcV16Uc", "">;
def __builtin_altivec_vmulosb: Builtin<"V8SsV16ScV16Sc", "">;
def __builtin_altivec_vmulouh: Builtin<"V4UiV8UsV8Us", "">;
def __builtin_altivec_vmulosh: Builtin<"V4SiV8SsV8Ss", "">;
def __builtin_altivec_vmulouw: Builtin<"V2ULLiV4UiV4Ui", "">;
def __builtin_altivec_vmulosw: Builtin<"V2SLLiV4SiV4Si", "">;

def __builtin_altivec_vnmsubfp: Builtin<"V4fV4fV4fV4f", "">;

def __builtin_altivec_vpkpx: Builtin<"V8sV4UiV4Ui", "">;
def __builtin_altivec_vpkuhus: Builtin<"V16UcV8UsV8Us", "">;
def __builtin_altivec_vpkshss: Builtin<"V16ScV8SsV8Ss", "">;
def __builtin_altivec_vpkuwus: Builtin<"V8UsV4UiV4Ui", "">;
def __builtin_altivec_vpkswss: Builtin<"V8SsV4SiV4Si", "">;
def __builtin_altivec_vpkshus: Builtin<"V16UcV8SsV8Ss", "">;
def __builtin_altivec_vpkswus: Builtin<"V8UsV4SiV4Si", "">;
def __builtin_altivec_vpksdss: Builtin<"V4SiV2SLLiV2SLLi", "">;
def __builtin_altivec_vpksdus: Builtin<"V4UiV2SLLiV2SLLi", "">;
def __builtin_altivec_vpkudus: Builtin<"V4UiV2ULLiV2ULLi", "">;
def __builtin_altivec_vpkudum: Builtin<"V4UiV2ULLiV2ULLi", "">;

def __builtin_altivec_vperm_4si: Builtin<"V4iV4iV4iV16Uc", "">;

def __builtin_altivec_stvx: Builtin<"vV4iiv*", "">;
def __builtin_altivec_stvxl: Builtin<"vV4iiv*", "">;
def __builtin_altivec_stvebx: Builtin<"vV16civ*", "">;
def __builtin_altivec_stvehx: Builtin<"vV8siv*", "">;
def __builtin_altivec_stvewx: Builtin<"vV4iiv*", "">;

def __builtin_altivec_vcmpbfp: Builtin<"V4iV4fV4f", "">;

def __builtin_altivec_vcmpgefp: Builtin<"V4iV4fV4f", "">;

def __builtin_altivec_vcmpequb: Builtin<"V16cV16cV16c", "">;
def __builtin_altivec_vcmpequh: Builtin<"V8sV8sV8s", "">;
def __builtin_altivec_vcmpequw: Builtin<"V4iV4iV4i", "">;
def __builtin_altivec_vcmpequd: Builtin<"V2LLiV2LLiV2LLi", "">;
def __builtin_altivec_vcmpeqfp: Builtin<"V4iV4fV4f", "">;

def __builtin_altivec_vcmpneb: Builtin<"V16cV16cV16c", "">;
def __builtin_altivec_vcmpneh: Builtin<"V8sV8sV8s", "">;
def __builtin_altivec_vcmpnew: Builtin<"V4iV4iV4i", "">;

def __builtin_altivec_vcmpnezb: Builtin<"V16cV16cV16c", "">;
def __builtin_altivec_vcmpnezh: Builtin<"V8sV8sV8s", "">;
def __builtin_altivec_vcmpnezw: Builtin<"V4iV4iV4i", "">;

def __builtin_altivec_vcmpgtsb: Builtin<"V16cV16ScV16Sc", "">;
def __builtin_altivec_vcmpgtub: Builtin<"V16cV16UcV16Uc", "">;
def __builtin_altivec_vcmpgtsh: Builtin<"V8sV8SsV8Ss", "">;
def __builtin_altivec_vcmpgtuh: Builtin<"V8sV8UsV8Us", "">;
def __builtin_altivec_vcmpgtsw: Builtin<"V4iV4SiV4Si", "">;
def __builtin_altivec_vcmpgtuw: Builtin<"V4iV4UiV4Ui", "">;
def __builtin_altivec_vcmpgtsd: Builtin<"V2LLiV2LLiV2LLi", "">;
def __builtin_altivec_vcmpgtud: Builtin<"V2LLiV2ULLiV2ULLi", "">;
def __builtin_altivec_vcmpgtfp: Builtin<"V4iV4fV4f", "">;

def __builtin_altivec_vmaxsb: Builtin<"V16ScV16ScV16Sc", "">;
def __builtin_altivec_vmaxub: Builtin<"V16UcV16UcV16Uc", "">;
def __builtin_altivec_vmaxsh: Builtin<"V8SsV8SsV8Ss", "">;
def __builtin_altivec_vmaxuh: Builtin<"V8UsV8UsV8Us", "">;
def __builtin_altivec_vmaxsw: Builtin<"V4SiV4SiV4Si", "">;
def __builtin_altivec_vmaxuw: Builtin<"V4UiV4UiV4Ui", "">;
def __builtin_altivec_vmaxsd: Builtin<"V2LLiV2LLiV2LLi", "">;
def __builtin_altivec_vmaxud: Builtin<"V2ULLiV2ULLiV2ULLi", "">;
def __builtin_altivec_vmaxfp: Builtin<"V4fV4fV4f", "">;

def __builtin_altivec_mfvscr: Builtin<"V8Us", "">;

def __builtin_altivec_vminsb: Builtin<"V16ScV16ScV16Sc", "">;
def __builtin_altivec_vminub: Builtin<"V16UcV16UcV16Uc", "">;
def __builtin_altivec_vminsh: Builtin<"V8SsV8SsV8Ss", "">;
def __builtin_altivec_vminuh: Builtin<"V8UsV8UsV8Us", "">;
def __builtin_altivec_vminsw: Builtin<"V4SiV4SiV4Si", "">;
def __builtin_altivec_vminuw: Builtin<"V4UiV4UiV4Ui", "">;
def __builtin_altivec_vminsd: Builtin<"V2LLiV2LLiV2LLi", "">;
def __builtin_altivec_vminud: Builtin<"V2ULLiV2ULLiV2ULLi", "">;
def __builtin_altivec_vminfp: Builtin<"V4fV4fV4f", "">;

def __builtin_altivec_mtvscr: Builtin<"vV4i", "">;

def __builtin_altivec_vrefp: Builtin<"V4fV4f", "">;

def __builtin_altivec_vrlb: Builtin<"V16cV16cV16Uc", "">;
def __builtin_altivec_vrlh: Builtin<"V8sV8sV8Us", "">;
def __builtin_altivec_vrlw: Builtin<"V4iV4iV4Ui", "">;
def __builtin_altivec_vrld: Builtin<"V2LLiV2LLiV2ULLi", "">;

def __builtin_altivec_vsel_4si: Builtin<"V4iV4iV4iV4Ui", "">;

def __builtin_altivec_vsl: Builtin<"V4iV4iV4i", "">;
def __builtin_altivec_vslo: Builtin<"V4iV4iV4i", "">;

def __builtin_altivec_vsrab: Builtin<"V16cV16cV16Uc", "">;
def __builtin_altivec_vsrah: Builtin<"V8sV8sV8Us", "">;
def __builtin_altivec_vsraw: Builtin<"V4iV4iV4Ui", "">;

def __builtin_altivec_vsr: Builtin<"V4iV4iV4i", "">;
def __builtin_altivec_vsro: Builtin<"V4iV4iV4i", "">;

def __builtin_altivec_vrfin: Builtin<"V4fV4f", "">;

def __builtin_altivec_vrsqrtefp: Builtin<"V4fV4f", "">;

def __builtin_altivec_vsubcuw: Builtin<"V4UiV4UiV4Ui", "">;

def __builtin_altivec_vsum4sbs: Builtin<"V4SiV16ScV4Si", "">;
def __builtin_altivec_vsum4ubs: Builtin<"V4UiV16UcV4Ui", "">;
def __builtin_altivec_vsum4shs: Builtin<"V4SiV8SsV4Si", "">;

def __builtin_altivec_vsum2sws: Builtin<"V4SiV4SiV4Si", "">;

def __builtin_altivec_vsumsws: Builtin<"V4SiV4SiV4Si", "">;

def __builtin_altivec_vrfiz: Builtin<"V4fV4f", "">;

def __builtin_altivec_vupkhsb: Builtin<"V8sV16c", "">;
def __builtin_altivec_vupkhpx: Builtin<"V4UiV8s", "">;
def __builtin_altivec_vupkhsh: Builtin<"V4iV8s", "">;
def __builtin_altivec_vupkhsw: Builtin<"V2LLiV4i", "">;

def __builtin_altivec_vupklsb: Builtin<"V8sV16c", "">;
def __builtin_altivec_vupklpx: Builtin<"V4UiV8s", "">;
def __builtin_altivec_vupklsh: Builtin<"V4iV8s", "">;
def __builtin_altivec_vupklsw: Builtin<"V2LLiV4i", "">;

def __builtin_altivec_vcmpbfp_p: Builtin<"iiV4fV4f", "">;

def __builtin_altivec_vcmpgefp_p: Builtin<"iiV4fV4f", "">;

def __builtin_altivec_vcmpequb_p: Builtin<"iiV16cV16c", "">;
def __builtin_altivec_vcmpequh_p: Builtin<"iiV8sV8s", "">;
def __builtin_altivec_vcmpequw_p: Builtin<"iiV4iV4i", "">;
def __builtin_altivec_vcmpequd_p: Builtin<"iiV2LLiV2LLi", "">;
def __builtin_altivec_vcmpeqfp_p: Builtin<"iiV4fV4f", "">;

def __builtin_altivec_vcmpneb_p: Builtin<"iiV16cV16c", "">;
def __builtin_altivec_vcmpneh_p: Builtin<"iiV8sV8s", "">;
def __builtin_altivec_vcmpnew_p: Builtin<"iiV4iV4i", "">;
def __builtin_altivec_vcmpned_p: Builtin<"iiV2LLiV2LLi", "">;

def __builtin_altivec_vcmpgtsb_p: Builtin<"iiV16ScV16Sc", "">;
def __builtin_altivec_vcmpgtub_p: Builtin<"iiV16UcV16Uc", "">;
def __builtin_altivec_vcmpgtsh_p: Builtin<"iiV8SsV8Ss", "">;
def __builtin_altivec_vcmpgtuh_p: Builtin<"iiV8UsV8Us", "">;
def __builtin_altivec_vcmpgtsw_p: Builtin<"iiV4SiV4Si", "">;
def __builtin_altivec_vcmpgtuw_p: Builtin<"iiV4UiV4Ui", "">;
def __builtin_altivec_vcmpgtsd_p: Builtin<"iiV2LLiV2LLi", "">;
def __builtin_altivec_vcmpgtud_p: Builtin<"iiV2ULLiV2ULLi", "">;
def __builtin_altivec_vcmpgtfp_p: Builtin<"iiV4fV4f", "">;

def __builtin_altivec_vgbbd: Builtin<"V16UcV16Uc", "">;
def __builtin_altivec_vbpermq: Builtin<"V2ULLiV16UcV16Uc", "">;

// P8 Crypto built-ins.
def __builtin_altivec_crypto_vsbox: Builtin<"V2ULLiV2ULLi", "">;
def __builtin_altivec_crypto_vpermxor: Builtin<"V16UcV16UcV16UcV16Uc", "">;
def __builtin_altivec_crypto_vshasigmaw: Builtin<"V4UiV4UiIiIi", "">;
def __builtin_altivec_crypto_vshasigmad: Builtin<"V2ULLiV2ULLiIiIi", "">;
def __builtin_altivec_crypto_vcipher: Builtin<"V2ULLiV2ULLiV2ULLi", "">;
def __builtin_altivec_crypto_vcipherlast: Builtin<"V2ULLiV2ULLiV2ULLi", "">;
def __builtin_altivec_crypto_vncipher: Builtin<"V2ULLiV2ULLiV2ULLi", "">;
def __builtin_altivec_crypto_vncipherlast: Builtin<"V2ULLiV2ULLiV2ULLi", "">;
def __builtin_altivec_crypto_vpmsumb: Builtin<"V16UcV16UcV16Uc", "">;
def __builtin_altivec_crypto_vpmsumh: Builtin<"V8UsV8UsV8Us", "">;
def __builtin_altivec_crypto_vpmsumw: Builtin<"V4UiV4UiV4Ui", "">;
def __builtin_altivec_crypto_vpmsumd: Builtin<"V2ULLiV2ULLiV2ULLi", "">;

def __builtin_altivec_vclzb: Builtin<"V16UcV16Uc", "">;
def __builtin_altivec_vclzh: Builtin<"V8UsV8Us", "">;
def __builtin_altivec_vclzw: Builtin<"V4UiV4Ui", "">;
def __builtin_altivec_vclzd: Builtin<"V2ULLiV2ULLi", "">;
def __builtin_altivec_vctzb: Builtin<"V16UcV16Uc", "">;
def __builtin_altivec_vctzh: Builtin<"V8UsV8Us", "">;
def __builtin_altivec_vctzw: Builtin<"V4UiV4Ui", "">;
def __builtin_altivec_vctzd: Builtin<"V2ULLiV2ULLi", "">;

def __builtin_altivec_vclzlsbb: Builtin<"SiV16Uc", "">;
def __builtin_altivec_vctzlsbb: Builtin<"SiV16Uc", "">;
def __builtin_altivec_vprtybw: Builtin<"V4UiV4Ui", "">;
def __builtin_altivec_vprtybd: Builtin<"V2ULLiV2ULLi", "">;
def __builtin_altivec_vprtybq: Builtin<"V1ULLLiV1ULLLi", "">;

// Vector population count built-ins
def __builtin_altivec_vpopcntb: Builtin<"V16UcV16Uc", "">;
def __builtin_altivec_vpopcnth: Builtin<"V8UsV8Us", "">;
def __builtin_altivec_vpopcntw: Builtin<"V4UiV4Ui", "">;
def __builtin_altivec_vpopcntd: Builtin<"V2ULLiV2ULLi", "">;

// Absolute difference built-ins
def __builtin_altivec_vabsdub: Builtin<"V16UcV16UcV16Uc", "">;
def __builtin_altivec_vabsduh: Builtin<"V8UsV8UsV8Us", "">;
def __builtin_altivec_vabsduw: Builtin<"V4UiV4UiV4Ui", "">;

// P9 Shift built-ins.
def __builtin_altivec_vslv: Builtin<"V16UcV16UcV16Uc", "">;
def __builtin_altivec_vsrv: Builtin<"V16UcV16UcV16Uc", "">;

// P9 Vector rotate built-ins
def __builtin_altivec_vrlwmi: Builtin<"V4UiV4UiV4UiV4Ui", "">;
def __builtin_altivec_vrldmi: Builtin<"V2ULLiV2ULLiV2ULLiV2ULLi", "">;
def __builtin_altivec_vrlwnm: Builtin<"V4UiV4UiV4Ui", "">;
def __builtin_altivec_vrldnm: Builtin<"V2ULLiV2ULLiV2ULLi", "">;

// VSX built-ins.

def __builtin_vsx_lxvd2x: Builtin<"V2divC*", "">;
def __builtin_vsx_lxvw4x: Builtin<"V4iivC*", "">;
def __builtin_vsx_lxvd2x_be: Builtin<"V2dSLLivC*", "">;
def __builtin_vsx_lxvw4x_be: Builtin<"V4iSLLivC*", "">;

def __builtin_vsx_stxvd2x: Builtin<"vV2div*", "">;
def __builtin_vsx_stxvw4x: Builtin<"vV4iiv*", "">;
def __builtin_vsx_stxvd2x_be: Builtin<"vV2dSLLivC*", "">;
def __builtin_vsx_stxvw4x_be: Builtin<"vV4iSLLivC*", "">;

def __builtin_vsx_lxvl: Builtin<"V4ivC*ULLi", "">;
def __builtin_vsx_lxvll: Builtin<"V4ivC*ULLi", "">;
def __builtin_vsx_stxvl: Builtin<"vV4iv*ULLi", "">;
def __builtin_vsx_stxvll: Builtin<"vV4iv*ULLi", "">;

def __builtin_vsx_xvmaxdp: Builtin<"V2dV2dV2d", "">;
def __builtin_vsx_xvmaxsp: Builtin<"V4fV4fV4f", "">;
def __builtin_vsx_xsmaxdp: Builtin<"ddd", "">;

def __builtin_vsx_xvmindp: Builtin<"V2dV2dV2d", "">;
def __builtin_vsx_xvminsp: Builtin<"V4fV4fV4f", "">;
def __builtin_vsx_xsmindp: Builtin<"ddd", "">;

def __builtin_vsx_xvdivdp: Builtin<"V2dV2dV2d", "">;
def __builtin_vsx_xvdivsp: Builtin<"V4fV4fV4f", "">;

def __builtin_vsx_xvrdpip: Builtin<"V2dV2d", "">;
def __builtin_vsx_xvrspip: Builtin<"V4fV4f", "">;

def __builtin_vsx_xvcmpeqdp: Builtin<"V2ULLiV2dV2d", "">;
def __builtin_vsx_xvcmpeqsp: Builtin<"V4UiV4fV4f", "">;

def __builtin_vsx_xvcmpeqdp_p: Builtin<"iiV2dV2d", "">;
def __builtin_vsx_xvcmpeqsp_p: Builtin<"iiV4fV4f", "">;

def __builtin_vsx_xvcmpgedp: Builtin<"V2ULLiV2dV2d", "">;
def __builtin_vsx_xvcmpgesp: Builtin<"V4UiV4fV4f", "">;

def __builtin_vsx_xvcmpgedp_p: Builtin<"iiV2dV2d", "">;
def __builtin_vsx_xvcmpgesp_p: Builtin<"iiV4fV4f", "">;

def __builtin_vsx_xvcmpgtdp: Builtin<"V2ULLiV2dV2d", "">;
def __builtin_vsx_xvcmpgtsp: Builtin<"V4UiV4fV4f", "">;

def __builtin_vsx_xvcmpgtdp_p: Builtin<"iiV2dV2d", "">;
def __builtin_vsx_xvcmpgtsp_p: Builtin<"iiV4fV4f", "">;

def __builtin_vsx_xvrdpim: Builtin<"V2dV2d", "">;
def __builtin_vsx_xvrspim: Builtin<"V4fV4f", "">;

def __builtin_vsx_xvrdpi: Builtin<"V2dV2d", "">;
def __builtin_vsx_xvrspi: Builtin<"V4fV4f", "">;

def __builtin_vsx_xvrdpic: Builtin<"V2dV2d", "">;
def __builtin_vsx_xvrspic: Builtin<"V4fV4f", "">;

def __builtin_vsx_xvrdpiz: Builtin<"V2dV2d", "">;
def __builtin_vsx_xvrspiz: Builtin<"V4fV4f", "">;

def __builtin_vsx_xvmaddadp: Builtin<"V2dV2dV2dV2d", "">;
def __builtin_vsx_xvmaddasp: Builtin<"V4fV4fV4fV4f", "">;

def __builtin_vsx_xvmsubadp: Builtin<"V2dV2dV2dV2d", "">;
def __builtin_vsx_xvmsubasp: Builtin<"V4fV4fV4fV4f", "">;

def __builtin_vsx_xvmuldp: Builtin<"V2dV2dV2d", "">;
def __builtin_vsx_xvmulsp: Builtin<"V4fV4fV4f", "">;

def __builtin_vsx_xvnmaddadp: Builtin<"V2dV2dV2dV2d", "">;
def __builtin_vsx_xvnmaddasp: Builtin<"V4fV4fV4fV4f", "">;

def __builtin_vsx_xvnmsubadp: Builtin<"V2dV2dV2dV2d", "">;
def __builtin_vsx_xvnmsubasp: Builtin<"V4fV4fV4fV4f", "">;

def __builtin_vsx_xvredp: Builtin<"V2dV2d", "">;
def __builtin_vsx_xvresp: Builtin<"V4fV4f", "">;

def __builtin_vsx_xvrsqrtedp: Builtin<"V2dV2d", "">;
def __builtin_vsx_xvrsqrtesp: Builtin<"V4fV4f", "">;

def __builtin_vsx_xvsqrtdp: Builtin<"V2dV2d", "">;
def __builtin_vsx_xvsqrtsp: Builtin<"V4fV4f", "">;

def __builtin_vsx_xxleqv: Builtin<"V4UiV4UiV4Ui", "">;

def __builtin_vsx_xvcpsgndp: Builtin<"V2dV2dV2d", "">;
def __builtin_vsx_xvcpsgnsp: Builtin<"V4fV4fV4f", "">;

def __builtin_vsx_xvabssp: Builtin<"V4fV4f", "">;
def __builtin_vsx_xvabsdp: Builtin<"V2dV2d", "">;

// vector Insert/Extract exponent/significand builtins
def __builtin_vsx_xviexpdp: Builtin<"V2dV2ULLiV2ULLi", "">;
def __builtin_vsx_xviexpsp: Builtin<"V4fV4UiV4Ui", "">;
def __builtin_vsx_xvxexpdp: Builtin<"V2ULLiV2d", "">;
def __builtin_vsx_xvxexpsp: Builtin<"V4UiV4f", "">;
def __builtin_vsx_xvxsigdp: Builtin<"V2ULLiV2d", "">;
def __builtin_vsx_xvxsigsp: Builtin<"V4UiV4f", "">;

// Conversion builtins
def __builtin_vsx_xvcvdpsxws: Builtin<"V4SiV2d", "">;
def __builtin_vsx_xvcvdpuxws: Builtin<"V4UiV2d", "">;
def __builtin_vsx_xvcvsxwdp: Builtin<"V2dV4Si", "">;
def __builtin_vsx_xvcvuxwdp: Builtin<"V2dV4Ui", "">;
def __builtin_vsx_xvcvspdp: Builtin<"V2dV4f", "">;
def __builtin_vsx_xvcvsxdsp: Builtin<"V4fV2SLLi", "">;
def __builtin_vsx_xvcvuxdsp: Builtin<"V4fV2ULLi", "">;
def __builtin_vsx_xvcvdpsp: Builtin<"V4fV2d", "">;

def __builtin_vsx_xvcvsphp: Builtin<"V4fV4f", "">;
def __builtin_vsx_xvcvhpsp: Builtin<"V4fV8Us", "">;

// Vector Test Data Class builtins
def __builtin_vsx_xvtstdcdp: Builtin<"V2ULLiV2dIi", "">;
def __builtin_vsx_xvtstdcsp: Builtin<"V4UiV4fIi", "">;

def __builtin_vsx_insertword: Builtin<"V16UcV4UiV16UcIi", "">;
def __builtin_vsx_extractuword: Builtin<"V2ULLiV16UcIi", "">;

def __builtin_vsx_xxpermdi: Builtin<"v.", "t">;
def __builtin_vsx_xxsldwi: Builtin<"v.", "t">;

// Float 128 built-ins
def __builtin_sqrtf128_round_to_odd: Builtin<"LLdLLd", "">;
def __builtin_addf128_round_to_odd: Builtin<"LLdLLdLLd", "">;
def __builtin_subf128_round_to_odd: Builtin<"LLdLLdLLd", "">;
def __builtin_mulf128_round_to_odd: Builtin<"LLdLLdLLd", "">;
def __builtin_divf128_round_to_odd: Builtin<"LLdLLdLLd", "">;
def __builtin_fmaf128_round_to_odd: Builtin<"LLdLLdLLdLLd", "">;
def __builtin_truncf128_round_to_odd: Builtin<"dLLd", "">;
def __builtin_vsx_scalar_extract_expq: Builtin<"ULLiLLd", "">;
def __builtin_vsx_scalar_insert_exp_qp: Builtin<"LLdLLdULLi", "">;

// HTM builtins
def __builtin_tbegin: Builtin<"UiUIi", "">;
def __builtin_tend: Builtin<"UiUIi", "">;

def __builtin_tabort: Builtin<"UiUi", "">;
def __builtin_tabortdc: Builtin<"UiUiUiUi", "">;
def __builtin_tabortdci: Builtin<"UiUiUii", "">;
def __builtin_tabortwc: Builtin<"UiUiUiUi", "">;
def __builtin_tabortwci: Builtin<"UiUiUii", "">;

def __builtin_tcheck: Builtin<"Ui", "">;
def __builtin_treclaim: Builtin<"UiUi", "">;
def __builtin_trechkpt: Builtin<"Ui", "">;
def __builtin_tsr: Builtin<"UiUi", "">;

def __builtin_tendall: Builtin<"Ui", "">;
def __builtin_tresume: Builtin<"Ui", "">;
def __builtin_tsuspend: Builtin<"Ui", "">;

def __builtin_get_texasr: Builtin<"LUi", "c">;
def __builtin_get_texasru: Builtin<"LUi", "c">;
def __builtin_get_tfhar: Builtin<"LUi", "c">;
def __builtin_get_tfiar: Builtin<"LUi", "c">;

def __builtin_set_texasr: Builtin<"vLUi", "c">;
def __builtin_set_texasru: Builtin<"vLUi", "c">;
def __builtin_set_tfhar: Builtin<"vLUi", "c">;
def __builtin_set_tfiar: Builtin<"vLUi", "c">;

def __builtin_ttest: Builtin<"LUi", "">;

// Scalar built-ins
def __builtin_divwe: Builtin<"SiSiSi", "">;
def __builtin_divweu: Builtin<"UiUiUi", "">;
def __builtin_divde: Builtin<"SLLiSLLiSLLi", "">;
def __builtin_divdeu: Builtin<"ULLiULLiULLi", "">;
def __builtin_bpermd: Builtin<"SLLiSLLiSLLi", "">;

// Vector int128 (un)pack
def __builtin_unpack_vector_int128: Builtin<"ULLiV1LLLii", "">;
def __builtin_pack_vector_int128: Builtin<"V1LLLiULLiULLi", "">;

// Set the floating point rounding mode
def __builtin_setrnd: Builtin<"di", "">;

// Cache built-ins
def __builtin_dcbf: Builtin<"vvC*", "">;

// FIXME: Obviously incomplete.

}
