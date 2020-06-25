//===--- BuiltinsARM.def - ARM Builtin function database ----*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the ARM-specific builtin function database.  Users of
// this file must define the BUILTIN macro to make use of this information.
//
//===----------------------------------------------------------------------===//

// Type and attribute strings are as defined in Builtins.td.



// In libgcc
include "BuiltinTableGenDefs.inc"

let TargetArch = "ARM" in {
def __clear_cache: Builtin<"vv*v*", "i">;

// 16-bit multiplications
def __builtin_arm_smulbb: Builtin<"iii", "nc">;
def __builtin_arm_smulbt: Builtin<"iii", "nc">;
def __builtin_arm_smultb: Builtin<"iii", "nc">;
def __builtin_arm_smultt: Builtin<"iii", "nc">;
def __builtin_arm_smulwb: Builtin<"iii", "nc">;
def __builtin_arm_smulwt: Builtin<"iii", "nc">;

// Saturating arithmetic
def __builtin_arm_qadd: Builtin<"iii", "nc">;
def __builtin_arm_qsub: Builtin<"iii", "nc">;
def __builtin_arm_qdbl: Builtin<"ii", "nc">;
def __builtin_arm_ssat: Builtin<"iiUi", "nc">;
def __builtin_arm_usat: Builtin<"UiiUi", "nc">;

def __builtin_arm_smlabb: Builtin<"iiii", "nc">;
def __builtin_arm_smlabt: Builtin<"iiii", "nc">;
def __builtin_arm_smlatb: Builtin<"iiii", "nc">;
def __builtin_arm_smlatt: Builtin<"iiii", "nc">;
def __builtin_arm_smlawb: Builtin<"iiii", "nc">;
def __builtin_arm_smlawt: Builtin<"iiii", "nc">;

def __builtin_arm_ssat16: Builtin<"iii", "nc">;
def __builtin_arm_usat16: Builtin<"iii", "nc">;

def __builtin_arm_sxtab16: Builtin<"iii", "nc">;
def __builtin_arm_sxtb16: Builtin<"ii", "nc">;
def __builtin_arm_uxtab16: Builtin<"iii", "nc">;
def __builtin_arm_uxtb16: Builtin<"ii", "nc">;

def __builtin_arm_sel: Builtin<"iii", "nc">;

def __builtin_arm_qadd8: Builtin<"iii", "nc">;
def __builtin_arm_qsub8: Builtin<"iii", "nc">;
def __builtin_arm_sadd8: Builtin<"iii", "nc">;
def __builtin_arm_shadd8: Builtin<"iii", "nc">;
def __builtin_arm_shsub8: Builtin<"iii", "nc">;
def __builtin_arm_ssub8: Builtin<"iii", "nc">;
def __builtin_arm_uadd8: Builtin<"UiUiUi", "nc">;
def __builtin_arm_uhadd8: Builtin<"UiUiUi", "nc">;
def __builtin_arm_uhsub8: Builtin<"UiUiUi", "nc">;
def __builtin_arm_uqadd8: Builtin<"UiUiUi", "nc">;
def __builtin_arm_uqsub8: Builtin<"UiUiUi", "nc">;
def __builtin_arm_usub8: Builtin<"UiUiUi", "nc">;

// Sum of 8-bit absolute differences
def __builtin_arm_usad8: Builtin<"UiUiUi", "nc">;
def __builtin_arm_usada8: Builtin<"UiUiUiUi", "nc">;

// Parallel 16-bit addition and subtraction
def __builtin_arm_qadd16: Builtin<"iii", "nc">;
def __builtin_arm_qasx: Builtin<"iii", "nc">;
def __builtin_arm_qsax: Builtin<"iii", "nc">;
def __builtin_arm_qsub16: Builtin<"iii", "nc">;
def __builtin_arm_sadd16: Builtin<"iii", "nc">;
def __builtin_arm_sasx: Builtin<"iii", "nc">;
def __builtin_arm_shadd16: Builtin<"iii", "nc">;
def __builtin_arm_shasx: Builtin<"iii", "nc">;
def __builtin_arm_shsax: Builtin<"iii", "nc">;
def __builtin_arm_shsub16: Builtin<"iii", "nc">;
def __builtin_arm_ssax: Builtin<"iii", "nc">;
def __builtin_arm_ssub16: Builtin<"iii", "nc">;
def __builtin_arm_uadd16: Builtin<"UiUiUi", "nc">;
def __builtin_arm_uasx: Builtin<"UiUiUi", "nc">;
def __builtin_arm_uhadd16: Builtin<"UiUiUi", "nc">;
def __builtin_arm_uhasx: Builtin<"UiUiUi", "nc">;
def __builtin_arm_uhsax: Builtin<"UiUiUi", "nc">;
def __builtin_arm_uhsub16: Builtin<"UiUiUi", "nc">;
def __builtin_arm_uqadd16: Builtin<"UiUiUi", "nc">;
def __builtin_arm_uqasx: Builtin<"UiUiUi", "nc">;
def __builtin_arm_uqsax: Builtin<"UiUiUi", "nc">;
def __builtin_arm_uqsub16: Builtin<"UiUiUi", "nc">;
def __builtin_arm_usax: Builtin<"UiUiUi", "nc">;
def __builtin_arm_usub16: Builtin<"UiUiUi", "nc">;

// Parallel 16-bit multiplication
def __builtin_arm_smlad: Builtin<"iiii", "nc">;
def __builtin_arm_smladx: Builtin<"iiii", "nc">;
def __builtin_arm_smlald: Builtin<"LLiiiLLi", "nc">;
def __builtin_arm_smlaldx: Builtin<"LLiiiLLi", "nc">;
def __builtin_arm_smlsd: Builtin<"iiii", "nc">;
def __builtin_arm_smlsdx: Builtin<"iiii", "nc">;
def __builtin_arm_smlsld: Builtin<"LLiiiLLi", "nc">;
def __builtin_arm_smlsldx: Builtin<"LLiiiLLi", "nc">;
def __builtin_arm_smuad: Builtin<"iii", "nc">;
def __builtin_arm_smuadx: Builtin<"iii", "nc">;
def __builtin_arm_smusd: Builtin<"iii", "nc">;
def __builtin_arm_smusdx: Builtin<"iii", "nc">;

// Bit manipulation
def __builtin_arm_rbit: Builtin<"UiUi", "nc">;
def __builtin_arm_cls: Builtin<"UiZUi", "nc">;
def __builtin_arm_cls64: Builtin<"UiWUi", "nc">;

// Store and load exclusive
def __builtin_arm_ldrexd: Builtin<"LLUiv*", "">;
def __builtin_arm_strexd: Builtin<"iLLUiv*", "">;

def __builtin_arm_ldrex: Builtin<"v.", "t">;
def __builtin_arm_ldaex: Builtin<"v.", "t">;
def __builtin_arm_strex: Builtin<"i.", "t">;
def __builtin_arm_stlex: Builtin<"i.", "t">;
def __builtin_arm_clrex: Builtin<"v", "">;

// VFP
def __builtin_arm_get_fpscr: Builtin<"Ui", "nc">;
def __builtin_arm_set_fpscr: Builtin<"vUi", "nc">;
def __builtin_arm_vcvtr_f: Builtin<"ffi", "nc">;
def __builtin_arm_vcvtr_d: Builtin<"fdi", "nc">;

// Coprocessor
def __builtin_arm_ldc: Builtin<"vUIiUIivC*", "">;
def __builtin_arm_ldcl: Builtin<"vUIiUIivC*", "">;
def __builtin_arm_ldc2: Builtin<"vUIiUIivC*", "">;
def __builtin_arm_ldc2l: Builtin<"vUIiUIivC*", "">;

def __builtin_arm_stc: Builtin<"vUIiUIiv*", "">;
def __builtin_arm_stcl: Builtin<"vUIiUIiv*", "">;
def __builtin_arm_stc2: Builtin<"vUIiUIiv*", "">;
def __builtin_arm_stc2l: Builtin<"vUIiUIiv*", "">;

def __builtin_arm_cdp: Builtin<"vUIiUIiUIiUIiUIiUIi", "">;
def __builtin_arm_cdp2: Builtin<"vUIiUIiUIiUIiUIiUIi", "">;
def __builtin_arm_mcr: Builtin<"vUIiUIiUiUIiUIiUIi", "">;
def __builtin_arm_mcr2: Builtin<"vUIiUIiUiUIiUIiUIi", "">;
def __builtin_arm_mrc: Builtin<"UiUIiUIiUIiUIiUIi", "">;
def __builtin_arm_mrc2: Builtin<"UiUIiUIiUIiUIiUIi", "">;
def __builtin_arm_mcrr: Builtin<"vUIiUIiLLUiUIi", "">;
def __builtin_arm_mcrr2: Builtin<"vUIiUIiLLUiUIi", "">;
def __builtin_arm_mrrc: Builtin<"LLUiUIiUIiUIi", "">;
def __builtin_arm_mrrc2: Builtin<"LLUiUIiUIiUIi", "">;

// CRC32
def __builtin_arm_crc32b: Builtin<"UiUiUc", "nc">;
def __builtin_arm_crc32cb: Builtin<"UiUiUc", "nc">;
def __builtin_arm_crc32h: Builtin<"UiUiUs", "nc">;
def __builtin_arm_crc32ch: Builtin<"UiUiUs", "nc">;
def __builtin_arm_crc32w: Builtin<"UiUiUi", "nc">;
def __builtin_arm_crc32cw: Builtin<"UiUiUi", "nc">;
def __builtin_arm_crc32d: Builtin<"UiUiLLUi", "nc">;
def __builtin_arm_crc32cd: Builtin<"UiUiLLUi", "nc">;

// ARMv8-M Security Extensions a.k.a CMSE
def __builtin_arm_cmse_TT: Builtin<"Uiv*", "n">;
def __builtin_arm_cmse_TTT: Builtin<"Uiv*", "n">;
def __builtin_arm_cmse_TTA: Builtin<"Uiv*", "n">;
def __builtin_arm_cmse_TTAT: Builtin<"Uiv*", "n">;

// HINT
def __builtin_arm_nop: Builtin<"v", "">;
def __builtin_arm_yield: Builtin<"v", "">;
def __builtin_arm_wfe: Builtin<"v", "">;
def __builtin_arm_wfi: Builtin<"v", "">;
def __builtin_arm_sev: Builtin<"v", "">;
def __builtin_arm_sevl: Builtin<"v", "">;
def __builtin_arm_dbg: Builtin<"vUi", "">;

// Data barrier
def __builtin_arm_dmb: Builtin<"vUi", "nc">;
def __builtin_arm_dsb: Builtin<"vUi", "nc">;
def __builtin_arm_isb: Builtin<"vUi", "nc">;

// Prefetch
def __builtin_arm_prefetch: Builtin<"vvC*UiUi", "nc">;

// System registers (ACLE)
def __builtin_arm_rsr: Builtin<"UicC*", "nc">;
def __builtin_arm_rsr64: Builtin<"LLUicC*", "nc">;
def __builtin_arm_rsrp: Builtin<"v*cC*", "nc">;
def __builtin_arm_wsr: Builtin<"vcC*Ui", "nc">;
def __builtin_arm_wsr64: Builtin<"vcC*LLUi", "nc">;
def __builtin_arm_wsrp: Builtin<"vcC*vC*", "nc">;

// Builtins for implementing ACLE MVE intrinsics. (Unlike NEON, these
// don't need to live in a separate BuiltinsMVE.def, because they
// aren't included from both here and BuiltinsAArch64.def.)


// MSVC
def __emit: LangBuiltin<"vIUiC", "", AllMSLanguages>;

def __yield: LangBuiltin<"v", "", AllMSLanguages>;
def __wfe: LangBuiltin<"v", "", AllMSLanguages>;
def __wfi: LangBuiltin<"v", "", AllMSLanguages>;
def __sev: LangBuiltin<"v", "", AllMSLanguages>;
def __sevl: LangBuiltin<"v", "", AllMSLanguages>;

def __dmb: LangBuiltin<"vUi", "nc", AllMSLanguages>;
def __dsb: LangBuiltin<"vUi", "nc", AllMSLanguages>;
def __isb: LangBuiltin<"vUi", "nc", AllMSLanguages>;
def __ldrexd: LangBuiltin<"WiWiCD*", "", AllMSLanguages>;
def _MoveFromCoprocessor: LangBuiltin<"UiIUiIUiIUiIUiIUi", "", AllMSLanguages>;
def _MoveFromCoprocessor2: LangBuiltin<"UiIUiIUiIUiIUiIUi", "", AllMSLanguages>;
def _MoveToCoprocessor: LangBuiltin<"vUiIUiIUiIUiIUiIUi", "", AllMSLanguages>;
def _MoveToCoprocessor2: LangBuiltin<"vUiIUiIUiIUiIUiIUi", "", AllMSLanguages>;

def _BitScanForward: TargetHeaderBuiltin<"UcUNi*UNi", "nh", "intrin.h", AllMSLanguages, "">;
def _BitScanReverse: TargetHeaderBuiltin<"UcUNi*UNi", "nh", "intrin.h", AllMSLanguages, "">;
def _BitScanForward64: TargetHeaderBuiltin<"UcUNi*ULLi", "nh", "intrin.h", AllMSLanguages, "">;
def _BitScanReverse64: TargetHeaderBuiltin<"UcUNi*ULLi", "nh", "intrin.h", AllMSLanguages, "">;

def _InterlockedAnd64: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedDecrement64: TargetHeaderBuiltin<"LLiLLiD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchange64: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchangeAdd64: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchangeSub64: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedIncrement64: TargetHeaderBuiltin<"LLiLLiD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedOr64: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedXor64: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;

def _InterlockedExchangeAdd_acq: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchangeAdd_rel: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchangeAdd_nf: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchangeAdd8_acq: TargetHeaderBuiltin<"ccD*c", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchangeAdd8_rel: TargetHeaderBuiltin<"ccD*c", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchangeAdd8_nf: TargetHeaderBuiltin<"ccD*c", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchangeAdd16_acq: TargetHeaderBuiltin<"ssD*s", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchangeAdd16_rel: TargetHeaderBuiltin<"ssD*s", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchangeAdd16_nf: TargetHeaderBuiltin<"ssD*s", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchangeAdd64_acq: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchangeAdd64_rel: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchangeAdd64_nf: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;

def _InterlockedExchange8_acq: TargetHeaderBuiltin<"ccD*c", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchange8_nf: TargetHeaderBuiltin<"ccD*c", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchange8_rel: TargetHeaderBuiltin<"ccD*c", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchange16_acq: TargetHeaderBuiltin<"ssD*s", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchange16_nf: TargetHeaderBuiltin<"ssD*s", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchange16_rel: TargetHeaderBuiltin<"ssD*s", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchange_acq: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchange_nf: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchange_rel: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchange64_acq: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchange64_nf: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchange64_rel: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;

def _InterlockedCompareExchange8_acq: TargetHeaderBuiltin<"ccD*cc", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedCompareExchange8_nf: TargetHeaderBuiltin<"ccD*cc", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedCompareExchange8_rel: TargetHeaderBuiltin<"ccD*cc", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedCompareExchange16_acq: TargetHeaderBuiltin<"ssD*ss", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedCompareExchange16_nf: TargetHeaderBuiltin<"ssD*ss", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedCompareExchange16_rel: TargetHeaderBuiltin<"ssD*ss", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedCompareExchange_acq: TargetHeaderBuiltin<"NiNiD*NiNi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedCompareExchange_nf: TargetHeaderBuiltin<"NiNiD*NiNi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedCompareExchange_rel: TargetHeaderBuiltin<"NiNiD*NiNi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedCompareExchange64_acq: TargetHeaderBuiltin<"LLiLLiD*LLiLLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedCompareExchange64_nf: TargetHeaderBuiltin<"LLiLLiD*LLiLLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedCompareExchange64_rel: TargetHeaderBuiltin<"LLiLLiD*LLiLLi", "nh", "intrin.h", AllMSLanguages, "">;

def _InterlockedOr8_acq: TargetHeaderBuiltin<"ccD*c", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedOr8_nf: TargetHeaderBuiltin<"ccD*c", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedOr8_rel: TargetHeaderBuiltin<"ccD*c", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedOr16_acq: TargetHeaderBuiltin<"ssD*s", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedOr16_nf: TargetHeaderBuiltin<"ssD*s", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedOr16_rel: TargetHeaderBuiltin<"ssD*s", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedOr_acq: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedOr_nf: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedOr_rel: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedOr64_acq: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedOr64_nf: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedOr64_rel: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;

def _InterlockedXor8_acq: TargetHeaderBuiltin<"ccD*c", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedXor8_nf: TargetHeaderBuiltin<"ccD*c", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedXor8_rel: TargetHeaderBuiltin<"ccD*c", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedXor16_acq: TargetHeaderBuiltin<"ssD*s", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedXor16_nf: TargetHeaderBuiltin<"ssD*s", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedXor16_rel: TargetHeaderBuiltin<"ssD*s", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedXor_acq: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedXor_nf: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedXor_rel: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedXor64_acq: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedXor64_nf: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedXor64_rel: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;

def _InterlockedAnd8_acq: TargetHeaderBuiltin<"ccD*c", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedAnd8_nf: TargetHeaderBuiltin<"ccD*c", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedAnd8_rel: TargetHeaderBuiltin<"ccD*c", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedAnd16_acq: TargetHeaderBuiltin<"ssD*s", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedAnd16_nf: TargetHeaderBuiltin<"ssD*s", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedAnd16_rel: TargetHeaderBuiltin<"ssD*s", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedAnd_acq: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedAnd_nf: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedAnd_rel: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedAnd64_acq: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedAnd64_nf: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedAnd64_rel: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;

def _InterlockedIncrement16_acq: TargetHeaderBuiltin<"ssD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedIncrement16_nf: TargetHeaderBuiltin<"ssD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedIncrement16_rel: TargetHeaderBuiltin<"ssD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedIncrement_acq: TargetHeaderBuiltin<"NiNiD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedIncrement_nf: TargetHeaderBuiltin<"NiNiD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedIncrement_rel: TargetHeaderBuiltin<"NiNiD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedIncrement64_acq: TargetHeaderBuiltin<"LLiLLiD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedIncrement64_nf: TargetHeaderBuiltin<"LLiLLiD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedIncrement64_rel: TargetHeaderBuiltin<"LLiLLiD*", "nh", "intrin.h", AllMSLanguages, "">;

def _InterlockedDecrement16_acq: TargetHeaderBuiltin<"ssD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedDecrement16_nf: TargetHeaderBuiltin<"ssD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedDecrement16_rel: TargetHeaderBuiltin<"ssD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedDecrement_acq: TargetHeaderBuiltin<"NiNiD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedDecrement_nf: TargetHeaderBuiltin<"NiNiD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedDecrement_rel: TargetHeaderBuiltin<"NiNiD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedDecrement64_acq: TargetHeaderBuiltin<"LLiLLiD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedDecrement64_nf: TargetHeaderBuiltin<"LLiLLiD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedDecrement64_rel: TargetHeaderBuiltin<"LLiLLiD*", "nh", "intrin.h", AllMSLanguages, "">;

}
