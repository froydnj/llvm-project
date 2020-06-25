//==- BuiltinsAArch64.def - AArch64 Builtin function database ----*- C++ -*-==//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the AArch64-specific builtin function database.  Users of
// this file must define the BUILTIN macro to make use of this information.
//
//===----------------------------------------------------------------------===//

// Type and attribute strings are as defined in Builtins.td.



// In libgcc
include "BuiltinTableGenDefs.inc"

let TargetArch = "AArch64" in {
def __clear_cache: Builtin<"vv*v*", "i">;

def __builtin_arm_ldrex: Builtin<"v.", "t">;
def __builtin_arm_ldaex: Builtin<"v.", "t">;
def __builtin_arm_strex: Builtin<"i.", "t">;
def __builtin_arm_stlex: Builtin<"i.", "t">;
def __builtin_arm_clrex: Builtin<"v", "">;

// Bit manipulation
def __builtin_arm_rbit: Builtin<"UiUi", "nc">;
def __builtin_arm_rbit64: Builtin<"WUiWUi", "nc">;
def __builtin_arm_cls: Builtin<"UiZUi", "nc">;
def __builtin_arm_cls64: Builtin<"UiWUi", "nc">;

// HINT
def __builtin_arm_nop: Builtin<"v", "">;
def __builtin_arm_yield: Builtin<"v", "">;
def __builtin_arm_wfe: Builtin<"v", "">;
def __builtin_arm_wfi: Builtin<"v", "">;
def __builtin_arm_sev: Builtin<"v", "">;
def __builtin_arm_sevl: Builtin<"v", "">;

// CRC32
def __builtin_arm_crc32b: Builtin<"UiUiUc", "nc">;
def __builtin_arm_crc32cb: Builtin<"UiUiUc", "nc">;
def __builtin_arm_crc32h: Builtin<"UiUiUs", "nc">;
def __builtin_arm_crc32ch: Builtin<"UiUiUs", "nc">;
def __builtin_arm_crc32w: Builtin<"UiUiUi", "nc">;
def __builtin_arm_crc32cw: Builtin<"UiUiUi", "nc">;
def __builtin_arm_crc32d: Builtin<"UiUiWUi", "nc">;
def __builtin_arm_crc32cd: Builtin<"UiUiWUi", "nc">;

// Memory Tagging Extensions (MTE)
def __builtin_arm_irg: Builtin<"v*v*Ui", "t">;
def __builtin_arm_addg: Builtin<"v*v*Ui", "t">;
def __builtin_arm_gmi: Builtin<"Uiv*Ui", "t">;
def __builtin_arm_ldg: Builtin<"v*v*", "t">;
def __builtin_arm_stg: Builtin<"vv*", "t">;
def __builtin_arm_subp: Builtin<"Uiv*v*", "t">;

// Memory barrier
def __builtin_arm_dmb: Builtin<"vUi", "nc">;
def __builtin_arm_dsb: Builtin<"vUi", "nc">;
def __builtin_arm_isb: Builtin<"vUi", "nc">;

def __builtin_arm_jcvt: Builtin<"Zid", "nc">;

// Prefetch
def __builtin_arm_prefetch: Builtin<"vvC*UiUiUiUi", "nc">;

// System Registers
def __builtin_arm_rsr: Builtin<"UicC*", "nc">;
def __builtin_arm_rsr64: Builtin<"WUicC*", "nc">;
def __builtin_arm_rsrp: Builtin<"v*cC*", "nc">;
def __builtin_arm_wsr: Builtin<"vcC*Ui", "nc">;
def __builtin_arm_wsr64: Builtin<"vcC*WUi", "nc">;
def __builtin_arm_wsrp: Builtin<"vcC*vC*", "nc">;

// MSVC
def __dmb: LangBuiltin<"vUi", "nc", AllMSLanguages>;
def __dsb: LangBuiltin<"vUi", "nc", AllMSLanguages>;
def __isb: LangBuiltin<"vUi", "nc", AllMSLanguages>;
def __yield: LangBuiltin<"v", "", AllMSLanguages>;
def __wfe: LangBuiltin<"v", "", AllMSLanguages>;
def __wfi: LangBuiltin<"v", "", AllMSLanguages>;
def __sev: LangBuiltin<"v", "", AllMSLanguages>;
def __sevl: LangBuiltin<"v", "", AllMSLanguages>;

// Misc
def __builtin_sponentry: Builtin<"v*", "c">;

// Transactional Memory Extension
def __builtin_arm_tstart: Builtin<"WUi", "nj">;
def __builtin_arm_tcommit: Builtin<"v", "n">;
def __builtin_arm_tcancel: Builtin<"vWUIi", "n">;
def __builtin_arm_ttest: Builtin<"WUi", "nc">;

def _BitScanForward: TargetHeaderBuiltin<"UcUNi*UNi", "nh", "intrin.h", AllMSLanguages, "">;
def _BitScanReverse: TargetHeaderBuiltin<"UcUNi*UNi", "nh", "intrin.h", AllMSLanguages, "">;
def _BitScanForward64: TargetHeaderBuiltin<"UcUNi*ULLi", "nh", "intrin.h", AllMSLanguages, "">;
def _BitScanReverse64: TargetHeaderBuiltin<"UcUNi*ULLi", "nh", "intrin.h", AllMSLanguages, "">;

def _InterlockedAdd: TargetHeaderBuiltin<"NiNiD*Ni", "nh", "intrin.h", AllMSLanguages, "">;
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

def _ReadWriteBarrier: TargetHeaderBuiltin<"v", "nh", "intrin.h", AllMSLanguages, "">;
def __getReg: TargetHeaderBuiltin<"ULLii", "nh", "intrin.h", AllMSLanguages, "">;
def _ReadStatusReg: TargetHeaderBuiltin<"LLii", "nh", "intrin.h", AllMSLanguages, "">;
def _WriteStatusReg: TargetHeaderBuiltin<"viLLi", "nh", "intrin.h", AllMSLanguages, "">;
def _AddressOfReturnAddress: TargetHeaderBuiltin<"v*", "nh", "intrin.h", AllMSLanguages, "">;

}
