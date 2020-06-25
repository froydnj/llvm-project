//===--- BuiltinsX86_64.def - X86-64 Builtin function database --*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the X86-64-specific builtin function database. Users of
// this file must define the BUILTIN macro to make use of this information.
//
//===----------------------------------------------------------------------===//

// Type and attribute strings are as defined in Builtins.td.



include "BuiltinTableGenDefs.inc"

let TargetArch = "X86_64" in {
def _BitScanForward64: TargetHeaderBuiltin<"UcUNi*ULLi", "nh", "intrin.h", AllMSLanguages, "">;
def _BitScanReverse64: TargetHeaderBuiltin<"UcUNi*ULLi", "nh", "intrin.h", AllMSLanguages, "">;

def __mulh: TargetHeaderBuiltin<"LLiLLiLLi", "nch", "intrin.h", AllMSLanguages, "">;
def __umulh: TargetHeaderBuiltin<"ULLiULLiULLi", "nch", "intrin.h", AllMSLanguages, "">;
def _mul128: TargetHeaderBuiltin<"LLiLLiLLiLLi*", "nch", "intrin.h", AllMSLanguages, "">;
def _umul128: TargetHeaderBuiltin<"ULLiULLiULLiULLi*", "nch", "intrin.h", AllMSLanguages, "">;

def __faststorefence: TargetHeaderBuiltin<"v", "nh", "intrin.h", AllMSLanguages, "">;
def __shiftleft128: TargetHeaderBuiltin<"ULLiULLiULLiUc", "nch", "intrin.h", AllMSLanguages, "">;
def __shiftright128: TargetHeaderBuiltin<"ULLiULLiULLiUc", "nch", "intrin.h", AllMSLanguages, "">;

def _InterlockedAnd64: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedDecrement64: TargetHeaderBuiltin<"LLiLLiD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchange64: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchangeAdd64: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedExchangeSub64: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedIncrement64: TargetHeaderBuiltin<"LLiLLiD*", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedOr64: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedXor64: TargetHeaderBuiltin<"LLiLLiD*LLi", "nh", "intrin.h", AllMSLanguages, "">;
def _InterlockedCompareExchange128: TargetHeaderBuiltin<"UcLLiD*LLiLLiLLi*", "nh", "intrin.h", AllMSLanguages, "cx16">;

def __builtin_ia32_readeflags_u64: TargetBuiltin<"UOi", "n", "">;
def __builtin_ia32_writeeflags_u64: TargetBuiltin<"vUOi", "n", "">;
def __builtin_ia32_cvtss2si64: TargetBuiltin<"OiV4f", "ncV:128:", "sse">;
def __builtin_ia32_cvttss2si64: TargetBuiltin<"OiV4f", "ncV:128:", "sse">;
def __builtin_ia32_cvtsd2si64: TargetBuiltin<"OiV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cvttsd2si64: TargetBuiltin<"OiV2d", "ncV:128:", "sse2">;
def __builtin_ia32_movnti64: TargetBuiltin<"vOi*Oi", "n", "sse2">;
def __builtin_ia32_vec_ext_v2di: TargetBuiltin<"OiV2OiIi", "ncV:128:", "sse2">;
def __builtin_ia32_vec_set_v2di: TargetBuiltin<"V2OiV2OiOiIi", "ncV:128:", "sse4.1">;
def __builtin_ia32_crc32di: TargetBuiltin<"UOiUOiUOi", "nc", "sse4.2">;
def __builtin_ia32_vec_ext_v4di: TargetBuiltin<"OiV4OiIi", "ncV:256:", "avx">;
def __builtin_ia32_vec_set_v4di: TargetBuiltin<"V4OiV4OiOiIi", "ncV:256:", "avx">;
def __builtin_ia32_rdfsbase32: TargetBuiltin<"Ui", "n", "fsgsbase">;
def __builtin_ia32_rdfsbase64: TargetBuiltin<"UOi", "n", "fsgsbase">;
def __builtin_ia32_rdgsbase32: TargetBuiltin<"Ui", "n", "fsgsbase">;
def __builtin_ia32_rdgsbase64: TargetBuiltin<"UOi", "n", "fsgsbase">;
def __builtin_ia32_wrfsbase32: TargetBuiltin<"vUi", "n", "fsgsbase">;
def __builtin_ia32_wrfsbase64: TargetBuiltin<"vUOi", "n", "fsgsbase">;
def __builtin_ia32_wrgsbase32: TargetBuiltin<"vUi", "n", "fsgsbase">;
def __builtin_ia32_wrgsbase64: TargetBuiltin<"vUOi", "n", "fsgsbase">;
def __builtin_ia32_fxrstor64: TargetBuiltin<"vv*", "n", "fxsr">;
def __builtin_ia32_fxsave64: TargetBuiltin<"vv*", "n", "fxsr">;
def __builtin_ia32_xsave64: TargetBuiltin<"vv*UOi", "n", "xsave">;
def __builtin_ia32_xrstor64: TargetBuiltin<"vv*UOi", "n", "xsave">;
def __builtin_ia32_xsaveopt64: TargetBuiltin<"vv*UOi", "n", "xsaveopt">;
def __builtin_ia32_xrstors64: TargetBuiltin<"vv*UOi", "n", "xsaves">;
def __builtin_ia32_xsavec64: TargetBuiltin<"vv*UOi", "n", "xsavec">;
def __builtin_ia32_xsaves64: TargetBuiltin<"vv*UOi", "n", "xsaves">;
def __builtin_ia32_incsspq: TargetBuiltin<"vUOi", "n", "shstk">;
def __builtin_ia32_rdsspq: TargetBuiltin<"UOiUOi", "n", "shstk">;
def __builtin_ia32_wrssq: TargetBuiltin<"vUOiv*", "n", "shstk">;
def __builtin_ia32_wrussq: TargetBuiltin<"vUOiv*", "n", "shstk">;
def __builtin_ia32_addcarryx_u64: TargetBuiltin<"UcUcUOiUOiUOi*", "n", "">;
def __builtin_ia32_subborrow_u64: TargetBuiltin<"UcUcUOiUOiUOi*", "n", "">;
def __builtin_ia32_rdrand64_step: TargetBuiltin<"UiUOi*", "n", "rdrnd">;
def __builtin_ia32_rdseed64_step: TargetBuiltin<"UiUOi*", "n", "rdseed">;
def __builtin_ia32_lzcnt_u64: TargetBuiltin<"UOiUOi", "nc", "lzcnt">;
def __builtin_ia32_bextr_u64: TargetBuiltin<"UOiUOiUOi", "nc", "bmi">;
def __builtin_ia32_tzcnt_u64: TargetBuiltin<"UOiUOi", "nc", "">;
def __builtin_ia32_bzhi_di: TargetBuiltin<"UOiUOiUOi", "nc", "bmi2">;
def __builtin_ia32_pdep_di: TargetBuiltin<"UOiUOiUOi", "nc", "bmi2">;
def __builtin_ia32_pext_di: TargetBuiltin<"UOiUOiUOi", "nc", "bmi2">;
def __builtin_ia32_bextri_u64: TargetBuiltin<"UOiUOiIUOi", "nc", "tbm">;
def __builtin_ia32_lwpins64: TargetBuiltin<"UcUOiUiIUi", "n", "lwp">;
def __builtin_ia32_lwpval64: TargetBuiltin<"vUOiUiIUi", "n", "lwp">;
def __builtin_ia32_vcvtsd2si64: TargetBuiltin<"OiV2dIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vcvtsd2usi64: TargetBuiltin<"UOiV2dIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vcvtss2si64: TargetBuiltin<"OiV4fIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vcvtss2usi64: TargetBuiltin<"UOiV4fIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vcvttsd2si64: TargetBuiltin<"OiV2dIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vcvttsd2usi64: TargetBuiltin<"UOiV2dIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vcvttss2si64: TargetBuiltin<"OiV4fIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vcvttss2usi64: TargetBuiltin<"UOiV4fIi", "ncV:128:", "avx512f">;
def __builtin_ia32_cvtsi2sd64: TargetBuiltin<"V2dV2dOiIi", "ncV:128:", "avx512f">;
def __builtin_ia32_cvtsi2ss64: TargetBuiltin<"V4fV4fOiIi", "ncV:128:", "avx512f">;
def __builtin_ia32_cvtusi2sd64: TargetBuiltin<"V2dV2dUOiIi", "ncV:128:", "avx512f">;
def __builtin_ia32_cvtusi2ss64: TargetBuiltin<"V4fV4fUOiIi", "ncV:128:", "avx512f">;
def __builtin_ia32_directstore_u64: TargetBuiltin<"vULi*ULi", "n", "movdiri">;
def __builtin_ia32_ptwrite64: TargetBuiltin<"vUOi", "n", "ptwrite">;

}
