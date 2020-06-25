//===--- BuiltinsX86.def - X86 Builtin function database --------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the X86-specific builtin function database.  Users of
// this file must define the BUILTIN macro to make use of this information.
//
//===----------------------------------------------------------------------===//

// Type and attribute strings are as defined in Builtins.td.

// FIXME: Ideally we would be able to pull this information from what
// LLVM already knows about X86 builtins. We need to match the LLVM
// definition anyway, since code generation will lower to the
// intrinsic if one exists.



// Miscellaneous builtin for checking x86 cpu features.
// TODO: Make this somewhat generic so that other backends
// can use it?
include "BuiltinTableGenDefs.inc"

let TargetArch = "X86" in {
def __builtin_cpu_init: Builtin<"v", "n">;
def __builtin_cpu_supports: Builtin<"bcC*", "nc">;
def __builtin_cpu_is: Builtin<"bcC*", "nc">;

// Undefined Values
//
def __builtin_ia32_undef128: TargetBuiltin<"V2d", "ncV:128:", "">;
def __builtin_ia32_undef256: TargetBuiltin<"V4d", "ncV:256:", "">;
def __builtin_ia32_undef512: TargetBuiltin<"V8d", "ncV:512:", "">;

// FLAGS
//
def __builtin_ia32_readeflags_u32: TargetBuiltin<"Ui", "n", "">;
def __builtin_ia32_writeeflags_u32: TargetBuiltin<"vUi", "n", "">;

// 3DNow!
//
def __builtin_ia32_femms: TargetBuiltin<"v", "n", "3dnow">;
def __builtin_ia32_pavgusb: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "3dnow">;
def __builtin_ia32_pf2id: TargetBuiltin<"V2iV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pfacc: TargetBuiltin<"V2fV2fV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pfadd: TargetBuiltin<"V2fV2fV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pfcmpeq: TargetBuiltin<"V2iV2fV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pfcmpge: TargetBuiltin<"V2iV2fV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pfcmpgt: TargetBuiltin<"V2iV2fV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pfmax: TargetBuiltin<"V2fV2fV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pfmin: TargetBuiltin<"V2fV2fV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pfmul: TargetBuiltin<"V2fV2fV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pfrcp: TargetBuiltin<"V2fV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pfrcpit1: TargetBuiltin<"V2fV2fV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pfrcpit2: TargetBuiltin<"V2fV2fV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pfrsqrt: TargetBuiltin<"V2fV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pfrsqit1: TargetBuiltin<"V2fV2fV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pfsub: TargetBuiltin<"V2fV2fV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pfsubr: TargetBuiltin<"V2fV2fV2f", "ncV:64:", "3dnow">;
def __builtin_ia32_pi2fd: TargetBuiltin<"V2fV2i", "ncV:64:", "3dnow">;
def __builtin_ia32_pmulhrw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "3dnow">;
// 3DNow! Extensions (3dnowa).
def __builtin_ia32_pf2iw: TargetBuiltin<"V2iV2f", "ncV:64:", "3dnowa">;
def __builtin_ia32_pfnacc: TargetBuiltin<"V2fV2fV2f", "ncV:64:", "3dnowa">;
def __builtin_ia32_pfpnacc: TargetBuiltin<"V2fV2fV2f", "ncV:64:", "3dnowa">;
def __builtin_ia32_pi2fw: TargetBuiltin<"V2fV2i", "ncV:64:", "3dnowa">;
def __builtin_ia32_pswapdsf: TargetBuiltin<"V2fV2f", "ncV:64:", "3dnowa">;
def __builtin_ia32_pswapdsi: TargetBuiltin<"V2iV2i", "ncV:64:", "3dnowa">;

// MMX
//
// All MMX instructions will be generated via builtins. Any MMX vector
// types (<1 x i64>, <2 x i32>, etc.) that aren't used by these builtins will be
// expanded by the back-end.
// FIXME: _mm_prefetch must be a built-in because it takes a compile-time constant
// argument and our prior approach of using a #define to the current built-in
// doesn't work in the presence of re-declaration of _mm_prefetch for windows.
def _mm_prefetch: TargetBuiltin<"vcC*i", "nc", "mmx">;
def __builtin_ia32_emms: TargetBuiltin<"v", "n", "mmx">;
def __builtin_ia32_paddb: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx">;
def __builtin_ia32_paddw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx">;
def __builtin_ia32_paddd: TargetBuiltin<"V2iV2iV2i", "ncV:64:", "mmx">;
def __builtin_ia32_paddsb: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx">;
def __builtin_ia32_paddsw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx">;
def __builtin_ia32_paddusb: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx">;
def __builtin_ia32_paddusw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx">;
def __builtin_ia32_psubb: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx">;
def __builtin_ia32_psubw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx">;
def __builtin_ia32_psubd: TargetBuiltin<"V2iV2iV2i", "ncV:64:", "mmx">;
def __builtin_ia32_psubsb: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx">;
def __builtin_ia32_psubsw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx">;
def __builtin_ia32_psubusb: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx">;
def __builtin_ia32_psubusw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx">;
def __builtin_ia32_pmulhw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx">;
def __builtin_ia32_pmullw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx">;
def __builtin_ia32_pmaddwd: TargetBuiltin<"V2iV4sV4s", "ncV:64:", "mmx">;
def __builtin_ia32_pand: TargetBuiltin<"V1OiV1OiV1Oi", "ncV:64:", "mmx">;
def __builtin_ia32_pandn: TargetBuiltin<"V1OiV1OiV1Oi", "ncV:64:", "mmx">;
def __builtin_ia32_por: TargetBuiltin<"V1OiV1OiV1Oi", "ncV:64:", "mmx">;
def __builtin_ia32_pxor: TargetBuiltin<"V1OiV1OiV1Oi", "ncV:64:", "mmx">;
def __builtin_ia32_psllw: TargetBuiltin<"V4sV4sV1Oi", "ncV:64:", "mmx">;
def __builtin_ia32_pslld: TargetBuiltin<"V2iV2iV1Oi", "ncV:64:", "mmx">;
def __builtin_ia32_psllq: TargetBuiltin<"V1OiV1OiV1Oi", "ncV:64:", "mmx">;
def __builtin_ia32_psrlw: TargetBuiltin<"V4sV4sV1Oi", "ncV:64:", "mmx">;
def __builtin_ia32_psrld: TargetBuiltin<"V2iV2iV1Oi", "ncV:64:", "mmx">;
def __builtin_ia32_psrlq: TargetBuiltin<"V1OiV1OiV1Oi", "ncV:64:", "mmx">;
def __builtin_ia32_psraw: TargetBuiltin<"V4sV4sV1Oi", "ncV:64:", "mmx">;
def __builtin_ia32_psrad: TargetBuiltin<"V2iV2iV1Oi", "ncV:64:", "mmx">;
def __builtin_ia32_psllwi: TargetBuiltin<"V4sV4si", "ncV:64:", "mmx">;
def __builtin_ia32_pslldi: TargetBuiltin<"V2iV2ii", "ncV:64:", "mmx">;
def __builtin_ia32_psllqi: TargetBuiltin<"V1OiV1Oii", "ncV:64:", "mmx">;
def __builtin_ia32_psrlwi: TargetBuiltin<"V4sV4si", "ncV:64:", "mmx">;
def __builtin_ia32_psrldi: TargetBuiltin<"V2iV2ii", "ncV:64:", "mmx">;
def __builtin_ia32_psrlqi: TargetBuiltin<"V1OiV1Oii", "ncV:64:", "mmx">;
def __builtin_ia32_psrawi: TargetBuiltin<"V4sV4si", "ncV:64:", "mmx">;
def __builtin_ia32_psradi: TargetBuiltin<"V2iV2ii", "ncV:64:", "mmx">;
def __builtin_ia32_packsswb: TargetBuiltin<"V8cV4sV4s", "ncV:64:", "mmx">;
def __builtin_ia32_packssdw: TargetBuiltin<"V4sV2iV2i", "ncV:64:", "mmx">;
def __builtin_ia32_packuswb: TargetBuiltin<"V8cV4sV4s", "ncV:64:", "mmx">;
def __builtin_ia32_punpckhbw: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx">;
def __builtin_ia32_punpckhwd: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx">;
def __builtin_ia32_punpckhdq: TargetBuiltin<"V2iV2iV2i", "ncV:64:", "mmx">;
def __builtin_ia32_punpcklbw: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx">;
def __builtin_ia32_punpcklwd: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx">;
def __builtin_ia32_punpckldq: TargetBuiltin<"V2iV2iV2i", "ncV:64:", "mmx">;
def __builtin_ia32_pcmpeqb: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx">;
def __builtin_ia32_pcmpeqw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx">;
def __builtin_ia32_pcmpeqd: TargetBuiltin<"V2iV2iV2i", "ncV:64:", "mmx">;
def __builtin_ia32_pcmpgtb: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx">;
def __builtin_ia32_pcmpgtw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx">;
def __builtin_ia32_pcmpgtd: TargetBuiltin<"V2iV2iV2i", "ncV:64:", "mmx">;
def __builtin_ia32_maskmovq: TargetBuiltin<"vV8cV8cc*", "nV:64:", "mmx">;
def __builtin_ia32_movntq: TargetBuiltin<"vV1Oi*V1Oi", "nV:64:", "mmx">;
def __builtin_ia32_vec_init_v2si: TargetBuiltin<"V2iii", "ncV:64:", "mmx">;
def __builtin_ia32_vec_init_v4hi: TargetBuiltin<"V4sssss", "ncV:64:", "mmx">;
def __builtin_ia32_vec_init_v8qi: TargetBuiltin<"V8ccccccccc", "ncV:64:", "mmx">;
def __builtin_ia32_vec_ext_v2si: TargetBuiltin<"iV2ii", "ncV:64:", "mmx">;

// MMX2 (MMX+SSE) intrinsics
def __builtin_ia32_cvtpi2ps: TargetBuiltin<"V4fV4fV2i", "ncV:64:", "mmx,sse">;
def __builtin_ia32_cvtps2pi: TargetBuiltin<"V2iV4f", "ncV:64:", "mmx,sse">;
def __builtin_ia32_cvttps2pi: TargetBuiltin<"V2iV4f", "ncV:64:", "mmx,sse">;
def __builtin_ia32_pavgb: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx,sse">;
def __builtin_ia32_pavgw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx,sse">;
def __builtin_ia32_pmaxsw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx,sse">;
def __builtin_ia32_pmaxub: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx,sse">;
def __builtin_ia32_pminsw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx,sse">;
def __builtin_ia32_pminub: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx,sse">;
def __builtin_ia32_pmovmskb: TargetBuiltin<"iV8c", "ncV:64:", "mmx,sse">;
def __builtin_ia32_pmulhuw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx,sse">;
def __builtin_ia32_psadbw: TargetBuiltin<"V4sV8cV8c", "ncV:64:", "mmx,sse">;
def __builtin_ia32_pshufw: TargetBuiltin<"V4sV4sIc", "ncV:64:", "mmx,sse">;
def __builtin_ia32_vec_ext_v4hi: TargetBuiltin<"iV4sIi", "ncV:64:", "mmx,sse">;
def __builtin_ia32_vec_set_v4hi: TargetBuiltin<"V4sV4siIi", "ncV:64:", "mmx,sse">;

// MMX+SSE2
def __builtin_ia32_cvtpd2pi: TargetBuiltin<"V2iV2d", "ncV:64:", "mmx,sse2">;
def __builtin_ia32_cvtpi2pd: TargetBuiltin<"V2dV2i", "ncV:64:", "mmx,sse2">;
def __builtin_ia32_cvttpd2pi: TargetBuiltin<"V2iV2d", "ncV:64:", "mmx,sse2">;
def __builtin_ia32_paddq: TargetBuiltin<"V1OiV1OiV1Oi", "ncV:64:", "mmx,sse2">;
def __builtin_ia32_pmuludq: TargetBuiltin<"V1OiV2iV2i", "ncV:64:", "mmx,sse2">;
def __builtin_ia32_psubq: TargetBuiltin<"V1OiV1OiV1Oi", "ncV:64:", "mmx,sse2">;

// MMX+SSSE3
def __builtin_ia32_pabsb: TargetBuiltin<"V8cV8c", "ncV:64:", "mmx,ssse3">;
def __builtin_ia32_pabsd: TargetBuiltin<"V2iV2i", "ncV:64:", "mmx,ssse3">;
def __builtin_ia32_pabsw: TargetBuiltin<"V4sV4s", "ncV:64:", "mmx,ssse3">;
def __builtin_ia32_palignr: TargetBuiltin<"V8cV8cV8cIc", "ncV:64:", "mmx,ssse3">;
def __builtin_ia32_phaddd: TargetBuiltin<"V2iV2iV2i", "ncV:64:", "mmx,ssse3">;
def __builtin_ia32_phaddsw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx,ssse3">;
def __builtin_ia32_phaddw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx,ssse3">;
def __builtin_ia32_phsubd: TargetBuiltin<"V2iV2iV2i", "ncV:64:", "mmx,ssse3">;
def __builtin_ia32_phsubsw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx,ssse3">;
def __builtin_ia32_phsubw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx,ssse3">;
def __builtin_ia32_pmaddubsw: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx,ssse3">;
def __builtin_ia32_pmulhrsw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx,ssse3">;
def __builtin_ia32_pshufb: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx,ssse3">;
def __builtin_ia32_psignw: TargetBuiltin<"V4sV4sV4s", "ncV:64:", "mmx,ssse3">;
def __builtin_ia32_psignb: TargetBuiltin<"V8cV8cV8c", "ncV:64:", "mmx,ssse3">;
def __builtin_ia32_psignd: TargetBuiltin<"V2iV2iV2i", "ncV:64:", "mmx,ssse3">;

// SSE intrinsics.
def __builtin_ia32_comieq: TargetBuiltin<"iV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_comilt: TargetBuiltin<"iV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_comile: TargetBuiltin<"iV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_comigt: TargetBuiltin<"iV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_comige: TargetBuiltin<"iV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_comineq: TargetBuiltin<"iV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_ucomieq: TargetBuiltin<"iV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_ucomilt: TargetBuiltin<"iV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_ucomile: TargetBuiltin<"iV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_ucomigt: TargetBuiltin<"iV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_ucomige: TargetBuiltin<"iV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_ucomineq: TargetBuiltin<"iV4fV4f", "ncV:128:", "sse">;

def __builtin_ia32_comisdeq: TargetBuiltin<"iV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_comisdlt: TargetBuiltin<"iV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_comisdle: TargetBuiltin<"iV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_comisdgt: TargetBuiltin<"iV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_comisdge: TargetBuiltin<"iV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_comisdneq: TargetBuiltin<"iV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_ucomisdeq: TargetBuiltin<"iV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_ucomisdlt: TargetBuiltin<"iV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_ucomisdle: TargetBuiltin<"iV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_ucomisdgt: TargetBuiltin<"iV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_ucomisdge: TargetBuiltin<"iV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_ucomisdneq: TargetBuiltin<"iV2dV2d", "ncV:128:", "sse2">;

def __builtin_ia32_cmpeqps: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_cmpltps: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_cmpleps: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_cmpunordps: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_cmpneqps: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_cmpnltps: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_cmpnleps: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_cmpordps: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_cmpeqss: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_cmpltss: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_cmpless: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_cmpunordss: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_cmpneqss: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_cmpnltss: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_cmpnless: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_cmpordss: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_minps: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_maxps: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_minss: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_maxss: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse">;

def __builtin_ia32_cmpeqpd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cmpltpd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cmplepd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cmpunordpd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cmpneqpd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cmpnltpd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cmpnlepd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cmpordpd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cmpeqsd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cmpltsd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cmplesd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cmpunordsd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cmpneqsd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cmpnltsd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cmpnlesd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cmpordsd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_minpd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_maxpd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_minsd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_maxsd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_paddsb128: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "sse2">;
def __builtin_ia32_paddsw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "sse2">;
def __builtin_ia32_psubsb128: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "sse2">;
def __builtin_ia32_psubsw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "sse2">;
def __builtin_ia32_paddusb128: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "sse2">;
def __builtin_ia32_paddusw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "sse2">;
def __builtin_ia32_psubusb128: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "sse2">;
def __builtin_ia32_psubusw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "sse2">;
def __builtin_ia32_pmulhw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "sse2">;
def __builtin_ia32_pavgb128: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "sse2">;
def __builtin_ia32_pavgw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "sse2">;
def __builtin_ia32_pmaxub128: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "sse2">;
def __builtin_ia32_pmaxsw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "sse2">;
def __builtin_ia32_pminub128: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "sse2">;
def __builtin_ia32_pminsw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "sse2">;
def __builtin_ia32_packsswb128: TargetBuiltin<"V16cV8sV8s", "ncV:128:", "sse2">;
def __builtin_ia32_packssdw128: TargetBuiltin<"V8sV4iV4i", "ncV:128:", "sse2">;
def __builtin_ia32_packuswb128: TargetBuiltin<"V16cV8sV8s", "ncV:128:", "sse2">;
def __builtin_ia32_pmulhuw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "sse2">;
def __builtin_ia32_vec_ext_v4si: TargetBuiltin<"iV4iIi", "ncV:128:", "sse2">;
def __builtin_ia32_vec_ext_v4sf: TargetBuiltin<"fV4fIi", "ncV:128:", "sse2">;
def __builtin_ia32_vec_ext_v8hi: TargetBuiltin<"sV8sIi", "ncV:128:", "sse2">;
def __builtin_ia32_vec_set_v8hi: TargetBuiltin<"V8sV8ssIi", "ncV:128:", "sse2">;

def __builtin_ia32_addsubps: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse3">;
def __builtin_ia32_addsubpd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse3">;
def __builtin_ia32_haddps: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse3">;
def __builtin_ia32_haddpd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse3">;
def __builtin_ia32_hsubps: TargetBuiltin<"V4fV4fV4f", "ncV:128:", "sse3">;
def __builtin_ia32_hsubpd: TargetBuiltin<"V2dV2dV2d", "ncV:128:", "sse3">;
def __builtin_ia32_phaddw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "ssse3">;
def __builtin_ia32_phaddd128: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "ssse3">;
def __builtin_ia32_phaddsw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "ssse3">;
def __builtin_ia32_phsubw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "ssse3">;
def __builtin_ia32_phsubd128: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "ssse3">;
def __builtin_ia32_phsubsw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "ssse3">;
def __builtin_ia32_pmaddubsw128: TargetBuiltin<"V8sV16cV16c", "ncV:128:", "ssse3">;
def __builtin_ia32_pmulhrsw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "ssse3">;
def __builtin_ia32_pshufb128: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "ssse3">;
def __builtin_ia32_psignb128: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "ssse3">;
def __builtin_ia32_psignw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "ssse3">;
def __builtin_ia32_psignd128: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "ssse3">;
def __builtin_ia32_pabsb128: TargetBuiltin<"V16cV16c", "ncV:128:", "ssse3">;
def __builtin_ia32_pabsw128: TargetBuiltin<"V8sV8s", "ncV:128:", "ssse3">;
def __builtin_ia32_pabsd128: TargetBuiltin<"V4iV4i", "ncV:128:", "ssse3">;

def __builtin_ia32_ldmxcsr: TargetBuiltin<"vUi", "n", "sse">;
def _mm_setcsr: TargetHeaderBuiltin<"vUi", "nh", "xmmintrin.h", AllLanguages, "sse">;
def __builtin_ia32_stmxcsr: TargetBuiltin<"Ui", "n", "sse">;
def _mm_getcsr: TargetHeaderBuiltin<"Ui", "nh", "xmmintrin.h", AllLanguages, "sse">;
def __builtin_ia32_cvtss2si: TargetBuiltin<"iV4f", "ncV:128:", "sse">;
def __builtin_ia32_cvttss2si: TargetBuiltin<"iV4f", "ncV:128:", "sse">;
def __builtin_ia32_movmskps: TargetBuiltin<"iV4f", "nV:128:", "sse">;
def __builtin_ia32_sfence: TargetBuiltin<"v", "n", "sse">;
def _mm_sfence: TargetHeaderBuiltin<"v", "nh", "xmmintrin.h", AllLanguages, "sse">;
def __builtin_ia32_rcpps: TargetBuiltin<"V4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_rcpss: TargetBuiltin<"V4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_rsqrtps: TargetBuiltin<"V4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_rsqrtss: TargetBuiltin<"V4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_sqrtps: TargetBuiltin<"V4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_sqrtss: TargetBuiltin<"V4fV4f", "ncV:128:", "sse">;
def __builtin_ia32_shufps: TargetBuiltin<"V4fV4fV4fIi", "ncV:128:", "sse">;

def __builtin_ia32_maskmovdqu: TargetBuiltin<"vV16cV16cc*", "nV:128:", "sse2">;
def __builtin_ia32_movmskpd: TargetBuiltin<"iV2d", "ncV:128:", "sse2">;
def __builtin_ia32_pmovmskb128: TargetBuiltin<"iV16c", "ncV:128:", "sse2">;
def __builtin_ia32_movnti: TargetBuiltin<"vi*i", "n", "sse2">;
def __builtin_ia32_pshufd: TargetBuiltin<"V4iV4iIi", "ncV:128:", "sse2">;
def __builtin_ia32_pshuflw: TargetBuiltin<"V8sV8sIi", "ncV:128:", "sse2">;
def __builtin_ia32_pshufhw: TargetBuiltin<"V8sV8sIi", "ncV:128:", "sse2">;
def __builtin_ia32_psadbw128: TargetBuiltin<"V2OiV16cV16c", "ncV:128:", "sse2">;
def __builtin_ia32_sqrtpd: TargetBuiltin<"V2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_sqrtsd: TargetBuiltin<"V2dV2d", "ncV:128:", "sse2">;
def __builtin_ia32_shufpd: TargetBuiltin<"V2dV2dV2dIi", "ncV:128:", "sse2">;
def __builtin_ia32_cvtpd2dq: TargetBuiltin<"V2OiV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cvtpd2ps: TargetBuiltin<"V4fV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cvttpd2dq: TargetBuiltin<"V4iV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cvtsd2si: TargetBuiltin<"iV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cvttsd2si: TargetBuiltin<"iV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cvtsd2ss: TargetBuiltin<"V4fV4fV2d", "ncV:128:", "sse2">;
def __builtin_ia32_cvtps2dq: TargetBuiltin<"V4iV4f", "ncV:128:", "sse2">;
def __builtin_ia32_cvttps2dq: TargetBuiltin<"V4iV4f", "ncV:128:", "sse2">;
def __builtin_ia32_clflush: TargetBuiltin<"vvC*", "n", "sse2">;
def _mm_clflush: TargetHeaderBuiltin<"vvC*", "nh", "emmintrin.h", AllLanguages, "sse2">;
def __builtin_ia32_lfence: TargetBuiltin<"v", "n", "sse2">;
def _mm_lfence: TargetHeaderBuiltin<"v", "nh", "emmintrin.h", AllLanguages, "sse2">;
def __builtin_ia32_mfence: TargetBuiltin<"v", "n", "sse2">;
def _mm_mfence: TargetHeaderBuiltin<"v", "nh", "emmintrin.h", AllLanguages, "sse2">;
def __builtin_ia32_pause: TargetBuiltin<"v", "n", "">;
def _mm_pause: TargetHeaderBuiltin<"v", "nh", "emmintrin.h", AllLanguages, "">;
def __builtin_ia32_pmuludq128: TargetBuiltin<"V2OiV4iV4i", "ncV:128:", "sse2">;
def __builtin_ia32_psraw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "sse2">;
def __builtin_ia32_psrad128: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "sse2">;
def __builtin_ia32_psrlw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "sse2">;
def __builtin_ia32_psrld128: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "sse2">;
def __builtin_ia32_psrlq128: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "sse2">;
def __builtin_ia32_psllw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "sse2">;
def __builtin_ia32_pslld128: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "sse2">;
def __builtin_ia32_psllq128: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "sse2">;
def __builtin_ia32_psllwi128: TargetBuiltin<"V8sV8si", "ncV:128:", "sse2">;
def __builtin_ia32_pslldi128: TargetBuiltin<"V4iV4ii", "ncV:128:", "sse2">;
def __builtin_ia32_psllqi128: TargetBuiltin<"V2OiV2Oii", "ncV:128:", "sse2">;
def __builtin_ia32_psrlwi128: TargetBuiltin<"V8sV8si", "ncV:128:", "sse2">;
def __builtin_ia32_psrldi128: TargetBuiltin<"V4iV4ii", "ncV:128:", "sse2">;
def __builtin_ia32_psrlqi128: TargetBuiltin<"V2OiV2Oii", "ncV:128:", "sse2">;
def __builtin_ia32_psrawi128: TargetBuiltin<"V8sV8si", "ncV:128:", "sse2">;
def __builtin_ia32_psradi128: TargetBuiltin<"V4iV4ii", "ncV:128:", "sse2">;
def __builtin_ia32_pmaddwd128: TargetBuiltin<"V4iV8sV8s", "ncV:128:", "sse2">;
def __builtin_ia32_pslldqi128_byteshift: TargetBuiltin<"V2OiV2OiIi", "ncV:128:", "sse2">;
def __builtin_ia32_psrldqi128_byteshift: TargetBuiltin<"V2OiV2OiIi", "ncV:128:", "sse2">;

def __builtin_ia32_monitor: TargetBuiltin<"vvC*UiUi", "n", "sse3">;
def __builtin_ia32_mwait: TargetBuiltin<"vUiUi", "n", "sse3">;
def __builtin_ia32_lddqu: TargetBuiltin<"V16ccC*", "nV:128:", "sse3">;

def __builtin_ia32_palignr128: TargetBuiltin<"V16cV16cV16cIi", "ncV:128:", "ssse3">;

def __builtin_ia32_insertps128: TargetBuiltin<"V4fV4fV4fIc", "ncV:128:", "sse4.1">;
def __builtin_ia32_pblendvb128: TargetBuiltin<"V16cV16cV16cV16c", "ncV:128:", "sse4.1">;
def __builtin_ia32_pblendw128: TargetBuiltin<"V8sV8sV8sIi", "ncV:128:", "sse4.1">;
def __builtin_ia32_blendpd: TargetBuiltin<"V2dV2dV2dIi", "ncV:128:", "sse4.1">;
def __builtin_ia32_blendps: TargetBuiltin<"V4fV4fV4fIi", "ncV:128:", "sse4.1">;
def __builtin_ia32_blendvpd: TargetBuiltin<"V2dV2dV2dV2d", "ncV:128:", "sse4.1">;
def __builtin_ia32_blendvps: TargetBuiltin<"V4fV4fV4fV4f", "ncV:128:", "sse4.1">;
def __builtin_ia32_packusdw128: TargetBuiltin<"V8sV4iV4i", "ncV:128:", "sse4.1">;

def __builtin_ia32_pmaxsb128: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "sse4.1">;
def __builtin_ia32_pmaxsd128: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "sse4.1">;
def __builtin_ia32_pmaxud128: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "sse4.1">;
def __builtin_ia32_pmaxuw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "sse4.1">;
def __builtin_ia32_pminsb128: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "sse4.1">;
def __builtin_ia32_pminsd128: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "sse4.1">;
def __builtin_ia32_pminud128: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "sse4.1">;
def __builtin_ia32_pminuw128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "sse4.1">;
def __builtin_ia32_pmuldq128: TargetBuiltin<"V2OiV4iV4i", "ncV:128:", "sse4.1">;
def __builtin_ia32_roundps: TargetBuiltin<"V4fV4fIi", "ncV:128:", "sse4.1">;
def __builtin_ia32_roundss: TargetBuiltin<"V4fV4fV4fIi", "ncV:128:", "sse4.1">;
def __builtin_ia32_roundsd: TargetBuiltin<"V2dV2dV2dIi", "ncV:128:", "sse4.1">;
def __builtin_ia32_roundpd: TargetBuiltin<"V2dV2dIi", "ncV:128:", "sse4.1">;
def __builtin_ia32_dpps: TargetBuiltin<"V4fV4fV4fIc", "ncV:128:", "sse4.1">;
def __builtin_ia32_dppd: TargetBuiltin<"V2dV2dV2dIc", "ncV:128:", "sse4.1">;
def __builtin_ia32_ptestz128: TargetBuiltin<"iV2OiV2Oi", "ncV:128:", "sse4.1">;
def __builtin_ia32_ptestc128: TargetBuiltin<"iV2OiV2Oi", "ncV:128:", "sse4.1">;
def __builtin_ia32_ptestnzc128: TargetBuiltin<"iV2OiV2Oi", "ncV:128:", "sse4.1">;
def __builtin_ia32_mpsadbw128: TargetBuiltin<"V16cV16cV16cIc", "ncV:128:", "sse4.1">;
def __builtin_ia32_phminposuw128: TargetBuiltin<"V8sV8s", "ncV:128:", "sse4.1">;
def __builtin_ia32_vec_ext_v16qi: TargetBuiltin<"cV16cIi", "ncV:128:", "sse4.1">;
def __builtin_ia32_vec_set_v16qi: TargetBuiltin<"V16cV16ccIi", "ncV:128:", "sse4.1">;
def __builtin_ia32_vec_set_v4si: TargetBuiltin<"V4iV4iiIi", "ncV:128:", "sse4.1">;

// SSE 4.2
def __builtin_ia32_pcmpistrm128: TargetBuiltin<"V16cV16cV16cIc", "ncV:128:", "sse4.2">;
def __builtin_ia32_pcmpistri128: TargetBuiltin<"iV16cV16cIc", "ncV:128:", "sse4.2">;
def __builtin_ia32_pcmpestrm128: TargetBuiltin<"V16cV16ciV16ciIc", "ncV:128:", "sse4.2">;
def __builtin_ia32_pcmpestri128: TargetBuiltin<"iV16ciV16ciIc", "ncV:128:", "sse4.2">;

def __builtin_ia32_pcmpistria128: TargetBuiltin<"iV16cV16cIc", "ncV:128:", "sse4.2">;
def __builtin_ia32_pcmpistric128: TargetBuiltin<"iV16cV16cIc", "ncV:128:", "sse4.2">;
def __builtin_ia32_pcmpistrio128: TargetBuiltin<"iV16cV16cIc", "ncV:128:", "sse4.2">;
def __builtin_ia32_pcmpistris128: TargetBuiltin<"iV16cV16cIc", "ncV:128:", "sse4.2">;
def __builtin_ia32_pcmpistriz128: TargetBuiltin<"iV16cV16cIc", "ncV:128:", "sse4.2">;
def __builtin_ia32_pcmpestria128: TargetBuiltin<"iV16ciV16ciIc", "ncV:128:", "sse4.2">;
def __builtin_ia32_pcmpestric128: TargetBuiltin<"iV16ciV16ciIc", "ncV:128:", "sse4.2">;
def __builtin_ia32_pcmpestrio128: TargetBuiltin<"iV16ciV16ciIc", "ncV:128:", "sse4.2">;
def __builtin_ia32_pcmpestris128: TargetBuiltin<"iV16ciV16ciIc", "ncV:128:", "sse4.2">;
def __builtin_ia32_pcmpestriz128: TargetBuiltin<"iV16ciV16ciIc", "ncV:128:", "sse4.2">;

def __builtin_ia32_crc32qi: TargetBuiltin<"UiUiUc", "nc", "sse4.2">;
def __builtin_ia32_crc32hi: TargetBuiltin<"UiUiUs", "nc", "sse4.2">;
def __builtin_ia32_crc32si: TargetBuiltin<"UiUiUi", "nc", "sse4.2">;

// SSE4a
def __builtin_ia32_extrqi: TargetBuiltin<"V2OiV2OiIcIc", "ncV:128:", "sse4a">;
def __builtin_ia32_extrq: TargetBuiltin<"V2OiV2OiV16c", "ncV:128:", "sse4a">;
def __builtin_ia32_insertqi: TargetBuiltin<"V2OiV2OiV2OiIcIc", "ncV:128:", "sse4a">;
def __builtin_ia32_insertq: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "sse4a">;
def __builtin_ia32_movntsd: TargetBuiltin<"vd*V2d", "nV:128:", "sse4a">;
def __builtin_ia32_movntss: TargetBuiltin<"vf*V4f", "nV:128:", "sse4a">;

// AES
def __builtin_ia32_aesenc128: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "aes">;
def __builtin_ia32_aesenclast128: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "aes">;
def __builtin_ia32_aesdec128: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "aes">;
def __builtin_ia32_aesdeclast128: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "aes">;
def __builtin_ia32_aesimc128: TargetBuiltin<"V2OiV2Oi", "ncV:128:", "aes">;
def __builtin_ia32_aeskeygenassist128: TargetBuiltin<"V2OiV2OiIc", "ncV:128:", "aes">;

// VAES
def __builtin_ia32_aesenc256: TargetBuiltin<"V4OiV4OiV4Oi", "ncV:256:", "vaes">;
def __builtin_ia32_aesenc512: TargetBuiltin<"V8OiV8OiV8Oi", "ncV:512:", "avx512f,vaes">;
def __builtin_ia32_aesenclast256: TargetBuiltin<"V4OiV4OiV4Oi", "ncV:256:", "vaes">;
def __builtin_ia32_aesenclast512: TargetBuiltin<"V8OiV8OiV8Oi", "ncV:512:", "avx512f,vaes">;
def __builtin_ia32_aesdec256: TargetBuiltin<"V4OiV4OiV4Oi", "ncV:256:", "vaes">;
def __builtin_ia32_aesdec512: TargetBuiltin<"V8OiV8OiV8Oi", "ncV:512:", "avx512f,vaes">;
def __builtin_ia32_aesdeclast256: TargetBuiltin<"V4OiV4OiV4Oi", "ncV:256:", "vaes">;
def __builtin_ia32_aesdeclast512: TargetBuiltin<"V8OiV8OiV8Oi", "ncV:512:", "avx512f,vaes">;

// GFNI
def __builtin_ia32_vgf2p8affineinvqb_v16qi: TargetBuiltin<"V16cV16cV16cIc", "ncV:128:", "gfni">;
def __builtin_ia32_vgf2p8affineinvqb_v32qi: TargetBuiltin<"V32cV32cV32cIc", "ncV:256:", "avx,gfni">;
def __builtin_ia32_vgf2p8affineinvqb_v64qi: TargetBuiltin<"V64cV64cV64cIc", "ncV:512:", "avx512bw,gfni">;
def __builtin_ia32_vgf2p8affineqb_v16qi: TargetBuiltin<"V16cV16cV16cIc", "ncV:128:", "gfni">;
def __builtin_ia32_vgf2p8affineqb_v32qi: TargetBuiltin<"V32cV32cV32cIc", "ncV:256:", "avx,gfni">;
def __builtin_ia32_vgf2p8affineqb_v64qi: TargetBuiltin<"V64cV64cV64cIc", "ncV:512:", "avx512bw,gfni">;
def __builtin_ia32_vgf2p8mulb_v16qi: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "gfni">;
def __builtin_ia32_vgf2p8mulb_v32qi: TargetBuiltin<"V32cV32cV32c", "ncV:256:", "avx,gfni">;
def __builtin_ia32_vgf2p8mulb_v64qi: TargetBuiltin<"V64cV64cV64c", "ncV:512:", "avx512bw,gfni">;

// CLMUL
def __builtin_ia32_pclmulqdq128: TargetBuiltin<"V2OiV2OiV2OiIc", "ncV:128:", "pclmul">;

// VPCLMULQDQ
def __builtin_ia32_pclmulqdq256: TargetBuiltin<"V4OiV4OiV4OiIc", "ncV:256:", "vpclmulqdq">;
def __builtin_ia32_pclmulqdq512: TargetBuiltin<"V8OiV8OiV8OiIc", "ncV:512:", "avx512f,vpclmulqdq">;

// AVX
def __builtin_ia32_addsubpd256: TargetBuiltin<"V4dV4dV4d", "ncV:256:", "avx">;
def __builtin_ia32_addsubps256: TargetBuiltin<"V8fV8fV8f", "ncV:256:", "avx">;
def __builtin_ia32_haddpd256: TargetBuiltin<"V4dV4dV4d", "ncV:256:", "avx">;
def __builtin_ia32_hsubps256: TargetBuiltin<"V8fV8fV8f", "ncV:256:", "avx">;
def __builtin_ia32_hsubpd256: TargetBuiltin<"V4dV4dV4d", "ncV:256:", "avx">;
def __builtin_ia32_haddps256: TargetBuiltin<"V8fV8fV8f", "ncV:256:", "avx">;
def __builtin_ia32_maxpd256: TargetBuiltin<"V4dV4dV4d", "ncV:256:", "avx">;
def __builtin_ia32_maxps256: TargetBuiltin<"V8fV8fV8f", "ncV:256:", "avx">;
def __builtin_ia32_minpd256: TargetBuiltin<"V4dV4dV4d", "ncV:256:", "avx">;
def __builtin_ia32_minps256: TargetBuiltin<"V8fV8fV8f", "ncV:256:", "avx">;
def __builtin_ia32_vpermilvarpd: TargetBuiltin<"V2dV2dV2Oi", "ncV:256:", "avx">;
def __builtin_ia32_vpermilvarps: TargetBuiltin<"V4fV4fV4i", "ncV:256:", "avx">;
def __builtin_ia32_vpermilvarpd256: TargetBuiltin<"V4dV4dV4Oi", "ncV:256:", "avx">;
def __builtin_ia32_vpermilvarps256: TargetBuiltin<"V8fV8fV8i", "ncV:256:", "avx">;
def __builtin_ia32_blendpd256: TargetBuiltin<"V4dV4dV4dIi", "ncV:256:", "avx">;
def __builtin_ia32_blendps256: TargetBuiltin<"V8fV8fV8fIi", "ncV:256:", "avx">;
def __builtin_ia32_blendvpd256: TargetBuiltin<"V4dV4dV4dV4d", "ncV:256:", "avx">;
def __builtin_ia32_blendvps256: TargetBuiltin<"V8fV8fV8fV8f", "ncV:256:", "avx">;
def __builtin_ia32_shufpd256: TargetBuiltin<"V4dV4dV4dIi", "ncV:256:", "avx">;
def __builtin_ia32_shufps256: TargetBuiltin<"V8fV8fV8fIi", "ncV:256:", "avx">;
def __builtin_ia32_dpps256: TargetBuiltin<"V8fV8fV8fIc", "ncV:256:", "avx">;
def __builtin_ia32_cmppd: TargetBuiltin<"V2dV2dV2dIc", "ncV:128:", "avx">;
def __builtin_ia32_cmppd256: TargetBuiltin<"V4dV4dV4dIc", "ncV:256:", "avx">;
def __builtin_ia32_cmpps: TargetBuiltin<"V4fV4fV4fIc", "ncV:128:", "avx">;
def __builtin_ia32_cmpps256: TargetBuiltin<"V8fV8fV8fIc", "ncV:256:", "avx">;
def __builtin_ia32_cmpsd: TargetBuiltin<"V2dV2dV2dIc", "ncV:128:", "avx">;
def __builtin_ia32_cmpss: TargetBuiltin<"V4fV4fV4fIc", "ncV:128:", "avx">;
def __builtin_ia32_vextractf128_pd256: TargetBuiltin<"V2dV4dIi", "ncV:256:", "avx">;
def __builtin_ia32_vextractf128_ps256: TargetBuiltin<"V4fV8fIi", "ncV:256:", "avx">;
def __builtin_ia32_vextractf128_si256: TargetBuiltin<"V4iV8iIi", "ncV:256:", "avx">;
def __builtin_ia32_cvtpd2ps256: TargetBuiltin<"V4fV4d", "ncV:256:", "avx">;
def __builtin_ia32_cvtps2dq256: TargetBuiltin<"V8iV8f", "ncV:256:", "avx">;
def __builtin_ia32_cvttpd2dq256: TargetBuiltin<"V4iV4d", "ncV:256:", "avx">;
def __builtin_ia32_cvtpd2dq256: TargetBuiltin<"V4iV4d", "ncV:256:", "avx">;
def __builtin_ia32_cvttps2dq256: TargetBuiltin<"V8iV8f", "ncV:256:", "avx">;
def __builtin_ia32_vperm2f128_pd256: TargetBuiltin<"V4dV4dV4dIi", "ncV:256:", "avx">;
def __builtin_ia32_vperm2f128_ps256: TargetBuiltin<"V8fV8fV8fIi", "ncV:256:", "avx">;
def __builtin_ia32_vperm2f128_si256: TargetBuiltin<"V8iV8iV8iIi", "ncV:256:", "avx">;
def __builtin_ia32_vpermilpd: TargetBuiltin<"V2dV2dIi", "ncV:128:", "avx">;
def __builtin_ia32_vpermilps: TargetBuiltin<"V4fV4fIi", "ncV:128:", "avx">;
def __builtin_ia32_vpermilpd256: TargetBuiltin<"V4dV4dIi", "ncV:256:", "avx">;
def __builtin_ia32_vpermilps256: TargetBuiltin<"V8fV8fIi", "ncV:256:", "avx">;
def __builtin_ia32_vinsertf128_pd256: TargetBuiltin<"V4dV4dV2dIi", "ncV:256:", "avx">;
def __builtin_ia32_vinsertf128_ps256: TargetBuiltin<"V8fV8fV4fIi", "ncV:256:", "avx">;
def __builtin_ia32_vinsertf128_si256: TargetBuiltin<"V8iV8iV4iIi", "ncV:256:", "avx">;
def __builtin_ia32_sqrtpd256: TargetBuiltin<"V4dV4d", "ncV:256:", "avx">;
def __builtin_ia32_sqrtps256: TargetBuiltin<"V8fV8f", "ncV:256:", "avx">;
def __builtin_ia32_rsqrtps256: TargetBuiltin<"V8fV8f", "ncV:256:", "avx">;
def __builtin_ia32_rcpps256: TargetBuiltin<"V8fV8f", "ncV:256:", "avx">;
def __builtin_ia32_roundpd256: TargetBuiltin<"V4dV4dIi", "ncV:256:", "avx">;
def __builtin_ia32_roundps256: TargetBuiltin<"V8fV8fIi", "ncV:256:", "avx">;
def __builtin_ia32_vtestzpd: TargetBuiltin<"iV2dV2d", "ncV:128:", "avx">;
def __builtin_ia32_vtestcpd: TargetBuiltin<"iV2dV2d", "ncV:128:", "avx">;
def __builtin_ia32_vtestnzcpd: TargetBuiltin<"iV2dV2d", "ncV:128:", "avx">;
def __builtin_ia32_vtestzps: TargetBuiltin<"iV4fV4f", "ncV:128:", "avx">;
def __builtin_ia32_vtestcps: TargetBuiltin<"iV4fV4f", "ncV:128:", "avx">;
def __builtin_ia32_vtestnzcps: TargetBuiltin<"iV4fV4f", "ncV:128:", "avx">;
def __builtin_ia32_vtestzpd256: TargetBuiltin<"iV4dV4d", "ncV:256:", "avx">;
def __builtin_ia32_vtestcpd256: TargetBuiltin<"iV4dV4d", "ncV:256:", "avx">;
def __builtin_ia32_vtestnzcpd256: TargetBuiltin<"iV4dV4d", "ncV:256:", "avx">;
def __builtin_ia32_vtestzps256: TargetBuiltin<"iV8fV8f", "ncV:256:", "avx">;
def __builtin_ia32_vtestcps256: TargetBuiltin<"iV8fV8f", "ncV:256:", "avx">;
def __builtin_ia32_vtestnzcps256: TargetBuiltin<"iV8fV8f", "ncV:256:", "avx">;
def __builtin_ia32_ptestz256: TargetBuiltin<"iV4OiV4Oi", "ncV:256:", "avx">;
def __builtin_ia32_ptestc256: TargetBuiltin<"iV4OiV4Oi", "ncV:256:", "avx">;
def __builtin_ia32_ptestnzc256: TargetBuiltin<"iV4OiV4Oi", "ncV:256:", "avx">;
def __builtin_ia32_movmskpd256: TargetBuiltin<"iV4d", "ncV:256:", "avx">;
def __builtin_ia32_movmskps256: TargetBuiltin<"iV8f", "ncV:256:", "avx">;
def __builtin_ia32_vzeroall: TargetBuiltin<"v", "n", "avx">;
def __builtin_ia32_vzeroupper: TargetBuiltin<"v", "n", "avx">;
def __builtin_ia32_lddqu256: TargetBuiltin<"V32ccC*", "nV:256:", "avx">;
def __builtin_ia32_maskloadpd: TargetBuiltin<"V2dV2dC*V2Oi", "nV:128:", "avx">;
def __builtin_ia32_maskloadps: TargetBuiltin<"V4fV4fC*V4i", "nV:128:", "avx">;
def __builtin_ia32_maskloadpd256: TargetBuiltin<"V4dV4dC*V4Oi", "nV:256:", "avx">;
def __builtin_ia32_maskloadps256: TargetBuiltin<"V8fV8fC*V8i", "nV:256:", "avx">;
def __builtin_ia32_maskstorepd: TargetBuiltin<"vV2d*V2OiV2d", "nV:128:", "avx">;
def __builtin_ia32_maskstoreps: TargetBuiltin<"vV4f*V4iV4f", "nV:128:", "avx">;
def __builtin_ia32_maskstorepd256: TargetBuiltin<"vV4d*V4OiV4d", "nV:256:", "avx">;
def __builtin_ia32_maskstoreps256: TargetBuiltin<"vV8f*V8iV8f", "nV:256:", "avx">;
def __builtin_ia32_vec_ext_v32qi: TargetBuiltin<"cV32cIi", "ncV:256:", "avx">;
def __builtin_ia32_vec_ext_v16hi: TargetBuiltin<"sV16sIi", "ncV:256:", "avx">;
def __builtin_ia32_vec_ext_v8si: TargetBuiltin<"iV8iIi", "ncV:256:", "avx">;
def __builtin_ia32_vec_set_v32qi: TargetBuiltin<"V32cV32ccIi", "ncV:256:", "avx">;
def __builtin_ia32_vec_set_v16hi: TargetBuiltin<"V16sV16ssIi", "ncV:256:", "avx">;
def __builtin_ia32_vec_set_v8si: TargetBuiltin<"V8iV8iiIi", "ncV:256:", "avx">;

// AVX2
def __builtin_ia32_mpsadbw256: TargetBuiltin<"V32cV32cV32cIc", "ncV:256:", "avx2">;
def __builtin_ia32_pabsb256: TargetBuiltin<"V32cV32c", "ncV:256:", "avx2">;
def __builtin_ia32_pabsw256: TargetBuiltin<"V16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_pabsd256: TargetBuiltin<"V8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_packsswb256: TargetBuiltin<"V32cV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_packssdw256: TargetBuiltin<"V16sV8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_packuswb256: TargetBuiltin<"V32cV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_packusdw256: TargetBuiltin<"V16sV8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_paddsb256: TargetBuiltin<"V32cV32cV32c", "ncV:256:", "avx2">;
def __builtin_ia32_paddsw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_psubsb256: TargetBuiltin<"V32cV32cV32c", "ncV:256:", "avx2">;
def __builtin_ia32_psubsw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_paddusb256: TargetBuiltin<"V32cV32cV32c", "ncV:256:", "avx2">;
def __builtin_ia32_paddusw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_psubusb256: TargetBuiltin<"V32cV32cV32c", "ncV:256:", "avx2">;
def __builtin_ia32_psubusw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_palignr256: TargetBuiltin<"V32cV32cV32cIi", "ncV:256:", "avx2">;
def __builtin_ia32_pavgb256: TargetBuiltin<"V32cV32cV32c", "ncV:256:", "avx2">;
def __builtin_ia32_pavgw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_pblendvb256: TargetBuiltin<"V32cV32cV32cV32c", "ncV:256:", "avx2">;
def __builtin_ia32_pblendw256: TargetBuiltin<"V16sV16sV16sIi", "ncV:256:", "avx2">;
def __builtin_ia32_phaddw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_phaddd256: TargetBuiltin<"V8iV8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_phaddsw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_phsubw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_phsubd256: TargetBuiltin<"V8iV8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_phsubsw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_pmaddubsw256: TargetBuiltin<"V16sV32cV32c", "ncV:256:", "avx2">;
def __builtin_ia32_pmaddwd256: TargetBuiltin<"V8iV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_pmaxub256: TargetBuiltin<"V32cV32cV32c", "ncV:256:", "avx2">;
def __builtin_ia32_pmaxuw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_pmaxud256: TargetBuiltin<"V8iV8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_pmaxsb256: TargetBuiltin<"V32cV32cV32c", "ncV:256:", "avx2">;
def __builtin_ia32_pmaxsw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_pmaxsd256: TargetBuiltin<"V8iV8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_pminub256: TargetBuiltin<"V32cV32cV32c", "ncV:256:", "avx2">;
def __builtin_ia32_pminuw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_pminud256: TargetBuiltin<"V8iV8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_pminsb256: TargetBuiltin<"V32cV32cV32c", "ncV:256:", "avx2">;
def __builtin_ia32_pminsw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_pminsd256: TargetBuiltin<"V8iV8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_pmovmskb256: TargetBuiltin<"iV32c", "ncV:256:", "avx2">;
def __builtin_ia32_pmuldq256: TargetBuiltin<"V4OiV8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_pmulhrsw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_pmulhuw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_pmulhw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_pmuludq256: TargetBuiltin<"V4OiV8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_psadbw256: TargetBuiltin<"V4OiV32cV32c", "ncV:256:", "avx2">;
def __builtin_ia32_pshufb256: TargetBuiltin<"V32cV32cV32c", "ncV:256:", "avx2">;
def __builtin_ia32_pshufd256: TargetBuiltin<"V8iV8iIi", "ncV:256:", "avx2">;
def __builtin_ia32_pshuflw256: TargetBuiltin<"V16sV16sIi", "ncV:256:", "avx2">;
def __builtin_ia32_pshufhw256: TargetBuiltin<"V16sV16sIi", "ncV:256:", "avx2">;
def __builtin_ia32_psignb256: TargetBuiltin<"V32cV32cV32c", "ncV:256:", "avx2">;
def __builtin_ia32_psignw256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx2">;
def __builtin_ia32_psignd256: TargetBuiltin<"V8iV8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_psllwi256: TargetBuiltin<"V16sV16si", "ncV:256:", "avx2">;
def __builtin_ia32_psllw256: TargetBuiltin<"V16sV16sV8s", "ncV:256:", "avx2">;
def __builtin_ia32_pslldqi256_byteshift: TargetBuiltin<"V4OiV4OiIi", "ncV:256:", "avx2">;
def __builtin_ia32_pslldi256: TargetBuiltin<"V8iV8ii", "ncV:256:", "avx2">;
def __builtin_ia32_pslld256: TargetBuiltin<"V8iV8iV4i", "ncV:256:", "avx2">;
def __builtin_ia32_psllqi256: TargetBuiltin<"V4OiV4Oii", "ncV:256:", "avx2">;
def __builtin_ia32_psllq256: TargetBuiltin<"V4OiV4OiV2Oi", "ncV:256:", "avx2">;
def __builtin_ia32_psrawi256: TargetBuiltin<"V16sV16si", "ncV:256:", "avx2">;
def __builtin_ia32_psraw256: TargetBuiltin<"V16sV16sV8s", "ncV:256:", "avx2">;
def __builtin_ia32_psradi256: TargetBuiltin<"V8iV8ii", "ncV:256:", "avx2">;
def __builtin_ia32_psrad256: TargetBuiltin<"V8iV8iV4i", "ncV:256:", "avx2">;
def __builtin_ia32_psrldqi256_byteshift: TargetBuiltin<"V4OiV4OiIi", "ncV:256:", "avx2">;
def __builtin_ia32_psrlwi256: TargetBuiltin<"V16sV16si", "ncV:256:", "avx2">;
def __builtin_ia32_psrlw256: TargetBuiltin<"V16sV16sV8s", "ncV:256:", "avx2">;
def __builtin_ia32_psrldi256: TargetBuiltin<"V8iV8ii", "ncV:256:", "avx2">;
def __builtin_ia32_psrld256: TargetBuiltin<"V8iV8iV4i", "ncV:256:", "avx2">;
def __builtin_ia32_psrlqi256: TargetBuiltin<"V4OiV4Oii", "ncV:256:", "avx2">;
def __builtin_ia32_psrlq256: TargetBuiltin<"V4OiV4OiV2Oi", "ncV:256:", "avx2">;
def __builtin_ia32_pblendd128: TargetBuiltin<"V4iV4iV4iIi", "ncV:256:", "avx2">;
def __builtin_ia32_pblendd256: TargetBuiltin<"V8iV8iV8iIi", "ncV:256:", "avx2">;
def __builtin_ia32_permvarsi256: TargetBuiltin<"V8iV8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_permdf256: TargetBuiltin<"V4dV4dIi", "ncV:256:", "avx2">;
def __builtin_ia32_permvarsf256: TargetBuiltin<"V8fV8fV8i", "ncV:256:", "avx2">;
def __builtin_ia32_permti256: TargetBuiltin<"V4OiV4OiV4OiIi", "ncV:256:", "avx2">;
def __builtin_ia32_permdi256: TargetBuiltin<"V4OiV4OiIi", "ncV:256:", "avx2">;
def __builtin_ia32_extract128i256: TargetBuiltin<"V2OiV4OiIi", "ncV:256:", "avx2">;
def __builtin_ia32_insert128i256: TargetBuiltin<"V4OiV4OiV2OiIi", "ncV:256:", "avx2">;
def __builtin_ia32_maskloadd256: TargetBuiltin<"V8iV8iC*V8i", "nV:256:", "avx2">;
def __builtin_ia32_maskloadq256: TargetBuiltin<"V4OiV4OiC*V4Oi", "nV:256:", "avx2">;
def __builtin_ia32_maskloadd: TargetBuiltin<"V4iV4iC*V4i", "nV:128:", "avx2">;
def __builtin_ia32_maskloadq: TargetBuiltin<"V2OiV2OiC*V2Oi", "nV:128:", "avx2">;
def __builtin_ia32_maskstored256: TargetBuiltin<"vV8i*V8iV8i", "nV:256:", "avx2">;
def __builtin_ia32_maskstoreq256: TargetBuiltin<"vV4Oi*V4OiV4Oi", "nV:256:", "avx2">;
def __builtin_ia32_maskstored: TargetBuiltin<"vV4i*V4iV4i", "nV:128:", "avx2">;
def __builtin_ia32_maskstoreq: TargetBuiltin<"vV2Oi*V2OiV2Oi", "nV:128:", "avx2">;
def __builtin_ia32_psllv8si: TargetBuiltin<"V8iV8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_psllv4si: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "avx2">;
def __builtin_ia32_psllv4di: TargetBuiltin<"V4OiV4OiV4Oi", "ncV:256:", "avx2">;
def __builtin_ia32_psllv2di: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "avx2">;
def __builtin_ia32_psrav8si: TargetBuiltin<"V8iV8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_psrav4si: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "avx2">;
def __builtin_ia32_psrlv8si: TargetBuiltin<"V8iV8iV8i", "ncV:256:", "avx2">;
def __builtin_ia32_psrlv4si: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "avx2">;
def __builtin_ia32_psrlv4di: TargetBuiltin<"V4OiV4OiV4Oi", "ncV:256:", "avx2">;
def __builtin_ia32_psrlv2di: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "avx2">;

// GATHER
def __builtin_ia32_gatherd_pd: TargetBuiltin<"V2dV2ddC*V4iV2dIc", "nV:128:", "avx2">;
def __builtin_ia32_gatherd_pd256: TargetBuiltin<"V4dV4ddC*V4iV4dIc", "nV:256:", "avx2">;
def __builtin_ia32_gatherq_pd: TargetBuiltin<"V2dV2ddC*V2OiV2dIc", "nV:128:", "avx2">;
def __builtin_ia32_gatherq_pd256: TargetBuiltin<"V4dV4ddC*V4OiV4dIc", "nV:256:", "avx2">;
def __builtin_ia32_gatherd_ps: TargetBuiltin<"V4fV4ffC*V4iV4fIc", "nV:128:", "avx2">;
def __builtin_ia32_gatherd_ps256: TargetBuiltin<"V8fV8ffC*V8iV8fIc", "nV:256:", "avx2">;
def __builtin_ia32_gatherq_ps: TargetBuiltin<"V4fV4ffC*V2OiV4fIc", "nV:128:", "avx2">;
def __builtin_ia32_gatherq_ps256: TargetBuiltin<"V4fV4ffC*V4OiV4fIc", "nV:256:", "avx2">;

def __builtin_ia32_gatherd_q: TargetBuiltin<"V2OiV2OiOiC*V4iV2OiIc", "nV:128:", "avx2">;
def __builtin_ia32_gatherd_q256: TargetBuiltin<"V4OiV4OiOiC*V4iV4OiIc", "nV:256:", "avx2">;
def __builtin_ia32_gatherq_q: TargetBuiltin<"V2OiV2OiOiC*V2OiV2OiIc", "nV:128:", "avx2">;
def __builtin_ia32_gatherq_q256: TargetBuiltin<"V4OiV4OiOiC*V4OiV4OiIc", "nV:256:", "avx2">;
def __builtin_ia32_gatherd_d: TargetBuiltin<"V4iV4iiC*V4iV4iIc", "nV:128:", "avx2">;
def __builtin_ia32_gatherd_d256: TargetBuiltin<"V8iV8iiC*V8iV8iIc", "nV:256:", "avx2">;
def __builtin_ia32_gatherq_d: TargetBuiltin<"V4iV4iiC*V2OiV4iIc", "nV:128:", "avx2">;
def __builtin_ia32_gatherq_d256: TargetBuiltin<"V4iV4iiC*V4OiV4iIc", "nV:256:", "avx2">;

// F16C
def __builtin_ia32_vcvtps2ph: TargetBuiltin<"V8sV4fIi", "ncV:128:", "f16c">;
def __builtin_ia32_vcvtps2ph256: TargetBuiltin<"V8sV8fIi", "ncV:256:", "f16c">;
def __builtin_ia32_vcvtph2ps: TargetBuiltin<"V4fV8s", "ncV:128:", "f16c">;
def __builtin_ia32_vcvtph2ps256: TargetBuiltin<"V8fV8s", "ncV:256:", "f16c">;

// RDRAND
def __builtin_ia32_rdrand16_step: TargetBuiltin<"UiUs*", "n", "rdrnd">;
def __builtin_ia32_rdrand32_step: TargetBuiltin<"UiUi*", "n", "rdrnd">;

// FXSR
def __builtin_ia32_fxrstor: TargetBuiltin<"vv*", "n", "fxsr">;
def __builtin_ia32_fxsave: TargetBuiltin<"vv*", "n", "fxsr">;

// XSAVE
def __builtin_ia32_xsave: TargetBuiltin<"vv*UOi", "n", "xsave">;
def __builtin_ia32_xrstor: TargetBuiltin<"vv*UOi", "n", "xsave">;
def __builtin_ia32_xgetbv: TargetBuiltin<"UOiUi", "n", "xsave">;
def _xgetbv: TargetHeaderBuiltin<"UWiUi", "nh", "immintrin.h", AllMSLanguages, "">;
def __builtin_ia32_xsetbv: TargetBuiltin<"vUiUOi", "n", "xsave">;
def _xsetbv: TargetHeaderBuiltin<"vUiUWi", "nh", "immintrin.h", AllMSLanguages, "">;
def __builtin_ia32_xsaveopt: TargetBuiltin<"vv*UOi", "n", "xsaveopt">;
def __builtin_ia32_xrstors: TargetBuiltin<"vv*UOi", "n", "xsaves">;
def __builtin_ia32_xsavec: TargetBuiltin<"vv*UOi", "n", "xsavec">;
def __builtin_ia32_xsaves: TargetBuiltin<"vv*UOi", "n", "xsaves">;

// SHSTK
def __builtin_ia32_incsspd: TargetBuiltin<"vUi", "n", "shstk">;
def __builtin_ia32_rdsspd: TargetBuiltin<"UiUi", "n", "shstk">;
def __builtin_ia32_saveprevssp: TargetBuiltin<"v", "n", "shstk">;
def __builtin_ia32_rstorssp: TargetBuiltin<"vv*", "n", "shstk">;
def __builtin_ia32_wrssd: TargetBuiltin<"vUiv*", "n", "shstk">;
def __builtin_ia32_wrussd: TargetBuiltin<"vUiv*", "n", "shstk">;
def __builtin_ia32_setssbsy: TargetBuiltin<"v", "n", "shstk">;
def __builtin_ia32_clrssbsy: TargetBuiltin<"vv*", "n", "shstk">;

//CLFLUSHOPT
def __builtin_ia32_clflushopt: TargetBuiltin<"vvC*", "n", "clflushopt">;

//CLWB
def __builtin_ia32_clwb: TargetBuiltin<"vvC*", "n", "clwb">;

//WB[NO]INVD
def __builtin_ia32_wbinvd: TargetBuiltin<"v", "n", "">;
def __builtin_ia32_wbnoinvd: TargetBuiltin<"v", "n", "wbnoinvd">;

// ADX
def __builtin_ia32_addcarryx_u32: TargetBuiltin<"UcUcUiUiUi*", "n", "">;
def __builtin_ia32_subborrow_u32: TargetBuiltin<"UcUcUiUiUi*", "n", "">;

// RDSEED
def __builtin_ia32_rdseed16_step: TargetBuiltin<"UiUs*", "n", "rdseed">;
def __builtin_ia32_rdseed32_step: TargetBuiltin<"UiUi*", "n", "rdseed">;

// LZCNT
def __builtin_ia32_lzcnt_u16: TargetBuiltin<"UsUs", "nc", "lzcnt">;
def __builtin_ia32_lzcnt_u32: TargetBuiltin<"UiUi", "nc", "lzcnt">;

// BMI
def __builtin_ia32_bextr_u32: TargetBuiltin<"UiUiUi", "nc", "bmi">;
def __builtin_ia32_tzcnt_u16: TargetBuiltin<"UsUs", "nc", "">;
def __builtin_ia32_tzcnt_u32: TargetBuiltin<"UiUi", "nc", "">;

// BMI2
def __builtin_ia32_bzhi_si: TargetBuiltin<"UiUiUi", "nc", "bmi2">;
def __builtin_ia32_pdep_si: TargetBuiltin<"UiUiUi", "nc", "bmi2">;
def __builtin_ia32_pext_si: TargetBuiltin<"UiUiUi", "nc", "bmi2">;

// TBM
def __builtin_ia32_bextri_u32: TargetBuiltin<"UiUiIUi", "nc", "tbm">;

// LWP
def __builtin_ia32_llwpcb: TargetBuiltin<"vv*", "n", "lwp">;
def __builtin_ia32_slwpcb: TargetBuiltin<"v*", "n", "lwp">;
def __builtin_ia32_lwpins32: TargetBuiltin<"UcUiUiIUi", "n", "lwp">;
def __builtin_ia32_lwpval32: TargetBuiltin<"vUiUiIUi", "n", "lwp">;

// SHA
def __builtin_ia32_sha1rnds4: TargetBuiltin<"V4iV4iV4iIc", "ncV:128:", "sha">;
def __builtin_ia32_sha1nexte: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "sha">;
def __builtin_ia32_sha1msg1: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "sha">;
def __builtin_ia32_sha1msg2: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "sha">;
def __builtin_ia32_sha256rnds2: TargetBuiltin<"V4iV4iV4iV4i", "ncV:128:", "sha">;
def __builtin_ia32_sha256msg1: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "sha">;
def __builtin_ia32_sha256msg2: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "sha">;

// FMA
def __builtin_ia32_vfmaddps: TargetBuiltin<"V4fV4fV4fV4f", "ncV:128:", "fma|fma4">;
def __builtin_ia32_vfmaddpd: TargetBuiltin<"V2dV2dV2dV2d", "ncV:128:", "fma|fma4">;
def __builtin_ia32_vfmaddss3: TargetBuiltin<"V4fV4fV4fV4f", "ncV:128:", "fma">;
def __builtin_ia32_vfmaddsd3: TargetBuiltin<"V2dV2dV2dV2d", "ncV:128:", "fma">;
def __builtin_ia32_vfmaddss: TargetBuiltin<"V4fV4fV4fV4f", "ncV:128:", "fma4">;
def __builtin_ia32_vfmaddsd: TargetBuiltin<"V2dV2dV2dV2d", "ncV:128:", "fma4">;
def __builtin_ia32_vfmaddsubps: TargetBuiltin<"V4fV4fV4fV4f", "ncV:128:", "fma|fma4">;
def __builtin_ia32_vfmaddsubpd: TargetBuiltin<"V2dV2dV2dV2d", "ncV:128:", "fma|fma4">;
def __builtin_ia32_vfmaddps256: TargetBuiltin<"V8fV8fV8fV8f", "ncV:256:", "fma|fma4">;
def __builtin_ia32_vfmaddpd256: TargetBuiltin<"V4dV4dV4dV4d", "ncV:256:", "fma|fma4">;
def __builtin_ia32_vfmaddsubps256: TargetBuiltin<"V8fV8fV8fV8f", "ncV:256:", "fma|fma4">;
def __builtin_ia32_vfmaddsubpd256: TargetBuiltin<"V4dV4dV4dV4d", "ncV:256:", "fma|fma4">;

def __builtin_ia32_vfmaddpd512_mask: TargetBuiltin<"V8dV8dV8dV8dUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmaddpd512_maskz: TargetBuiltin<"V8dV8dV8dV8dUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmaddpd512_mask3: TargetBuiltin<"V8dV8dV8dV8dUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmsubpd512_mask3: TargetBuiltin<"V8dV8dV8dV8dUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmaddps512_mask: TargetBuiltin<"V16fV16fV16fV16fUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmaddps512_maskz: TargetBuiltin<"V16fV16fV16fV16fUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmaddps512_mask3: TargetBuiltin<"V16fV16fV16fV16fUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmsubps512_mask3: TargetBuiltin<"V16fV16fV16fV16fUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmaddsubpd512_mask: TargetBuiltin<"V8dV8dV8dV8dUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmaddsubpd512_maskz: TargetBuiltin<"V8dV8dV8dV8dUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmaddsubpd512_mask3: TargetBuiltin<"V8dV8dV8dV8dUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmsubaddpd512_mask3: TargetBuiltin<"V8dV8dV8dV8dUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmaddsubps512_mask: TargetBuiltin<"V16fV16fV16fV16fUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmaddsubps512_maskz: TargetBuiltin<"V16fV16fV16fV16fUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmaddsubps512_mask3: TargetBuiltin<"V16fV16fV16fV16fUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmsubaddps512_mask3: TargetBuiltin<"V16fV16fV16fV16fUsIi", "ncV:512:", "avx512f">;

// XOP
def __builtin_ia32_vpmacssww: TargetBuiltin<"V8sV8sV8sV8s", "ncV:128:", "xop">;
def __builtin_ia32_vpmacsww: TargetBuiltin<"V8sV8sV8sV8s", "ncV:128:", "xop">;
def __builtin_ia32_vpmacsswd: TargetBuiltin<"V4iV8sV8sV4i", "ncV:128:", "xop">;
def __builtin_ia32_vpmacswd: TargetBuiltin<"V4iV8sV8sV4i", "ncV:128:", "xop">;
def __builtin_ia32_vpmacssdd: TargetBuiltin<"V4iV4iV4iV4i", "ncV:128:", "xop">;
def __builtin_ia32_vpmacsdd: TargetBuiltin<"V4iV4iV4iV4i", "ncV:128:", "xop">;
def __builtin_ia32_vpmacssdql: TargetBuiltin<"V2OiV4iV4iV2Oi", "ncV:128:", "xop">;
def __builtin_ia32_vpmacsdql: TargetBuiltin<"V2OiV4iV4iV2Oi", "ncV:128:", "xop">;
def __builtin_ia32_vpmacssdqh: TargetBuiltin<"V2OiV4iV4iV2Oi", "ncV:128:", "xop">;
def __builtin_ia32_vpmacsdqh: TargetBuiltin<"V2OiV4iV4iV2Oi", "ncV:128:", "xop">;
def __builtin_ia32_vpmadcsswd: TargetBuiltin<"V4iV8sV8sV4i", "ncV:128:", "xop">;
def __builtin_ia32_vpmadcswd: TargetBuiltin<"V4iV8sV8sV4i", "ncV:128:", "xop">;

def __builtin_ia32_vphaddbw: TargetBuiltin<"V8sV16c", "ncV:128:", "xop">;
def __builtin_ia32_vphaddbd: TargetBuiltin<"V4iV16c", "ncV:128:", "xop">;
def __builtin_ia32_vphaddbq: TargetBuiltin<"V2OiV16c", "ncV:128:", "xop">;
def __builtin_ia32_vphaddwd: TargetBuiltin<"V4iV8s", "ncV:128:", "xop">;
def __builtin_ia32_vphaddwq: TargetBuiltin<"V2OiV8s", "ncV:128:", "xop">;
def __builtin_ia32_vphadddq: TargetBuiltin<"V2OiV4i", "ncV:128:", "xop">;
def __builtin_ia32_vphaddubw: TargetBuiltin<"V8sV16c", "ncV:128:", "xop">;
def __builtin_ia32_vphaddubd: TargetBuiltin<"V4iV16c", "ncV:128:", "xop">;
def __builtin_ia32_vphaddubq: TargetBuiltin<"V2OiV16c", "ncV:128:", "xop">;
def __builtin_ia32_vphadduwd: TargetBuiltin<"V4iV8s", "ncV:128:", "xop">;
def __builtin_ia32_vphadduwq: TargetBuiltin<"V2OiV8s", "ncV:128:", "xop">;
def __builtin_ia32_vphaddudq: TargetBuiltin<"V2OiV4i", "ncV:128:", "xop">;
def __builtin_ia32_vphsubbw: TargetBuiltin<"V8sV16c", "ncV:128:", "xop">;
def __builtin_ia32_vphsubwd: TargetBuiltin<"V4iV8s", "ncV:128:", "xop">;
def __builtin_ia32_vphsubdq: TargetBuiltin<"V2OiV4i", "ncV:128:", "xop">;
def __builtin_ia32_vpperm: TargetBuiltin<"V16cV16cV16cV16c", "ncV:128:", "xop">;
def __builtin_ia32_vprotb: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "xop">;
def __builtin_ia32_vprotw: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "xop">;
def __builtin_ia32_vprotd: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "xop">;
def __builtin_ia32_vprotq: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "xop">;
def __builtin_ia32_vprotbi: TargetBuiltin<"V16cV16cIc", "ncV:128:", "xop">;
def __builtin_ia32_vprotwi: TargetBuiltin<"V8sV8sIc", "ncV:128:", "xop">;
def __builtin_ia32_vprotdi: TargetBuiltin<"V4iV4iIc", "ncV:128:", "xop">;
def __builtin_ia32_vprotqi: TargetBuiltin<"V2OiV2OiIc", "ncV:128:", "xop">;
def __builtin_ia32_vpshlb: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "xop">;
def __builtin_ia32_vpshlw: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "xop">;
def __builtin_ia32_vpshld: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "xop">;
def __builtin_ia32_vpshlq: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "xop">;
def __builtin_ia32_vpshab: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "xop">;
def __builtin_ia32_vpshaw: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "xop">;
def __builtin_ia32_vpshad: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "xop">;
def __builtin_ia32_vpshaq: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "xop">;
def __builtin_ia32_vpcomub: TargetBuiltin<"V16cV16cV16cIc", "ncV:128:", "xop">;
def __builtin_ia32_vpcomuw: TargetBuiltin<"V8sV8sV8sIc", "ncV:128:", "xop">;
def __builtin_ia32_vpcomud: TargetBuiltin<"V4iV4iV4iIc", "ncV:128:", "xop">;
def __builtin_ia32_vpcomuq: TargetBuiltin<"V2OiV2OiV2OiIc", "ncV:128:", "xop">;
def __builtin_ia32_vpcomb: TargetBuiltin<"V16cV16cV16cIc", "ncV:128:", "xop">;
def __builtin_ia32_vpcomw: TargetBuiltin<"V8sV8sV8sIc", "ncV:128:", "xop">;
def __builtin_ia32_vpcomd: TargetBuiltin<"V4iV4iV4iIc", "ncV:128:", "xop">;
def __builtin_ia32_vpcomq: TargetBuiltin<"V2OiV2OiV2OiIc", "ncV:128:", "xop">;
def __builtin_ia32_vpermil2pd: TargetBuiltin<"V2dV2dV2dV2OiIc", "ncV:128:", "xop">;
def __builtin_ia32_vpermil2pd256: TargetBuiltin<"V4dV4dV4dV4OiIc", "ncV:256:", "xop">;
def __builtin_ia32_vpermil2ps: TargetBuiltin<"V4fV4fV4fV4iIc", "ncV:128:", "xop">;
def __builtin_ia32_vpermil2ps256: TargetBuiltin<"V8fV8fV8fV8iIc", "ncV:256:", "xop">;
def __builtin_ia32_vfrczss: TargetBuiltin<"V4fV4f", "ncV:128:", "xop">;
def __builtin_ia32_vfrczsd: TargetBuiltin<"V2dV2d", "ncV:128:", "xop">;
def __builtin_ia32_vfrczps: TargetBuiltin<"V4fV4f", "ncV:128:", "xop">;
def __builtin_ia32_vfrczpd: TargetBuiltin<"V2dV2d", "ncV:128:", "xop">;
def __builtin_ia32_vfrczps256: TargetBuiltin<"V8fV8f", "ncV:256:", "xop">;
def __builtin_ia32_vfrczpd256: TargetBuiltin<"V4dV4d", "ncV:256:", "xop">;

def __builtin_ia32_xbegin: TargetBuiltin<"i", "n", "rtm">;
def __builtin_ia32_xend: TargetBuiltin<"v", "n", "rtm">;
def __builtin_ia32_xabort: TargetBuiltin<"vIc", "n", "rtm">;
def __builtin_ia32_xtest: TargetBuiltin<"i", "n", "rtm">;

def __builtin_ia32_rdpmc: Builtin<"UOii", "">;
def __builtin_ia32_rdtsc: Builtin<"UOi", "">;
def __rdtsc: Builtin<"UOi", "">;
def __builtin_ia32_rdtscp: Builtin<"UOiUi*", "">;

def __builtin_ia32_rdpid: TargetBuiltin<"Ui", "n", "rdpid">;

// PKU
def __builtin_ia32_rdpkru: TargetBuiltin<"Ui", "n", "pku">;
def __builtin_ia32_wrpkru: TargetBuiltin<"vUi", "n", "pku">;

// AVX-512
def __builtin_ia32_sqrtpd512: TargetBuiltin<"V8dV8dIi", "ncV:512:", "avx512f">;
def __builtin_ia32_sqrtps512: TargetBuiltin<"V16fV16fIi", "ncV:512:", "avx512f">;
def __builtin_ia32_rsqrt14sd_mask: TargetBuiltin<"V2dV2dV2dV2dUc", "ncV:128:", "avx512f">;
def __builtin_ia32_rsqrt14ss_mask: TargetBuiltin<"V4fV4fV4fV4fUc", "ncV:128:", "avx512f">;
def __builtin_ia32_rsqrt14pd512_mask: TargetBuiltin<"V8dV8dV8dUc", "ncV:512:", "avx512f">;
def __builtin_ia32_rsqrt14ps512_mask: TargetBuiltin<"V16fV16fV16fUs", "ncV:512:", "avx512f">;

def __builtin_ia32_rsqrt28sd_round_mask: TargetBuiltin<"V2dV2dV2dV2dUcIi", "ncV:128:", "avx512er">;
def __builtin_ia32_rsqrt28ss_round_mask: TargetBuiltin<"V4fV4fV4fV4fUcIi", "ncV:128:", "avx512er">;
def __builtin_ia32_rsqrt28pd_mask: TargetBuiltin<"V8dV8dV8dUcIi", "ncV:512:", "avx512er">;
def __builtin_ia32_rsqrt28ps_mask: TargetBuiltin<"V16fV16fV16fUsIi", "ncV:512:", "avx512er">;

def __builtin_ia32_rcp14sd_mask: TargetBuiltin<"V2dV2dV2dV2dUc", "ncV:128:", "avx512f">;
def __builtin_ia32_rcp14ss_mask: TargetBuiltin<"V4fV4fV4fV4fUc", "ncV:128:", "avx512f">;
def __builtin_ia32_rcp14pd512_mask: TargetBuiltin<"V8dV8dV8dUc", "ncV:512:", "avx512f">;
def __builtin_ia32_rcp14ps512_mask: TargetBuiltin<"V16fV16fV16fUs", "ncV:512:", "avx512f">;

def __builtin_ia32_rcp28sd_round_mask: TargetBuiltin<"V2dV2dV2dV2dUcIi", "ncV:128:", "avx512er">;
def __builtin_ia32_rcp28ss_round_mask: TargetBuiltin<"V4fV4fV4fV4fUcIi", "ncV:128:", "avx512er">;
def __builtin_ia32_rcp28pd_mask: TargetBuiltin<"V8dV8dV8dUcIi", "ncV:512:", "avx512er">;
def __builtin_ia32_rcp28ps_mask: TargetBuiltin<"V16fV16fV16fUsIi", "ncV:512:", "avx512er">;
def __builtin_ia32_exp2pd_mask: TargetBuiltin<"V8dV8dV8dUcIi", "ncV:512:", "avx512er">;
def __builtin_ia32_exp2ps_mask: TargetBuiltin<"V16fV16fV16fUsIi", "ncV:512:", "avx512er">;

def __builtin_ia32_cvttps2dq512_mask: TargetBuiltin<"V16iV16fV16iUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_cvttps2udq512_mask: TargetBuiltin<"V16iV16fV16iUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_cvttpd2dq512_mask: TargetBuiltin<"V8iV8dV8iUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_cvttpd2udq512_mask: TargetBuiltin<"V8iV8dV8iUcIi", "ncV:512:", "avx512f">;

def __builtin_ia32_cmpps512_mask: TargetBuiltin<"UsV16fV16fIiUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_cmpps256_mask: TargetBuiltin<"UcV8fV8fIiUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_cmpps128_mask: TargetBuiltin<"UcV4fV4fIiUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_cmppd512_mask: TargetBuiltin<"UcV8dV8dIiUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_cmppd256_mask: TargetBuiltin<"UcV4dV4dIiUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_cmppd128_mask: TargetBuiltin<"UcV2dV2dIiUc", "ncV:128:", "avx512vl">;

def __builtin_ia32_rndscaleps_mask: TargetBuiltin<"V16fV16fIiV16fUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_rndscalepd_mask: TargetBuiltin<"V8dV8dIiV8dUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_cvtps2dq512_mask: TargetBuiltin<"V16iV16fV16iUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_cvtpd2dq512_mask: TargetBuiltin<"V8iV8dV8iUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_cvtps2udq512_mask: TargetBuiltin<"V16iV16fV16iUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_cvtpd2udq512_mask: TargetBuiltin<"V8iV8dV8iUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_minps512: TargetBuiltin<"V16fV16fV16fIi", "ncV:512:", "avx512f">;
def __builtin_ia32_minpd512: TargetBuiltin<"V8dV8dV8dIi", "ncV:512:", "avx512f">;
def __builtin_ia32_maxps512: TargetBuiltin<"V16fV16fV16fIi", "ncV:512:", "avx512f">;
def __builtin_ia32_maxpd512: TargetBuiltin<"V8dV8dV8dIi", "ncV:512:", "avx512f">;
def __builtin_ia32_cvtdq2ps512_mask: TargetBuiltin<"V16fV16iV16fUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_cvtudq2ps512_mask: TargetBuiltin<"V16fV16iV16fUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_cvtpd2ps512_mask: TargetBuiltin<"V8fV8dV8fUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vcvtps2ph512_mask: TargetBuiltin<"V16sV16fIiV16sUs", "ncV:512:", "avx512f">;
def __builtin_ia32_vcvtph2ps512_mask: TargetBuiltin<"V16fV16sV16fUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_pabsd512: TargetBuiltin<"V16iV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_pabsq512: TargetBuiltin<"V8OiV8Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_pmaxsd512: TargetBuiltin<"V16iV16iV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_pmaxsq512: TargetBuiltin<"V8OiV8OiV8Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_pmaxud512: TargetBuiltin<"V16iV16iV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_pmaxuq512: TargetBuiltin<"V8OiV8OiV8Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_pminsd512: TargetBuiltin<"V16iV16iV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_pminsq512: TargetBuiltin<"V8OiV8OiV8Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_pminud512: TargetBuiltin<"V16iV16iV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_pminuq512: TargetBuiltin<"V8OiV8OiV8Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_pmuldq512: TargetBuiltin<"V8OiV16iV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_pmuludq512: TargetBuiltin<"V8OiV16iV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_loaddqusi512_mask: TargetBuiltin<"V16iiC*V16iUs", "nV:512:", "avx512f">;
def __builtin_ia32_loaddqudi512_mask: TargetBuiltin<"V8OiOiC*V8OiUc", "nV:512:", "avx512f">;
def __builtin_ia32_loadups512_mask: TargetBuiltin<"V16ffC*V16fUs", "nV:512:", "avx512f">;
def __builtin_ia32_loadaps512_mask: TargetBuiltin<"V16fV16fC*V16fUs", "nV:512:", "avx512f">;
def __builtin_ia32_loadupd512_mask: TargetBuiltin<"V8ddC*V8dUc", "nV:512:", "avx512f">;
def __builtin_ia32_loadapd512_mask: TargetBuiltin<"V8dV8dC*V8dUc", "nV:512:", "avx512f">;
def __builtin_ia32_storedqudi512_mask: TargetBuiltin<"vOi*V8OiUc", "nV:512:", "avx512f">;
def __builtin_ia32_storedqusi512_mask: TargetBuiltin<"vi*V16iUs", "nV:512:", "avx512f">;
def __builtin_ia32_storeupd512_mask: TargetBuiltin<"vd*V8dUc", "nV:512:", "avx512f">;
def __builtin_ia32_storeapd512_mask: TargetBuiltin<"vV8d*V8dUc", "nV:512:", "avx512f">;
def __builtin_ia32_storeups512_mask: TargetBuiltin<"vf*V16fUs", "nV:512:", "avx512f">;
def __builtin_ia32_storeaps512_mask: TargetBuiltin<"vV16f*V16fUs", "nV:512:", "avx512f">;
def __builtin_ia32_alignq512: TargetBuiltin<"V8OiV8OiV8OiIi", "ncV:512:", "avx512f">;
def __builtin_ia32_alignd512: TargetBuiltin<"V16iV16iV16iIi", "ncV:512:", "avx512f">;
def __builtin_ia32_alignd128: TargetBuiltin<"V4iV4iV4iIi", "ncV:128:", "avx512vl">;
def __builtin_ia32_alignd256: TargetBuiltin<"V8iV8iV8iIi", "ncV:256:", "avx512vl">;
def __builtin_ia32_alignq128: TargetBuiltin<"V2OiV2OiV2OiIi", "ncV:128:", "avx512vl">;
def __builtin_ia32_alignq256: TargetBuiltin<"V4OiV4OiV4OiIi", "ncV:256:", "avx512vl">;
def __builtin_ia32_extractf64x4_mask: TargetBuiltin<"V4dV8dIiV4dUc", "ncV:512:", "avx512f">;
def __builtin_ia32_extractf32x4_mask: TargetBuiltin<"V4fV16fIiV4fUc", "ncV:512:", "avx512f">;

def __builtin_ia32_vpdpbusd128: TargetBuiltin<"V4iV4iV4iV4i", "ncV:128:", "avx512vl,avx512vnni">;
def __builtin_ia32_vpdpbusd256: TargetBuiltin<"V8iV8iV8iV8i", "ncV:256:", "avx512vl,avx512vnni">;
def __builtin_ia32_vpdpbusd512: TargetBuiltin<"V16iV16iV16iV16i", "ncV:512:", "avx512vnni">;
def __builtin_ia32_vpdpbusds128: TargetBuiltin<"V4iV4iV4iV4i", "ncV:128:", "avx512vl,avx512vnni">;
def __builtin_ia32_vpdpbusds256: TargetBuiltin<"V8iV8iV8iV8i", "ncV:256:", "avx512vl,avx512vnni">;
def __builtin_ia32_vpdpbusds512: TargetBuiltin<"V16iV16iV16iV16i", "ncV:512:", "avx512vnni">;
def __builtin_ia32_vpdpwssd128: TargetBuiltin<"V4iV4iV4iV4i", "ncV:128:", "avx512vl,avx512vnni">;
def __builtin_ia32_vpdpwssd256: TargetBuiltin<"V8iV8iV8iV8i", "ncV:256:", "avx512vl,avx512vnni">;
def __builtin_ia32_vpdpwssd512: TargetBuiltin<"V16iV16iV16iV16i", "ncV:512:", "avx512vnni">;
def __builtin_ia32_vpdpwssds128: TargetBuiltin<"V4iV4iV4iV4i", "ncV:128:", "avx512vl,avx512vnni">;
def __builtin_ia32_vpdpwssds256: TargetBuiltin<"V8iV8iV8iV8i", "ncV:256:", "avx512vl,avx512vnni">;
def __builtin_ia32_vpdpwssds512: TargetBuiltin<"V16iV16iV16iV16i", "ncV:512:", "avx512vnni">;

def __builtin_ia32_gather3div2df: TargetBuiltin<"V2dV2dvC*V2OiUcIi", "nV:128:", "avx512vl">;
def __builtin_ia32_gather3div2di: TargetBuiltin<"V2OiV2OivC*V2OiUcIi", "nV:128:", "avx512vl">;
def __builtin_ia32_gather3div4df: TargetBuiltin<"V4dV4dvC*V4OiUcIi", "nV:256:", "avx512vl">;
def __builtin_ia32_gather3div4di: TargetBuiltin<"V4OiV4OivC*V4OiUcIi", "nV:256:", "avx512vl">;
def __builtin_ia32_gather3div4sf: TargetBuiltin<"V4fV4fvC*V2OiUcIi", "nV:128:", "avx512vl">;
def __builtin_ia32_gather3div4si: TargetBuiltin<"V4iV4ivC*V2OiUcIi", "nV:128:", "avx512vl">;
def __builtin_ia32_gather3div8sf: TargetBuiltin<"V4fV4fvC*V4OiUcIi", "nV:256:", "avx512vl">;
def __builtin_ia32_gather3div8si: TargetBuiltin<"V4iV4ivC*V4OiUcIi", "nV:256:", "avx512vl">;
def __builtin_ia32_gather3siv2df: TargetBuiltin<"V2dV2dvC*V4iUcIi", "nV:128:", "avx512vl">;
def __builtin_ia32_gather3siv2di: TargetBuiltin<"V2OiV2OivC*V4iUcIi", "nV:128:", "avx512vl">;
def __builtin_ia32_gather3siv4df: TargetBuiltin<"V4dV4dvC*V4iUcIi", "nV:256:", "avx512vl">;
def __builtin_ia32_gather3siv4di: TargetBuiltin<"V4OiV4OivC*V4iUcIi", "nV:256:", "avx512vl">;
def __builtin_ia32_gather3siv4sf: TargetBuiltin<"V4fV4fvC*V4iUcIi", "nV:128:", "avx512vl">;
def __builtin_ia32_gather3siv4si: TargetBuiltin<"V4iV4ivC*V4iUcIi", "nV:128:", "avx512vl">;
def __builtin_ia32_gather3siv8sf: TargetBuiltin<"V8fV8fvC*V8iUcIi", "nV:256:", "avx512vl">;
def __builtin_ia32_gather3siv8si: TargetBuiltin<"V8iV8ivC*V8iUcIi", "nV:256:", "avx512vl">;
def __builtin_ia32_gathersiv8df: TargetBuiltin<"V8dV8dvC*V8iUcIi", "nV:512:", "avx512f">;
def __builtin_ia32_gathersiv16sf: TargetBuiltin<"V16fV16fvC*V16iUsIi", "nV:512:", "avx512f">;
def __builtin_ia32_gatherdiv8df: TargetBuiltin<"V8dV8dvC*V8OiUcIi", "nV:512:", "avx512f">;
def __builtin_ia32_gatherdiv16sf: TargetBuiltin<"V8fV8fvC*V8OiUcIi", "nV:512:", "avx512f">;
def __builtin_ia32_gathersiv8di: TargetBuiltin<"V8OiV8OivC*V8iUcIi", "nV:512:", "avx512f">;
def __builtin_ia32_gathersiv16si: TargetBuiltin<"V16iV16ivC*V16iUsIi", "nV:512:", "avx512f">;
def __builtin_ia32_gatherdiv8di: TargetBuiltin<"V8OiV8OivC*V8OiUcIi", "nV:512:", "avx512f">;
def __builtin_ia32_gatherdiv16si: TargetBuiltin<"V8iV8ivC*V8OiUcIi", "nV:512:", "avx512f">;
def __builtin_ia32_scattersiv8df: TargetBuiltin<"vv*UcV8iV8dIi", "nV:512:", "avx512f">;
def __builtin_ia32_scattersiv16sf: TargetBuiltin<"vv*UsV16iV16fIi", "nV:512:", "avx512f">;
def __builtin_ia32_scatterdiv8df: TargetBuiltin<"vv*UcV8OiV8dIi", "nV:512:", "avx512f">;
def __builtin_ia32_scatterdiv16sf: TargetBuiltin<"vv*UcV8OiV8fIi", "nV:512:", "avx512f">;
def __builtin_ia32_scattersiv8di: TargetBuiltin<"vv*UcV8iV8OiIi", "nV:512:", "avx512f">;
def __builtin_ia32_scattersiv16si: TargetBuiltin<"vv*UsV16iV16iIi", "nV:512:", "avx512f">;
def __builtin_ia32_scatterdiv8di: TargetBuiltin<"vv*UcV8OiV8OiIi", "nV:512:", "avx512f">;
def __builtin_ia32_scatterdiv16si: TargetBuiltin<"vv*UcV8OiV8iIi", "nV:512:", "avx512f">;

def __builtin_ia32_gatherpfdpd: TargetBuiltin<"vUcV8ivC*IiIi", "nV:512:", "avx512pf">;
def __builtin_ia32_gatherpfdps: TargetBuiltin<"vUsV16ivC*IiIi", "nV:512:", "avx512pf">;
def __builtin_ia32_gatherpfqpd: TargetBuiltin<"vUcV8OivC*IiIi", "nV:512:", "avx512pf">;
def __builtin_ia32_gatherpfqps: TargetBuiltin<"vUcV8OivC*IiIi", "nV:512:", "avx512pf">;
def __builtin_ia32_scatterpfdpd: TargetBuiltin<"vUcV8iv*IiIi", "nV:512:", "avx512pf">;
def __builtin_ia32_scatterpfdps: TargetBuiltin<"vUsV16iv*IiIi", "nV:512:", "avx512pf">;
def __builtin_ia32_scatterpfqpd: TargetBuiltin<"vUcV8Oiv*IiIi", "nV:512:", "avx512pf">;
def __builtin_ia32_scatterpfqps: TargetBuiltin<"vUcV8Oiv*IiIi", "nV:512:", "avx512pf">;

def __builtin_ia32_knotqi: TargetBuiltin<"UcUc", "nc", "avx512dq">;
def __builtin_ia32_knothi: TargetBuiltin<"UsUs", "nc", "avx512f">;
def __builtin_ia32_knotsi: TargetBuiltin<"UiUi", "nc", "avx512bw">;
def __builtin_ia32_knotdi: TargetBuiltin<"UOiUOi", "nc", "avx512bw">;

def __builtin_ia32_cmpb128_mask: TargetBuiltin<"UsV16cV16cIiUs", "ncV:128:", "avx512vl,avx512bw">;
def __builtin_ia32_cmpd128_mask: TargetBuiltin<"UcV4iV4iIiUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_cmpq128_mask: TargetBuiltin<"UcV2OiV2OiIiUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_cmpw128_mask: TargetBuiltin<"UcV8sV8sIiUc", "ncV:128:", "avx512vl,avx512bw">;
def __builtin_ia32_cmpb256_mask: TargetBuiltin<"UiV32cV32cIiUi", "ncV:256:", "avx512vl,avx512bw">;
def __builtin_ia32_cmpd256_mask: TargetBuiltin<"UcV8iV8iIiUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_cmpq256_mask: TargetBuiltin<"UcV4OiV4OiIiUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_cmpw256_mask: TargetBuiltin<"UsV16sV16sIiUs", "ncV:256:", "avx512vl,avx512bw">;
def __builtin_ia32_cmpb512_mask: TargetBuiltin<"UOiV64cV64cIiUOi", "ncV:512:", "avx512bw">;
def __builtin_ia32_cmpd512_mask: TargetBuiltin<"UsV16iV16iIiUs", "ncV:512:", "avx512f">;
def __builtin_ia32_cmpq512_mask: TargetBuiltin<"UcV8OiV8OiIiUc", "ncV:512:", "avx512f">;
def __builtin_ia32_cmpw512_mask: TargetBuiltin<"UiV32sV32sIiUi", "ncV:512:", "avx512bw">;
def __builtin_ia32_ucmpb128_mask: TargetBuiltin<"UsV16cV16cIiUs", "ncV:128:", "avx512vl,avx512bw">;
def __builtin_ia32_ucmpd128_mask: TargetBuiltin<"UcV4iV4iIiUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_ucmpq128_mask: TargetBuiltin<"UcV2OiV2OiIiUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_ucmpw128_mask: TargetBuiltin<"UcV8sV8sIiUc", "ncV:128:", "avx512vl,avx512bw">;
def __builtin_ia32_ucmpb256_mask: TargetBuiltin<"UiV32cV32cIiUi", "ncV:256:", "avx512vl,avx512bw">;
def __builtin_ia32_ucmpd256_mask: TargetBuiltin<"UcV8iV8iIiUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_ucmpq256_mask: TargetBuiltin<"UcV4OiV4OiIiUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_ucmpw256_mask: TargetBuiltin<"UsV16sV16sIiUs", "ncV:256:", "avx512vl,avx512bw">;
def __builtin_ia32_ucmpb512_mask: TargetBuiltin<"UOiV64cV64cIiUOi", "ncV:512:", "avx512bw">;
def __builtin_ia32_ucmpd512_mask: TargetBuiltin<"UsV16iV16iIiUs", "ncV:512:", "avx512f">;
def __builtin_ia32_ucmpq512_mask: TargetBuiltin<"UcV8OiV8OiIiUc", "ncV:512:", "avx512f">;
def __builtin_ia32_ucmpw512_mask: TargetBuiltin<"UiV32sV32sIiUi", "ncV:512:", "avx512bw">;

def __builtin_ia32_pabsb512: TargetBuiltin<"V64cV64c", "ncV:512:", "avx512bw">;
def __builtin_ia32_pabsw512: TargetBuiltin<"V32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_packssdw512: TargetBuiltin<"V32sV16iV16i", "ncV:512:", "avx512bw">;
def __builtin_ia32_packsswb512: TargetBuiltin<"V64cV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_packusdw512: TargetBuiltin<"V32sV16iV16i", "ncV:512:", "avx512bw">;
def __builtin_ia32_packuswb512: TargetBuiltin<"V64cV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_paddsb512: TargetBuiltin<"V64cV64cV64c", "ncV:512:", "avx512bw">;
def __builtin_ia32_paddsw512: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_paddusb512: TargetBuiltin<"V64cV64cV64c", "ncV:512:", "avx512bw">;
def __builtin_ia32_paddusw512: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_pavgb512: TargetBuiltin<"V64cV64cV64c", "ncV:512:", "avx512bw">;
def __builtin_ia32_pavgw512: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_pmaxsb512: TargetBuiltin<"V64cV64cV64c", "ncV:512:", "avx512bw">;
def __builtin_ia32_pmaxsw512: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_pmaxub512: TargetBuiltin<"V64cV64cV64c", "ncV:512:", "avx512bw">;
def __builtin_ia32_pmaxuw512: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_pminsb512: TargetBuiltin<"V64cV64cV64c", "ncV:512:", "avx512bw">;
def __builtin_ia32_pminsw512: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_pminub512: TargetBuiltin<"V64cV64cV64c", "ncV:512:", "avx512bw">;
def __builtin_ia32_pminuw512: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_pshufb512: TargetBuiltin<"V64cV64cV64c", "ncV:512:", "avx512bw">;
def __builtin_ia32_psubsb512: TargetBuiltin<"V64cV64cV64c", "ncV:512:", "avx512bw">;
def __builtin_ia32_psubsw512: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_psubusb512: TargetBuiltin<"V64cV64cV64c", "ncV:512:", "avx512bw">;
def __builtin_ia32_psubusw512: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;

def __builtin_ia32_vpconflictdi_128: TargetBuiltin<"V2OiV2Oi", "ncV:128:", "avx512cd,avx512vl">;
def __builtin_ia32_vpconflictdi_256: TargetBuiltin<"V4OiV4Oi", "ncV:256:", "avx512cd,avx512vl">;
def __builtin_ia32_vpconflictsi_128: TargetBuiltin<"V4iV4i", "ncV:128:", "avx512cd,avx512vl">;
def __builtin_ia32_vpconflictsi_256: TargetBuiltin<"V8iV8i", "ncV:256:", "avx512cd,avx512vl">;
def __builtin_ia32_vpconflictdi_512: TargetBuiltin<"V8OiV8Oi", "ncV:512:", "avx512cd">;
def __builtin_ia32_vpconflictsi_512: TargetBuiltin<"V16iV16i", "ncV:512:", "avx512cd">;
def __builtin_ia32_vplzcntd_512: TargetBuiltin<"V16iV16i", "ncV:512:", "avx512cd">;
def __builtin_ia32_vplzcntq_512: TargetBuiltin<"V8OiV8Oi", "ncV:512:", "avx512cd">;

def __builtin_ia32_vpopcntd_128: TargetBuiltin<"V4iV4i", "ncV:128:", "avx512vpopcntdq,avx512vl">;
def __builtin_ia32_vpopcntq_128: TargetBuiltin<"V2OiV2Oi", "ncV:128:", "avx512vpopcntdq,avx512vl">;
def __builtin_ia32_vpopcntd_256: TargetBuiltin<"V8iV8i", "ncV:256:", "avx512vpopcntdq,avx512vl">;
def __builtin_ia32_vpopcntq_256: TargetBuiltin<"V4OiV4Oi", "ncV:256:", "avx512vpopcntdq,avx512vl">;
def __builtin_ia32_vpopcntd_512: TargetBuiltin<"V16iV16i", "ncV:512:", "avx512vpopcntdq">;
def __builtin_ia32_vpopcntq_512: TargetBuiltin<"V8OiV8Oi", "ncV:512:", "avx512vpopcntdq">;

def __builtin_ia32_vpopcntb_128: TargetBuiltin<"V16cV16c", "ncV:128:", "avx512vl,avx512bitalg">;
def __builtin_ia32_vpopcntw_128: TargetBuiltin<"V8sV8s", "ncV:128:", "avx512vl,avx512bitalg">;
def __builtin_ia32_vpopcntb_256: TargetBuiltin<"V32cV32c", "ncV:256:", "avx512vl,avx512bitalg">;
def __builtin_ia32_vpopcntw_256: TargetBuiltin<"V16sV16s", "ncV:256:", "avx512vl,avx512bitalg">;
def __builtin_ia32_vpopcntb_512: TargetBuiltin<"V64cV64c", "ncV:512:", "avx512bitalg">;
def __builtin_ia32_vpopcntw_512: TargetBuiltin<"V32sV32s", "ncV:512:", "avx512bitalg">;

def __builtin_ia32_vpshufbitqmb128_mask: TargetBuiltin<"UsV16cV16cUs", "ncV:128:", "avx512vl,avx512bitalg">;
def __builtin_ia32_vpshufbitqmb256_mask: TargetBuiltin<"UiV32cV32cUi", "ncV:256:", "avx512vl,avx512bitalg">;
def __builtin_ia32_vpshufbitqmb512_mask: TargetBuiltin<"UOiV64cV64cUOi", "ncV:512:", "avx512bitalg">;

def __builtin_ia32_pmulhrsw512: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_pmulhuw512: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_pmulhw512: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;

def __builtin_ia32_addpd512: TargetBuiltin<"V8dV8dV8dIi", "ncV:512:", "avx512f">;
def __builtin_ia32_addps512: TargetBuiltin<"V16fV16fV16fIi", "ncV:512:", "avx512f">;
def __builtin_ia32_divpd512: TargetBuiltin<"V8dV8dV8dIi", "ncV:512:", "avx512f">;
def __builtin_ia32_divps512: TargetBuiltin<"V16fV16fV16fIi", "ncV:512:", "avx512f">;
def __builtin_ia32_mulpd512: TargetBuiltin<"V8dV8dV8dIi", "ncV:512:", "avx512f">;
def __builtin_ia32_mulps512: TargetBuiltin<"V16fV16fV16fIi", "ncV:512:", "avx512f">;
def __builtin_ia32_subpd512: TargetBuiltin<"V8dV8dV8dIi", "ncV:512:", "avx512f">;
def __builtin_ia32_subps512: TargetBuiltin<"V16fV16fV16fIi", "ncV:512:", "avx512f">;

def __builtin_ia32_pmaddubsw512: TargetBuiltin<"V32sV64cV64c", "ncV:512:", "avx512bw">;
def __builtin_ia32_pmaddwd512: TargetBuiltin<"V16iV32sV32s", "ncV:512:", "avx512bw">;

def __builtin_ia32_addss_round_mask: TargetBuiltin<"V4fV4fV4fV4fUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_divss_round_mask: TargetBuiltin<"V4fV4fV4fV4fUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_mulss_round_mask: TargetBuiltin<"V4fV4fV4fV4fUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_subss_round_mask: TargetBuiltin<"V4fV4fV4fV4fUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_maxss_round_mask: TargetBuiltin<"V4fV4fV4fV4fUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_minss_round_mask: TargetBuiltin<"V4fV4fV4fV4fUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_addsd_round_mask: TargetBuiltin<"V2dV2dV2dV2dUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_divsd_round_mask: TargetBuiltin<"V2dV2dV2dV2dUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_mulsd_round_mask: TargetBuiltin<"V2dV2dV2dV2dUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_subsd_round_mask: TargetBuiltin<"V2dV2dV2dV2dUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_maxsd_round_mask: TargetBuiltin<"V2dV2dV2dV2dUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_minsd_round_mask: TargetBuiltin<"V2dV2dV2dV2dUcIi", "ncV:128:", "avx512f">;

def __builtin_ia32_compressdf128_mask: TargetBuiltin<"V2dV2dV2dUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_compressdf256_mask: TargetBuiltin<"V4dV4dV4dUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_compressdi128_mask: TargetBuiltin<"V2OiV2OiV2OiUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_compressdi256_mask: TargetBuiltin<"V4OiV4OiV4OiUc", "ncV:256:", "avx512vl">;

def __builtin_ia32_compresshi128_mask: TargetBuiltin<"V8sV8sV8sUc", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_compresshi256_mask: TargetBuiltin<"V16sV16sV16sUs", "ncV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_compressqi128_mask: TargetBuiltin<"V16cV16cV16cUs", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_compressqi256_mask: TargetBuiltin<"V32cV32cV32cUi", "ncV:256:", "avx512vl,avx512vbmi2">;

def __builtin_ia32_compresssf128_mask: TargetBuiltin<"V4fV4fV4fUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_compresssf256_mask: TargetBuiltin<"V8fV8fV8fUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_compresssi128_mask: TargetBuiltin<"V4iV4iV4iUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_compresssi256_mask: TargetBuiltin<"V8iV8iV8iUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_compressstoredf128_mask: TargetBuiltin<"vV2d*V2dUc", "nV:128:", "avx512vl">;
def __builtin_ia32_compressstoredf256_mask: TargetBuiltin<"vV4d*V4dUc", "nV:256:", "avx512vl">;
def __builtin_ia32_compressstoredi128_mask: TargetBuiltin<"vV2Oi*V2OiUc", "nV:128:", "avx512vl">;
def __builtin_ia32_compressstoredi256_mask: TargetBuiltin<"vV4Oi*V4OiUc", "nV:256:", "avx512vl">;

def __builtin_ia32_compressstorehi128_mask: TargetBuiltin<"vV8s*V8sUc", "nV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_compressstorehi256_mask: TargetBuiltin<"vV16s*V16sUs", "nV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_compressstoreqi128_mask: TargetBuiltin<"vV16c*V16cUs", "nV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_compressstoreqi256_mask: TargetBuiltin<"vV32c*V32cUi", "nV:256:", "avx512vl,avx512vbmi2">;

def __builtin_ia32_compressstoresf128_mask: TargetBuiltin<"vV4f*V4fUc", "nV:128:", "avx512vl">;
def __builtin_ia32_compressstoresf256_mask: TargetBuiltin<"vV8f*V8fUc", "nV:256:", "avx512vl">;
def __builtin_ia32_compressstoresi128_mask: TargetBuiltin<"vV4i*V4iUc", "nV:128:", "avx512vl">;
def __builtin_ia32_compressstoresi256_mask: TargetBuiltin<"vV8i*V8iUc", "nV:256:", "avx512vl">;
def __builtin_ia32_cvtpd2dq128_mask: TargetBuiltin<"V4iV2dV4iUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_cvtpd2ps_mask: TargetBuiltin<"V4fV2dV4fUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_cvtpd2udq128_mask: TargetBuiltin<"V4iV2dV4iUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_cvtpd2udq256_mask: TargetBuiltin<"V4iV4dV4iUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_cvtps2udq128_mask: TargetBuiltin<"V4iV4fV4iUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_cvtps2udq256_mask: TargetBuiltin<"V8iV8fV8iUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_cvttpd2dq128_mask: TargetBuiltin<"V4iV2dV4iUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_cvttpd2udq128_mask: TargetBuiltin<"V4iV2dV4iUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_cvttpd2udq256_mask: TargetBuiltin<"V4iV4dV4iUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_cvttps2udq128_mask: TargetBuiltin<"V4iV4fV4iUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_cvttps2udq256_mask: TargetBuiltin<"V8iV8fV8iUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_expanddf128_mask: TargetBuiltin<"V2dV2dV2dUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_expanddf256_mask: TargetBuiltin<"V4dV4dV4dUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_expanddi128_mask: TargetBuiltin<"V2OiV2OiV2OiUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_expanddi256_mask: TargetBuiltin<"V4OiV4OiV4OiUc", "ncV:256:", "avx512vl">;

def __builtin_ia32_expandhi128_mask: TargetBuiltin<"V8sV8sV8sUc", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_expandhi256_mask: TargetBuiltin<"V16sV16sV16sUs", "ncV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_expandqi128_mask: TargetBuiltin<"V16cV16cV16cUs", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_expandqi256_mask: TargetBuiltin<"V32cV32cV32cUi", "ncV:256:", "avx512vl,avx512vbmi2">;

def __builtin_ia32_expandloaddf128_mask: TargetBuiltin<"V2dV2dC*V2dUc", "nV:128:", "avx512vl">;
def __builtin_ia32_expandloaddf256_mask: TargetBuiltin<"V4dV4dC*V4dUc", "nV:256:", "avx512vl">;
def __builtin_ia32_expandloaddi128_mask: TargetBuiltin<"V4iV2OiC*V2OiUc", "nV:128:", "avx512vl">;
def __builtin_ia32_expandloaddi256_mask: TargetBuiltin<"V4OiV4OiC*V4OiUc", "nV:256:", "avx512vl">;

def __builtin_ia32_expandloadhi128_mask: TargetBuiltin<"V8sV8sC*V8sUc", "nV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_expandloadhi256_mask: TargetBuiltin<"V16sV16sC*V16sUs", "nV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_expandloadqi128_mask: TargetBuiltin<"V16cV16cC*V16cUs", "nV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_expandloadqi256_mask: TargetBuiltin<"V32cV32cC*V32cUi", "nV:256:", "avx512vl,avx512vbmi2">;

def __builtin_ia32_expandloadsf128_mask: TargetBuiltin<"V4fV4fC*V4fUc", "nV:128:", "avx512vl">;
def __builtin_ia32_expandloadsf256_mask: TargetBuiltin<"V8fV8fC*V8fUc", "nV:256:", "avx512vl">;
def __builtin_ia32_expandloadsi128_mask: TargetBuiltin<"V4iV4iC*V4iUc", "nV:128:", "avx512vl">;
def __builtin_ia32_expandloadsi256_mask: TargetBuiltin<"V8iV8iC*V8iUc", "nV:256:", "avx512vl">;
def __builtin_ia32_expandsf128_mask: TargetBuiltin<"V4fV4fV4fUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_expandsf256_mask: TargetBuiltin<"V8fV8fV8fUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_expandsi128_mask: TargetBuiltin<"V4iV4iV4iUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_expandsi256_mask: TargetBuiltin<"V8iV8iV8iUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_getexppd128_mask: TargetBuiltin<"V2dV2dV2dUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_getexppd256_mask: TargetBuiltin<"V4dV4dV4dUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_getexpps128_mask: TargetBuiltin<"V4fV4fV4fUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_getexpps256_mask: TargetBuiltin<"V8fV8fV8fUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pabsq128: TargetBuiltin<"V2OiV2Oi", "ncV:128:", "avx512vl">;
def __builtin_ia32_pabsq256: TargetBuiltin<"V4OiV4Oi", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmaxsq128: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmaxsq256: TargetBuiltin<"V4OiV4OiV4Oi", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmaxuq128: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmaxuq256: TargetBuiltin<"V4OiV4OiV4Oi", "ncV:256:", "avx512vl">;
def __builtin_ia32_pminsq128: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "avx512vl">;
def __builtin_ia32_pminsq256: TargetBuiltin<"V4OiV4OiV4Oi", "ncV:256:", "avx512vl">;
def __builtin_ia32_pminuq128: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "avx512vl">;
def __builtin_ia32_pminuq256: TargetBuiltin<"V4OiV4OiV4Oi", "ncV:256:", "avx512vl">;
def __builtin_ia32_rndscalepd_128_mask: TargetBuiltin<"V2dV2dIiV2dUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_rndscalepd_256_mask: TargetBuiltin<"V4dV4dIiV4dUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_rndscaleps_128_mask: TargetBuiltin<"V4fV4fIiV4fUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_rndscaleps_256_mask: TargetBuiltin<"V8fV8fIiV8fUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_scalefpd128_mask: TargetBuiltin<"V2dV2dV2dV2dUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_scalefpd256_mask: TargetBuiltin<"V4dV4dV4dV4dUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_scalefps128_mask: TargetBuiltin<"V4fV4fV4fV4fUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_scalefps256_mask: TargetBuiltin<"V8fV8fV8fV8fUc", "ncV:256:", "avx512vl">;

def __builtin_ia32_scatterdiv2df: TargetBuiltin<"vv*UcV2OiV2dIi", "nV:128:", "avx512vl">;
def __builtin_ia32_scatterdiv2di: TargetBuiltin<"vv*UcV2OiV2OiIi", "nV:128:", "avx512vl">;
def __builtin_ia32_scatterdiv4df: TargetBuiltin<"vv*UcV4OiV4dIi", "nV:256:", "avx512vl">;
def __builtin_ia32_scatterdiv4di: TargetBuiltin<"vv*UcV4OiV4OiIi", "nV:256:", "avx512vl">;
def __builtin_ia32_scatterdiv4sf: TargetBuiltin<"vv*UcV2OiV4fIi", "nV:128:", "avx512vl">;
def __builtin_ia32_scatterdiv4si: TargetBuiltin<"vv*UcV2OiV4iIi", "nV:128:", "avx512vl">;
def __builtin_ia32_scatterdiv8sf: TargetBuiltin<"vv*UcV4OiV4fIi", "nV:256:", "avx512vl">;
def __builtin_ia32_scatterdiv8si: TargetBuiltin<"vv*UcV4OiV4iIi", "nV:256:", "avx512vl">;
def __builtin_ia32_scattersiv2df: TargetBuiltin<"vv*UcV4iV2dIi", "nV:128:", "avx512vl">;
def __builtin_ia32_scattersiv2di: TargetBuiltin<"vv*UcV4iV2OiIi", "nV:128:", "avx512vl">;
def __builtin_ia32_scattersiv4df: TargetBuiltin<"vv*UcV4iV4dIi", "nV:256:", "avx512vl">;
def __builtin_ia32_scattersiv4di: TargetBuiltin<"vv*UcV4iV4OiIi", "nV:256:", "avx512vl">;
def __builtin_ia32_scattersiv4sf: TargetBuiltin<"vv*UcV4iV4fIi", "nV:128:", "avx512vl">;
def __builtin_ia32_scattersiv4si: TargetBuiltin<"vv*UcV4iV4iIi", "nV:128:", "avx512vl">;
def __builtin_ia32_scattersiv8sf: TargetBuiltin<"vv*UcV8iV8fIi", "nV:256:", "avx512vl">;
def __builtin_ia32_scattersiv8si: TargetBuiltin<"vv*UcV8iV8iIi", "nV:256:", "avx512vl">;

def __builtin_ia32_vpermi2vard128: TargetBuiltin<"V4iV4iV4iV4i", "ncV:128:", "avx512vl">;
def __builtin_ia32_vpermi2vard256: TargetBuiltin<"V8iV8iV8iV8i", "ncV:256:", "avx512vl">;
def __builtin_ia32_vpermi2vard512: TargetBuiltin<"V16iV16iV16iV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_vpermi2varpd128: TargetBuiltin<"V2dV2dV2OiV2d", "ncV:128:", "avx512vl">;
def __builtin_ia32_vpermi2varpd256: TargetBuiltin<"V4dV4dV4OiV4d", "ncV:256:", "avx512vl">;
def __builtin_ia32_vpermi2varpd512: TargetBuiltin<"V8dV8dV8OiV8d", "ncV:512:", "avx512f">;
def __builtin_ia32_vpermi2varps128: TargetBuiltin<"V4fV4fV4iV4f", "ncV:128:", "avx512vl">;
def __builtin_ia32_vpermi2varps256: TargetBuiltin<"V8fV8fV8iV8f", "ncV:256:", "avx512vl">;
def __builtin_ia32_vpermi2varps512: TargetBuiltin<"V16fV16fV16iV16f", "ncV:512:", "avx512f">;
def __builtin_ia32_vpermi2varq128: TargetBuiltin<"V2OiV2OiV2OiV2Oi", "ncV:128:", "avx512vl">;
def __builtin_ia32_vpermi2varq256: TargetBuiltin<"V4OiV4OiV4OiV4Oi", "ncV:256:", "avx512vl">;
def __builtin_ia32_vpermi2varq512: TargetBuiltin<"V8OiV8OiV8OiV8Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_vpermi2varqi128: TargetBuiltin<"V16cV16cV16cV16c", "ncV:128:", "avx512vbmi,avx512vl">;
def __builtin_ia32_vpermi2varqi256: TargetBuiltin<"V32cV32cV32cV32c", "ncV:256:", "avx512vbmi,avx512vl">;
def __builtin_ia32_vpermi2varqi512: TargetBuiltin<"V64cV64cV64cV64c", "ncV:512:", "avx512vbmi">;
def __builtin_ia32_vpermi2varhi128: TargetBuiltin<"V8sV8sV8sV8s", "ncV:128:", "avx512vl,avx512bw">;
def __builtin_ia32_vpermi2varhi256: TargetBuiltin<"V16sV16sV16sV16s", "ncV:256:", "avx512vl,avx512bw">;
def __builtin_ia32_vpermi2varhi512: TargetBuiltin<"V32sV32sV32sV32s", "ncV:512:", "avx512bw">;

def __builtin_ia32_vpshldd128: TargetBuiltin<"V4iV4iV4iIi", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshldd256: TargetBuiltin<"V8iV8iV8iIi", "ncV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshldd512: TargetBuiltin<"V16iV16iV16iIi", "ncV:512:", "avx512vbmi2">;
def __builtin_ia32_vpshldq128: TargetBuiltin<"V2OiV2OiV2OiIi", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshldq256: TargetBuiltin<"V4OiV4OiV4OiIi", "ncV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshldq512: TargetBuiltin<"V8OiV8OiV8OiIi", "ncV:512:", "avx512vbmi2">;
def __builtin_ia32_vpshldw128: TargetBuiltin<"V8sV8sV8sIi", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshldw256: TargetBuiltin<"V16sV16sV16sIi", "ncV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshldw512: TargetBuiltin<"V32sV32sV32sIi", "ncV:512:", "avx512vbmi2">;

def __builtin_ia32_vpshldvd128: TargetBuiltin<"V4iV4iV4iV4i", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshldvd256: TargetBuiltin<"V8iV8iV8iV8i", "ncV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshldvd512: TargetBuiltin<"V16iV16iV16iV16i", "ncV:512:", "avx512vbmi2">;
def __builtin_ia32_vpshldvq128: TargetBuiltin<"V2OiV2OiV2OiV2Oi", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshldvq256: TargetBuiltin<"V4OiV4OiV4OiV4Oi", "ncV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshldvq512: TargetBuiltin<"V8OiV8OiV8OiV8Oi", "ncV:512:", "avx512vbmi2">;
def __builtin_ia32_vpshldvw128: TargetBuiltin<"V8sV8sV8sV8s", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshldvw256: TargetBuiltin<"V16sV16sV16sV16s", "ncV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshldvw512: TargetBuiltin<"V32sV32sV32sV32s", "ncV:512:", "avx512vbmi2">;

def __builtin_ia32_vpshrdvd128: TargetBuiltin<"V4iV4iV4iV4i", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshrdvd256: TargetBuiltin<"V8iV8iV8iV8i", "ncV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshrdvd512: TargetBuiltin<"V16iV16iV16iV16i", "ncV:512:", "avx512vbmi2">;
def __builtin_ia32_vpshrdvq128: TargetBuiltin<"V2OiV2OiV2OiV2Oi", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshrdvq256: TargetBuiltin<"V4OiV4OiV4OiV4Oi", "ncV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshrdvq512: TargetBuiltin<"V8OiV8OiV8OiV8Oi", "ncV:512:", "avx512vbmi2">;
def __builtin_ia32_vpshrdvw128: TargetBuiltin<"V8sV8sV8sV8s", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshrdvw256: TargetBuiltin<"V16sV16sV16sV16s", "ncV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshrdvw512: TargetBuiltin<"V32sV32sV32sV32s", "ncV:512:", "avx512vbmi2">;

def __builtin_ia32_vpshrdd128: TargetBuiltin<"V4iV4iV4iIi", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshrdd256: TargetBuiltin<"V8iV8iV8iIi", "ncV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshrdd512: TargetBuiltin<"V16iV16iV16iIi", "ncV:512:", "avx512vbmi2">;
def __builtin_ia32_vpshrdq128: TargetBuiltin<"V2OiV2OiV2OiIi", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshrdq256: TargetBuiltin<"V4OiV4OiV4OiIi", "ncV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshrdq512: TargetBuiltin<"V8OiV8OiV8OiIi", "ncV:512:", "avx512vbmi2">;
def __builtin_ia32_vpshrdw128: TargetBuiltin<"V8sV8sV8sIi", "ncV:128:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshrdw256: TargetBuiltin<"V16sV16sV16sIi", "ncV:256:", "avx512vl,avx512vbmi2">;
def __builtin_ia32_vpshrdw512: TargetBuiltin<"V32sV32sV32sIi", "ncV:512:", "avx512vbmi2">;

def __builtin_ia32_pmovswb512_mask: TargetBuiltin<"V32cV32sV32cUi", "ncV:512:", "avx512bw">;
def __builtin_ia32_pmovuswb512_mask: TargetBuiltin<"V32cV32sV32cUi", "ncV:512:", "avx512bw">;
def __builtin_ia32_pmovwb512_mask: TargetBuiltin<"V32cV32sV32cUi", "ncV:512:", "avx512bw">;
def __builtin_ia32_cvtpd2qq128_mask: TargetBuiltin<"V2OiV2dV2OiUc", "ncV:128:", "avx512vl,avx512dq">;
def __builtin_ia32_cvtpd2qq256_mask: TargetBuiltin<"V4OiV4dV4OiUc", "ncV:256:", "avx512vl,avx512dq">;
def __builtin_ia32_cvtpd2uqq128_mask: TargetBuiltin<"V2OiV2dV2OiUc", "ncV:128:", "avx512vl,avx512dq">;
def __builtin_ia32_cvtpd2uqq256_mask: TargetBuiltin<"V4OiV4dV4OiUc", "ncV:256:", "avx512vl,avx512dq">;
def __builtin_ia32_cvtps2qq128_mask: TargetBuiltin<"V2OiV4fV2OiUc", "ncV:128:", "avx512vl,avx512dq">;
def __builtin_ia32_cvtps2qq256_mask: TargetBuiltin<"V4OiV4fV4OiUc", "ncV:256:", "avx512vl,avx512dq">;
def __builtin_ia32_cvtps2uqq128_mask: TargetBuiltin<"V2OiV4fV2OiUc", "ncV:128:", "avx512vl,avx512dq">;
def __builtin_ia32_cvtps2uqq256_mask: TargetBuiltin<"V4OiV4fV4OiUc", "ncV:256:", "avx512vl,avx512dq">;
def __builtin_ia32_cvtqq2ps128_mask: TargetBuiltin<"V4fV2OiV4fUc", "ncV:128:", "avx512vl,avx512dq">;
def __builtin_ia32_cvttpd2qq128_mask: TargetBuiltin<"V2OiV2dV2OiUc", "ncV:128:", "avx512vl,avx512dq">;
def __builtin_ia32_cvttpd2qq256_mask: TargetBuiltin<"V4OiV4dV4OiUc", "ncV:256:", "avx512vl,avx512dq">;
def __builtin_ia32_cvttpd2uqq128_mask: TargetBuiltin<"V2OiV2dV2OiUc", "ncV:128:", "avx512vl,avx512dq">;
def __builtin_ia32_cvttpd2uqq256_mask: TargetBuiltin<"V4OiV4dV4OiUc", "ncV:256:", "avx512vl,avx512dq">;
def __builtin_ia32_cvttps2qq128_mask: TargetBuiltin<"V2OiV4fV2OiUc", "ncV:128:", "avx512vl,avx512dq">;
def __builtin_ia32_cvttps2qq256_mask: TargetBuiltin<"V4OiV4fV4OiUc", "ncV:256:", "avx512vl,avx512dq">;
def __builtin_ia32_cvttps2uqq128_mask: TargetBuiltin<"V2OiV4fV2OiUc", "ncV:128:", "avx512vl,avx512dq">;
def __builtin_ia32_cvttps2uqq256_mask: TargetBuiltin<"V4OiV4fV4OiUc", "ncV:256:", "avx512vl,avx512dq">;
def __builtin_ia32_cvtuqq2ps128_mask: TargetBuiltin<"V4fV2OiV4fUc", "ncV:128:", "avx512vl,avx512dq">;
def __builtin_ia32_rangepd128_mask: TargetBuiltin<"V2dV2dV2dIiV2dUc", "ncV:128:", "avx512vl,avx512dq">;
def __builtin_ia32_rangepd256_mask: TargetBuiltin<"V4dV4dV4dIiV4dUc", "ncV:256:", "avx512vl,avx512dq">;
def __builtin_ia32_rangeps128_mask: TargetBuiltin<"V4fV4fV4fIiV4fUc", "ncV:128:", "avx512vl,avx512dq">;
def __builtin_ia32_rangeps256_mask: TargetBuiltin<"V8fV8fV8fIiV8fUc", "ncV:256:", "avx512vl,avx512dq">;
def __builtin_ia32_rangesd128_round_mask: TargetBuiltin<"V2dV2dV2dV2dUcIiIi", "ncV:128:", "avx512dq">;
def __builtin_ia32_rangess128_round_mask: TargetBuiltin<"V4fV4fV4fV4fUcIiIi", "ncV:128:", "avx512dq">;
def __builtin_ia32_reducepd128_mask: TargetBuiltin<"V2dV2dIiV2dUc", "ncV:128:", "avx512vl,avx512dq">;
def __builtin_ia32_reducepd256_mask: TargetBuiltin<"V4dV4dIiV4dUc", "ncV:256:", "avx512vl,avx512dq">;
def __builtin_ia32_reduceps128_mask: TargetBuiltin<"V4fV4fIiV4fUc", "ncV:128:", "avx512vl,avx512dq">;
def __builtin_ia32_reduceps256_mask: TargetBuiltin<"V8fV8fIiV8fUc", "ncV:256:", "avx512vl,avx512dq">;
def __builtin_ia32_reducesd_mask: TargetBuiltin<"V2dV2dV2dV2dUcIiIi", "ncV:128:", "avx512dq">;
def __builtin_ia32_reducess_mask: TargetBuiltin<"V4fV4fV4fV4fUcIiIi", "ncV:128:", "avx512dq">;
def __builtin_ia32_pmovswb128_mask: TargetBuiltin<"V16cV8sV16cUc", "ncV:128:", "avx512vl,avx512bw">;
def __builtin_ia32_pmovswb256_mask: TargetBuiltin<"V16cV16sV16cUs", "ncV:256:", "avx512vl,avx512bw">;
def __builtin_ia32_pmovuswb128_mask: TargetBuiltin<"V16cV8sV16cUc", "ncV:128:", "avx512vl,avx512bw">;
def __builtin_ia32_pmovuswb256_mask: TargetBuiltin<"V16cV16sV16cUs", "ncV:256:", "avx512vl,avx512bw">;
def __builtin_ia32_pmovwb128_mask: TargetBuiltin<"V16cV8sV16cUc", "ncV:128:", "avx512vl,avx512bw">;
def __builtin_ia32_cvtpd2qq512_mask: TargetBuiltin<"V8OiV8dV8OiUcIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_cvtpd2uqq512_mask: TargetBuiltin<"V8OiV8dV8OiUcIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_cvtps2qq512_mask: TargetBuiltin<"V8OiV8fV8OiUcIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_cvtps2uqq512_mask: TargetBuiltin<"V8OiV8fV8OiUcIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_cvtqq2pd512_mask: TargetBuiltin<"V8dV8OiV8dUcIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_cvtqq2ps512_mask: TargetBuiltin<"V8fV8OiV8fUcIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_cvttpd2qq512_mask: TargetBuiltin<"V8OiV8dV8OiUcIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_cvttpd2uqq512_mask: TargetBuiltin<"V8OiV8dV8OiUcIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_cvttps2qq512_mask: TargetBuiltin<"V8OiV8fV8OiUcIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_cvttps2uqq512_mask: TargetBuiltin<"V8OiV8fV8OiUcIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_cvtuqq2pd512_mask: TargetBuiltin<"V8dV8OiV8dUcIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_cvtuqq2ps512_mask: TargetBuiltin<"V8fV8OiV8fUcIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_rangepd512_mask: TargetBuiltin<"V8dV8dV8dIiV8dUcIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_rangeps512_mask: TargetBuiltin<"V16fV16fV16fIiV16fUsIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_reducepd512_mask: TargetBuiltin<"V8dV8dIiV8dUcIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_reduceps512_mask: TargetBuiltin<"V16fV16fIiV16fUsIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_prold512: TargetBuiltin<"V16iV16iIi", "ncV:512:", "avx512f">;
def __builtin_ia32_prolq512: TargetBuiltin<"V8OiV8OiIi", "ncV:512:", "avx512f">;
def __builtin_ia32_prold128: TargetBuiltin<"V4iV4iIi", "ncV:128:", "avx512vl">;
def __builtin_ia32_prold256: TargetBuiltin<"V8iV8iIi", "ncV:256:", "avx512vl">;
def __builtin_ia32_prolq128: TargetBuiltin<"V2OiV2OiIi", "ncV:128:", "avx512vl">;
def __builtin_ia32_prolq256: TargetBuiltin<"V4OiV4OiIi", "ncV:256:", "avx512vl">;
def __builtin_ia32_prolvd512: TargetBuiltin<"V16iV16iV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_prolvq512: TargetBuiltin<"V8OiV8OiV8Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_prord512: TargetBuiltin<"V16iV16iIi", "ncV:512:", "avx512f">;
def __builtin_ia32_prorq512: TargetBuiltin<"V8OiV8OiIi", "ncV:512:", "avx512f">;
def __builtin_ia32_prolvd128: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "avx512vl">;
def __builtin_ia32_prolvd256: TargetBuiltin<"V8iV8iV8i", "ncV:256:", "avx512vl">;
def __builtin_ia32_prolvq128: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "avx512vl">;
def __builtin_ia32_prolvq256: TargetBuiltin<"V4OiV4OiV4Oi", "ncV:256:", "avx512vl">;
def __builtin_ia32_prord128: TargetBuiltin<"V4iV4iIi", "ncV:128:", "avx512vl">;
def __builtin_ia32_prord256: TargetBuiltin<"V8iV8iIi", "ncV:256:", "avx512vl">;
def __builtin_ia32_prorq128: TargetBuiltin<"V2OiV2OiIi", "ncV:128:", "avx512vl">;
def __builtin_ia32_prorq256: TargetBuiltin<"V4OiV4OiIi", "ncV:256:", "avx512vl">;
def __builtin_ia32_prorvd512: TargetBuiltin<"V16iV16iV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_prorvq512: TargetBuiltin<"V8OiV8OiV8Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_prorvd128: TargetBuiltin<"V4iV4iV4i", "ncV:128:", "avx512vl">;
def __builtin_ia32_prorvd256: TargetBuiltin<"V8iV8iV8i", "ncV:256:", "avx512vl">;
def __builtin_ia32_prorvq128: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "avx512vl">;
def __builtin_ia32_prorvq256: TargetBuiltin<"V4OiV4OiV4Oi", "ncV:256:", "avx512vl">;
def __builtin_ia32_pshufhw512: TargetBuiltin<"V32sV32sIi", "ncV:512:", "avx512bw">;
def __builtin_ia32_pshuflw512: TargetBuiltin<"V32sV32sIi", "ncV:512:", "avx512bw">;
def __builtin_ia32_psllv32hi: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_psllw512: TargetBuiltin<"V32sV32sV8s", "ncV:512:", "avx512bw">;
def __builtin_ia32_psllwi512: TargetBuiltin<"V32sV32si", "ncV:512:", "avx512bw">;
def __builtin_ia32_psllv16hi: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx512bw,avx512vl">;
def __builtin_ia32_psllv8hi: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "avx512bw,avx512vl">;
def __builtin_ia32_pslldi512: TargetBuiltin<"V16iV16ii", "ncV:512:", "avx512f">;
def __builtin_ia32_psllqi512: TargetBuiltin<"V8OiV8Oii", "ncV:512:", "avx512f">;
def __builtin_ia32_psrlv32hi: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_psrlv16hi: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx512bw,avx512vl">;
def __builtin_ia32_psrlv8hi: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "avx512bw,avx512vl">;
def __builtin_ia32_psrldi512: TargetBuiltin<"V16iV16ii", "ncV:512:", "avx512f">;
def __builtin_ia32_psrlqi512: TargetBuiltin<"V8OiV8Oii", "ncV:512:", "avx512f">;
def __builtin_ia32_psrav32hi: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_psrav16hi: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx512bw,avx512vl">;
def __builtin_ia32_psrav8hi: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "avx512bw,avx512vl">;
def __builtin_ia32_psravq128: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "avx512vl">;
def __builtin_ia32_psravq256: TargetBuiltin<"V4OiV4OiV4Oi", "ncV:256:", "avx512vl">;
def __builtin_ia32_psraw512: TargetBuiltin<"V32sV32sV8s", "ncV:512:", "avx512bw">;
def __builtin_ia32_psrawi512: TargetBuiltin<"V32sV32si", "ncV:512:", "avx512bw">;
def __builtin_ia32_psrlw512: TargetBuiltin<"V32sV32sV8s", "ncV:512:", "avx512bw">;
def __builtin_ia32_psrlwi512: TargetBuiltin<"V32sV32si", "ncV:512:", "avx512bw">;
def __builtin_ia32_pslldqi512_byteshift: TargetBuiltin<"V8OiV8OiIi", "ncV:512:", "avx512bw">;
def __builtin_ia32_psrldqi512_byteshift: TargetBuiltin<"V8OiV8OiIi", "ncV:512:", "avx512bw">;
def __builtin_ia32_movdqa32load128_mask: TargetBuiltin<"V4iV4iC*V4iUc", "nV:128:", "avx512vl">;
def __builtin_ia32_movdqa32load256_mask: TargetBuiltin<"V8iV8iC*V8iUc", "nV:256:", "avx512vl">;
def __builtin_ia32_movdqa32load512_mask: TargetBuiltin<"V16iV16iC*V16iUs", "nV:512:", "avx512f">;
def __builtin_ia32_movdqa32store512_mask: TargetBuiltin<"vV16i*V16iUs", "nV:512:", "avx512f">;
def __builtin_ia32_movdqa64load512_mask: TargetBuiltin<"V8OiV8OiC*V8OiUc", "nV:512:", "avx512f">;
def __builtin_ia32_movdqa64store512_mask: TargetBuiltin<"vV8Oi*V8OiUc", "nV:512:", "avx512f">;
def __builtin_ia32_movdqa32store128_mask: TargetBuiltin<"vV4i*V4iUc", "nV:128:", "avx512vl">;
def __builtin_ia32_movdqa32store256_mask: TargetBuiltin<"vV8i*V8iUc", "nV:256:", "avx512vl">;
def __builtin_ia32_movdqa64load128_mask: TargetBuiltin<"V2OiV2OiC*V2OiUc", "nV:128:", "avx512vl">;
def __builtin_ia32_movdqa64load256_mask: TargetBuiltin<"V4OiV4OiC*V4OiUc", "nV:256:", "avx512vl">;
def __builtin_ia32_movdqa64store128_mask: TargetBuiltin<"vV2Oi*V2OiUc", "nV:128:", "avx512vl">;
def __builtin_ia32_movdqa64store256_mask: TargetBuiltin<"vV4Oi*V4OiUc", "nV:256:", "avx512vl">;
def __builtin_ia32_vpmadd52huq512: TargetBuiltin<"V8OiV8OiV8OiV8Oi", "ncV:512:", "avx512ifma">;
def __builtin_ia32_vpmadd52luq512: TargetBuiltin<"V8OiV8OiV8OiV8Oi", "ncV:512:", "avx512ifma">;
def __builtin_ia32_vpmadd52huq128: TargetBuiltin<"V2OiV2OiV2OiV2Oi", "ncV:128:", "avx512ifma,avx512vl">;
def __builtin_ia32_vpmadd52huq256: TargetBuiltin<"V4OiV4OiV4OiV4Oi", "ncV:256:", "avx512ifma,avx512vl">;
def __builtin_ia32_vpmadd52luq128: TargetBuiltin<"V2OiV2OiV2OiV2Oi", "ncV:128:", "avx512ifma,avx512vl">;
def __builtin_ia32_vpmadd52luq256: TargetBuiltin<"V4OiV4OiV4OiV4Oi", "ncV:256:", "avx512ifma,avx512vl">;
def __builtin_ia32_vcomisd: TargetBuiltin<"iV2dV2dIiIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vcomiss: TargetBuiltin<"iV4fV4fIiIi", "ncV:128:", "avx512f">;
def __builtin_ia32_kunpckdi: TargetBuiltin<"UOiUOiUOi", "nc", "avx512bw">;
def __builtin_ia32_kunpcksi: TargetBuiltin<"UiUiUi", "nc", "avx512bw">;
def __builtin_ia32_loaddquhi512_mask: TargetBuiltin<"V32sV32sC*V32sUi", "nV:512:", "avx512bw">;
def __builtin_ia32_loaddquqi512_mask: TargetBuiltin<"V64cV64cC*V64cUOi", "nV:512:", "avx512bw">;
def __builtin_ia32_fixupimmpd512_mask: TargetBuiltin<"V8dV8dV8dV8OiIiUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_fixupimmpd512_maskz: TargetBuiltin<"V8dV8dV8dV8OiIiUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_fixupimmps512_mask: TargetBuiltin<"V16fV16fV16fV16iIiUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_fixupimmps512_maskz: TargetBuiltin<"V16fV16fV16fV16iIiUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_fixupimmsd_mask: TargetBuiltin<"V2dV2dV2dV2OiIiUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_fixupimmsd_maskz: TargetBuiltin<"V2dV2dV2dV2OiIiUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_fixupimmss_mask: TargetBuiltin<"V4fV4fV4fV4iIiUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_fixupimmss_maskz: TargetBuiltin<"V4fV4fV4fV4iIiUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_getexpsd128_round_mask: TargetBuiltin<"V2dV2dV2dV2dUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_getexpss128_round_mask: TargetBuiltin<"V4fV4fV4fV4fUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_getmantsd_round_mask: TargetBuiltin<"V2dV2dV2dIiV2dUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_getmantss_round_mask: TargetBuiltin<"V4fV4fV4fIiV4fUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_loaddquhi128_mask: TargetBuiltin<"V8sV8sC*V8sUc", "nV:128:", "avx512bw,avx512vl">;
def __builtin_ia32_loaddquhi256_mask: TargetBuiltin<"V16sV16sC*V16sUs", "nV:256:", "avx512bw,avx512vl">;
def __builtin_ia32_loaddquqi128_mask: TargetBuiltin<"V16cV16cC*V16cUs", "nV:128:", "avx512bw,avx512vl">;
def __builtin_ia32_loaddquqi256_mask: TargetBuiltin<"V32cV32cC*V32cUi", "nV:256:", "avx512bw,avx512vl">;
def __builtin_ia32_fixupimmpd128_mask: TargetBuiltin<"V2dV2dV2dV2OiIiUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_fixupimmpd128_maskz: TargetBuiltin<"V2dV2dV2dV2OiIiUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_fixupimmpd256_mask: TargetBuiltin<"V4dV4dV4dV4OiIiUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_fixupimmpd256_maskz: TargetBuiltin<"V4dV4dV4dV4OiIiUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_fixupimmps128_mask: TargetBuiltin<"V4fV4fV4fV4iIiUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_fixupimmps128_maskz: TargetBuiltin<"V4fV4fV4fV4iIiUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_fixupimmps256_mask: TargetBuiltin<"V8fV8fV8fV8iIiUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_fixupimmps256_maskz: TargetBuiltin<"V8fV8fV8fV8iIiUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_loadapd128_mask: TargetBuiltin<"V2dV2dC*V2dUc", "nV:128:", "avx512vl">;
def __builtin_ia32_loadsd128_mask: TargetBuiltin<"V2dV2dC*V2dUc", "nV:128:", "avx512f">;
def __builtin_ia32_loadapd256_mask: TargetBuiltin<"V4dV4dC*V4dUc", "nV:256:", "avx512vl">;
def __builtin_ia32_loadaps128_mask: TargetBuiltin<"V4fV4fC*V4fUc", "nV:128:", "avx512vl">;
def __builtin_ia32_loadss128_mask: TargetBuiltin<"V4fV4fC*V4fUc", "nV:128:", "avx512f">;
def __builtin_ia32_loadaps256_mask: TargetBuiltin<"V8fV8fC*V8fUc", "nV:256:", "avx512vl">;
def __builtin_ia32_loaddqudi128_mask: TargetBuiltin<"V2OiV2OiC*V2OiUc", "nV:128:", "avx512vl">;
def __builtin_ia32_loaddqudi256_mask: TargetBuiltin<"V4OiV4OiC*V4OiUc", "nV:256:", "avx512vl">;
def __builtin_ia32_loaddqusi128_mask: TargetBuiltin<"V4iV4iC*V4iUc", "nV:128:", "avx512vl">;
def __builtin_ia32_loaddqusi256_mask: TargetBuiltin<"V8iV8iC*V8iUc", "nV:256:", "avx512vl">;
def __builtin_ia32_loadupd128_mask: TargetBuiltin<"V2dV2dC*V2dUc", "nV:128:", "avx512vl">;
def __builtin_ia32_loadupd256_mask: TargetBuiltin<"V4dV4dC*V4dUc", "nV:256:", "avx512vl">;
def __builtin_ia32_loadups128_mask: TargetBuiltin<"V4fV4fC*V4fUc", "nV:128:", "avx512vl">;
def __builtin_ia32_loadups256_mask: TargetBuiltin<"V8fV8fC*V8fUc", "nV:256:", "avx512vl">;
def __builtin_ia32_storedquhi512_mask: TargetBuiltin<"vV32s*V32sUi", "nV:512:", "avx512bw">;
def __builtin_ia32_storedquqi512_mask: TargetBuiltin<"vV64c*V64cUOi", "nV:512:", "avx512bw">;
def __builtin_ia32_storedquhi128_mask: TargetBuiltin<"vV8s*V8sUc", "nV:128:", "avx512vl,avx512bw">;
def __builtin_ia32_storedquhi256_mask: TargetBuiltin<"vV16s*V16sUs", "nV:256:", "avx512vl,avx512bw">;
def __builtin_ia32_storedquqi128_mask: TargetBuiltin<"vV16c*V16cUs", "nV:128:", "avx512vl,avx512bw">;
def __builtin_ia32_storedquqi256_mask: TargetBuiltin<"vV32c*V32cUi", "nV:256:", "avx512vl,avx512bw">;
def __builtin_ia32_storeapd128_mask: TargetBuiltin<"vV2d*V2dUc", "nV:128:", "avx512vl">;
def __builtin_ia32_storesd128_mask: TargetBuiltin<"vV2d*V2dUc", "nV:128:", "avx512f">;
def __builtin_ia32_storeapd256_mask: TargetBuiltin<"vV4d*V4dUc", "nV:256:", "avx512vl">;
def __builtin_ia32_storeaps128_mask: TargetBuiltin<"vV4f*V4fUc", "nV:128:", "avx512vl">;
def __builtin_ia32_storess128_mask: TargetBuiltin<"vV4f*V4fUc", "nV:128:", "avx512f">;
def __builtin_ia32_storeaps256_mask: TargetBuiltin<"vV8f*V8fUc", "nV:256:", "avx512vl">;
def __builtin_ia32_storedqudi128_mask: TargetBuiltin<"vV2Oi*V2OiUc", "nV:128:", "avx512vl">;
def __builtin_ia32_storedqudi256_mask: TargetBuiltin<"vV4Oi*V4OiUc", "nV:256:", "avx512vl">;
def __builtin_ia32_storedqusi128_mask: TargetBuiltin<"vV4i*V4iUc", "nV:128:", "avx512vl">;
def __builtin_ia32_storedqusi256_mask: TargetBuiltin<"vV8i*V8iUc", "nV:256:", "avx512vl">;
def __builtin_ia32_storeupd128_mask: TargetBuiltin<"vV2d*V2dUc", "nV:128:", "avx512vl">;
def __builtin_ia32_storeupd256_mask: TargetBuiltin<"vV4d*V4dUc", "nV:256:", "avx512vl">;
def __builtin_ia32_storeups128_mask: TargetBuiltin<"vV4f*V4fUc", "nV:128:", "avx512vl">;
def __builtin_ia32_storeups256_mask: TargetBuiltin<"vV8f*V8fUc", "nV:256:", "avx512vl">;
def __builtin_ia32_rcp14pd128_mask: TargetBuiltin<"V2dV2dV2dUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_rcp14pd256_mask: TargetBuiltin<"V4dV4dV4dUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_rcp14ps128_mask: TargetBuiltin<"V4fV4fV4fUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_rcp14ps256_mask: TargetBuiltin<"V8fV8fV8fUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_vplzcntd_128: TargetBuiltin<"V4iV4i", "ncV:128:", "avx512cd,avx512vl">;
def __builtin_ia32_vplzcntd_256: TargetBuiltin<"V8iV8i", "ncV:256:", "avx512cd,avx512vl">;
def __builtin_ia32_vplzcntq_128: TargetBuiltin<"V2OiV2Oi", "ncV:128:", "avx512cd,avx512vl">;
def __builtin_ia32_vplzcntq_256: TargetBuiltin<"V4OiV4Oi", "ncV:256:", "avx512cd,avx512vl">;
def __builtin_ia32_vcvtsd2si32: TargetBuiltin<"iV2dIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vcvtsd2usi32: TargetBuiltin<"UiV2dIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vcvtss2si32: TargetBuiltin<"iV4fIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vcvtss2usi32: TargetBuiltin<"UiV4fIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vcvttsd2si32: TargetBuiltin<"iV2dIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vcvttsd2usi32: TargetBuiltin<"UiV2dIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vcvttss2si32: TargetBuiltin<"iV4fIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vcvttss2usi32: TargetBuiltin<"UiV4fIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vpermilpd512: TargetBuiltin<"V8dV8dIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vpermilps512: TargetBuiltin<"V16fV16fIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vpermilvarpd512: TargetBuiltin<"V8dV8dV8Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_vpermilvarps512: TargetBuiltin<"V16fV16fV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_rndscalesd_round_mask: TargetBuiltin<"V2dV2dV2dV2dUcIiIi", "ncV:128:", "avx512f">;
def __builtin_ia32_rndscaless_round_mask: TargetBuiltin<"V4fV4fV4fV4fUcIiIi", "ncV:128:", "avx512f">;
def __builtin_ia32_scalefpd512_mask: TargetBuiltin<"V8dV8dV8dV8dUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_scalefps512_mask: TargetBuiltin<"V16fV16fV16fV16fUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_scalefsd_round_mask: TargetBuiltin<"V2dV2dV2dV2dUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_scalefss_round_mask: TargetBuiltin<"V4fV4fV4fV4fUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_psradi512: TargetBuiltin<"V16iV16ii", "ncV:512:", "avx512f">;
def __builtin_ia32_psraqi512: TargetBuiltin<"V8OiV8Oii", "ncV:512:", "avx512f">;
def __builtin_ia32_psraq128: TargetBuiltin<"V2OiV2OiV2Oi", "ncV:128:", "avx512vl">;
def __builtin_ia32_psraq256: TargetBuiltin<"V4OiV4OiV2Oi", "ncV:256:", "avx512vl">;
def __builtin_ia32_psraqi128: TargetBuiltin<"V2OiV2Oii", "ncV:128:", "avx512vl">;
def __builtin_ia32_psraqi256: TargetBuiltin<"V4OiV4Oii", "ncV:256:", "avx512vl">;
def __builtin_ia32_pslld512: TargetBuiltin<"V16iV16iV4i", "ncV:512:", "avx512f">;
def __builtin_ia32_psllq512: TargetBuiltin<"V8OiV8OiV2Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_psllv16si: TargetBuiltin<"V16iV16iV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_psllv8di: TargetBuiltin<"V8OiV8OiV8Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_psrad512: TargetBuiltin<"V16iV16iV4i", "ncV:512:", "avx512f">;
def __builtin_ia32_psraq512: TargetBuiltin<"V8OiV8OiV2Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_psrav16si: TargetBuiltin<"V16iV16iV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_psrav8di: TargetBuiltin<"V8OiV8OiV8Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_psrld512: TargetBuiltin<"V16iV16iV4i", "ncV:512:", "avx512f">;
def __builtin_ia32_psrlq512: TargetBuiltin<"V8OiV8OiV2Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_psrlv16si: TargetBuiltin<"V16iV16iV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_psrlv8di: TargetBuiltin<"V8OiV8OiV8Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_pternlogd512_mask: TargetBuiltin<"V16iV16iV16iV16iIiUs", "ncV:512:", "avx512f">;
def __builtin_ia32_pternlogd512_maskz: TargetBuiltin<"V16iV16iV16iV16iIiUs", "ncV:512:", "avx512f">;
def __builtin_ia32_pternlogq512_mask: TargetBuiltin<"V8OiV8OiV8OiV8OiIiUc", "ncV:512:", "avx512f">;
def __builtin_ia32_pternlogq512_maskz: TargetBuiltin<"V8OiV8OiV8OiV8OiIiUc", "ncV:512:", "avx512f">;
def __builtin_ia32_pternlogd128_mask: TargetBuiltin<"V4iV4iV4iV4iIiUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pternlogd128_maskz: TargetBuiltin<"V4iV4iV4iV4iIiUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pternlogd256_mask: TargetBuiltin<"V8iV8iV8iV8iIiUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pternlogd256_maskz: TargetBuiltin<"V8iV8iV8iV8iIiUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pternlogq128_mask: TargetBuiltin<"V2OiV2OiV2OiV2OiIiUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pternlogq128_maskz: TargetBuiltin<"V2OiV2OiV2OiV2OiIiUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pternlogq256_mask: TargetBuiltin<"V4OiV4OiV4OiV4OiIiUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pternlogq256_maskz: TargetBuiltin<"V4OiV4OiV4OiV4OiIiUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_shuf_f32x4: TargetBuiltin<"V16fV16fV16fIi", "ncV:512:", "avx512f">;
def __builtin_ia32_shuf_f64x2: TargetBuiltin<"V8dV8dV8dIi", "ncV:512:", "avx512f">;
def __builtin_ia32_shuf_i32x4: TargetBuiltin<"V16iV16iV16iIi", "ncV:512:", "avx512f">;
def __builtin_ia32_shuf_i64x2: TargetBuiltin<"V8OiV8OiV8OiIi", "ncV:512:", "avx512f">;
def __builtin_ia32_shufpd512: TargetBuiltin<"V8dV8dV8dIi", "ncV:512:", "avx512f">;
def __builtin_ia32_shufps512: TargetBuiltin<"V16fV16fV16fIi", "ncV:512:", "avx512f">;
def __builtin_ia32_shuf_f32x4_256: TargetBuiltin<"V8fV8fV8fIi", "ncV:256:", "avx512vl">;
def __builtin_ia32_shuf_f64x2_256: TargetBuiltin<"V4dV4dV4dIi", "ncV:256:", "avx512vl">;
def __builtin_ia32_shuf_i32x4_256: TargetBuiltin<"V8iV8iV8iIi", "ncV:256:", "avx512vl">;
def __builtin_ia32_shuf_i64x2_256: TargetBuiltin<"V4OiV4OiV4OiIi", "ncV:256:", "avx512vl">;
def __builtin_ia32_sqrtsd_round_mask: TargetBuiltin<"V2dV2dV2dV2dUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_sqrtss_round_mask: TargetBuiltin<"V4fV4fV4fV4fUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_rsqrt14pd128_mask: TargetBuiltin<"V2dV2dV2dUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_rsqrt14pd256_mask: TargetBuiltin<"V4dV4dV4dUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_rsqrt14ps128_mask: TargetBuiltin<"V4fV4fV4fUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_rsqrt14ps256_mask: TargetBuiltin<"V8fV8fV8fUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_cvtb2mask512: TargetBuiltin<"UOiV64c", "ncV:512:", "avx512bw">;
def __builtin_ia32_cvtmask2b512: TargetBuiltin<"V64cUOi", "ncV:512:", "avx512bw">;
def __builtin_ia32_cvtmask2w512: TargetBuiltin<"V32sUi", "ncV:512:", "avx512bw">;
def __builtin_ia32_cvtd2mask512: TargetBuiltin<"UsV16i", "ncV:512:", "avx512dq">;
def __builtin_ia32_cvtmask2d512: TargetBuiltin<"V16iUs", "ncV:512:", "avx512dq">;
def __builtin_ia32_cvtmask2q512: TargetBuiltin<"V8OiUc", "ncV:512:", "avx512dq">;
def __builtin_ia32_cvtq2mask512: TargetBuiltin<"UcV8Oi", "ncV:512:", "avx512dq">;
def __builtin_ia32_cvtb2mask128: TargetBuiltin<"UsV16c", "ncV:128:", "avx512bw,avx512vl">;
def __builtin_ia32_cvtb2mask256: TargetBuiltin<"UiV32c", "ncV:256:", "avx512bw,avx512vl">;
def __builtin_ia32_cvtmask2b128: TargetBuiltin<"V16cUs", "ncV:128:", "avx512bw,avx512vl">;
def __builtin_ia32_cvtmask2b256: TargetBuiltin<"V32cUi", "ncV:256:", "avx512bw,avx512vl">;
def __builtin_ia32_cvtmask2w128: TargetBuiltin<"V8sUc", "ncV:128:", "avx512bw,avx512vl">;
def __builtin_ia32_cvtmask2w256: TargetBuiltin<"V16sUs", "ncV:256:", "avx512bw,avx512vl">;
def __builtin_ia32_cvtd2mask128: TargetBuiltin<"UcV4i", "ncV:128:", "avx512dq,avx512vl">;
def __builtin_ia32_cvtd2mask256: TargetBuiltin<"UcV8i", "ncV:256:", "avx512dq,avx512vl">;
def __builtin_ia32_cvtmask2d128: TargetBuiltin<"V4iUc", "ncV:128:", "avx512dq,avx512vl">;
def __builtin_ia32_cvtmask2d256: TargetBuiltin<"V8iUc", "ncV:256:", "avx512dq,avx512vl">;
def __builtin_ia32_cvtmask2q128: TargetBuiltin<"V2OiUc", "ncV:128:", "avx512dq,avx512vl">;
def __builtin_ia32_cvtmask2q256: TargetBuiltin<"V4OiUc", "ncV:256:", "avx512dq,avx512vl">;
def __builtin_ia32_cvtq2mask128: TargetBuiltin<"UcV2Oi", "ncV:128:", "avx512dq,avx512vl">;
def __builtin_ia32_cvtq2mask256: TargetBuiltin<"UcV4Oi", "ncV:256:", "avx512dq,avx512vl">;
def __builtin_ia32_pmovsdb512_mask: TargetBuiltin<"V16cV16iV16cUs", "ncV:512:", "avx512f">;
def __builtin_ia32_pmovsdb512mem_mask: TargetBuiltin<"vV16c*V16iUs", "nV:512:", "avx512f">;
def __builtin_ia32_pmovswb512mem_mask: TargetBuiltin<"vV32c*V32sUi", "nV:512:", "avx512bw">;
def __builtin_ia32_pmovsdw512_mask: TargetBuiltin<"V16sV16iV16sUs", "ncV:512:", "avx512f">;
def __builtin_ia32_pmovsdw512mem_mask: TargetBuiltin<"vV16s*V16iUs", "nV:512:", "avx512f">;
def __builtin_ia32_pmovsqb512_mask: TargetBuiltin<"V16cV8OiV16cUc", "ncV:512:", "avx512f">;
def __builtin_ia32_pmovsqb512mem_mask: TargetBuiltin<"vV16c*V8OiUc", "nV:512:", "avx512f">;
def __builtin_ia32_pmovsqd512_mask: TargetBuiltin<"V8iV8OiV8iUc", "ncV:512:", "avx512f">;
def __builtin_ia32_pmovsqd512mem_mask: TargetBuiltin<"vV8i*V8OiUc", "nV:512:", "avx512f">;
def __builtin_ia32_pmovsqw512_mask: TargetBuiltin<"V8sV8OiV8sUc", "ncV:512:", "avx512f">;
def __builtin_ia32_pmovsqw512mem_mask: TargetBuiltin<"vV8s*V8OiUc", "nV:512:", "avx512f">;
def __builtin_ia32_pmovsdb128_mask: TargetBuiltin<"V16cV4iV16cUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmovsdb128mem_mask: TargetBuiltin<"vV16c*V4iUc", "nV:128:", "avx512vl">;
def __builtin_ia32_pmovswb128mem_mask: TargetBuiltin<"vV16c*V8sUc", "nV:128:", "avx512vl,avx512bw">;
def __builtin_ia32_pmovsdb256_mask: TargetBuiltin<"V16cV8iV16cUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmovsdb256mem_mask: TargetBuiltin<"vV16c*V8iUc", "nV:256:", "avx512vl">;
def __builtin_ia32_pmovswb256mem_mask: TargetBuiltin<"vV16c*V16sUs", "nV:256:", "avx512vl,avx512bw">;
def __builtin_ia32_pmovsdw128_mask: TargetBuiltin<"V8sV4iV8sUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmovsdw128mem_mask: TargetBuiltin<"vV8s*V4iUc", "nV:128:", "avx512vl">;
def __builtin_ia32_pmovsdw256_mask: TargetBuiltin<"V8sV8iV8sUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmovsdw256mem_mask: TargetBuiltin<"vV8s*V8iUc", "nV:256:", "avx512vl">;
def __builtin_ia32_pmovsqb128_mask: TargetBuiltin<"V16cV2OiV16cUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmovsqb128mem_mask: TargetBuiltin<"vV16c*V2OiUc", "nV:128:", "avx512vl">;
def __builtin_ia32_pmovsqb256_mask: TargetBuiltin<"V16cV4OiV16cUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmovsqb256mem_mask: TargetBuiltin<"vV16c*V4OiUc", "nV:256:", "avx512vl">;
def __builtin_ia32_pmovsqd128_mask: TargetBuiltin<"V4iV2OiV4iUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmovsqd128mem_mask: TargetBuiltin<"vV4i*V2OiUc", "nV:128:", "avx512vl">;
def __builtin_ia32_pmovsqd256_mask: TargetBuiltin<"V4iV4OiV4iUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmovsqd256mem_mask: TargetBuiltin<"vV4i*V4OiUc", "nV:256:", "avx512vl">;
def __builtin_ia32_pmovsqw128_mask: TargetBuiltin<"V8sV2OiV8sUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmovsqw128mem_mask: TargetBuiltin<"vV8s*V2OiUc", "nV:128:", "avx512vl">;
def __builtin_ia32_pmovsqw256_mask: TargetBuiltin<"V8sV4OiV8sUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmovsqw256mem_mask: TargetBuiltin<"vV8s*V4OiUc", "nV:256:", "avx512vl">;
def __builtin_ia32_pmovusdb512_mask: TargetBuiltin<"V16cV16iV16cUs", "ncV:512:", "avx512f">;
def __builtin_ia32_pmovusdb512mem_mask: TargetBuiltin<"vV16c*V16iUs", "nV:512:", "avx512f">;
def __builtin_ia32_pmovuswb512mem_mask: TargetBuiltin<"vV32c*V32sUi", "nV:512:", "avx512bw">;
def __builtin_ia32_pmovusdw512_mask: TargetBuiltin<"V16sV16iV16sUs", "ncV:512:", "avx512f">;
def __builtin_ia32_pmovusdw512mem_mask: TargetBuiltin<"vV16s*V16iUs", "nV:512:", "avx512f">;
def __builtin_ia32_pmovusqb512_mask: TargetBuiltin<"V16cV8OiV16cUc", "ncV:512:", "avx512f">;
def __builtin_ia32_pmovusqb512mem_mask: TargetBuiltin<"vV16c*V8OiUc", "nV:512:", "avx512f">;
def __builtin_ia32_pmovusqd512_mask: TargetBuiltin<"V8iV8OiV8iUc", "ncV:512:", "avx512f">;
def __builtin_ia32_pmovusqd512mem_mask: TargetBuiltin<"vV8i*V8OiUc", "nV:512:", "avx512f">;
def __builtin_ia32_pmovusqw512_mask: TargetBuiltin<"V8sV8OiV8sUc", "ncV:512:", "avx512f">;
def __builtin_ia32_pmovusqw512mem_mask: TargetBuiltin<"vV8s*V8OiUc", "nV:512:", "avx512f">;
def __builtin_ia32_pmovusdb128_mask: TargetBuiltin<"V16cV4iV16cUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmovusdb128mem_mask: TargetBuiltin<"vV16c*V4iUc", "nV:128:", "avx512vl">;
def __builtin_ia32_pmovuswb128mem_mask: TargetBuiltin<"vV16c*V8sUc", "nV:128:", "avx512vl,avx512bw">;
def __builtin_ia32_pmovusdb256_mask: TargetBuiltin<"V16cV8iV16cUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmovusdb256mem_mask: TargetBuiltin<"vV16c*V8iUc", "nV:256:", "avx512vl">;
def __builtin_ia32_pmovuswb256mem_mask: TargetBuiltin<"vV16c*V16sUs", "nV:256:", "avx512vl,avx512bw">;
def __builtin_ia32_pmovusdw128_mask: TargetBuiltin<"V8sV4iV8sUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmovusdw128mem_mask: TargetBuiltin<"vV8s*V4iUc", "nV:128:", "avx512vl">;
def __builtin_ia32_pmovusdw256_mask: TargetBuiltin<"V8sV8iV8sUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmovusdw256mem_mask: TargetBuiltin<"vV8s*V8iUc", "nV:256:", "avx512vl">;
def __builtin_ia32_pmovusqb128_mask: TargetBuiltin<"V16cV2OiV16cUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmovusqb128mem_mask: TargetBuiltin<"vV16c*V2OiUc", "nV:128:", "avx512vl">;
def __builtin_ia32_pmovusqb256_mask: TargetBuiltin<"V16cV4OiV16cUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmovusqb256mem_mask: TargetBuiltin<"vV16c*V4OiUc", "nV:256:", "avx512vl">;
def __builtin_ia32_pmovusqd128_mask: TargetBuiltin<"V4iV2OiV4iUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmovusqd128mem_mask: TargetBuiltin<"vV4i*V2OiUc", "nV:128:", "avx512vl">;
def __builtin_ia32_pmovusqd256_mask: TargetBuiltin<"V4iV4OiV4iUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmovusqd256mem_mask: TargetBuiltin<"vV4i*V4OiUc", "nV:256:", "avx512vl">;
def __builtin_ia32_pmovusqw128_mask: TargetBuiltin<"V8sV2OiV8sUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmovusqw128mem_mask: TargetBuiltin<"vV8s*V2OiUc", "nV:128:", "avx512vl">;
def __builtin_ia32_pmovusqw256_mask: TargetBuiltin<"V8sV4OiV8sUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmovusqw256mem_mask: TargetBuiltin<"vV8s*V4OiUc", "nV:256:", "avx512vl">;
def __builtin_ia32_pmovdb512_mask: TargetBuiltin<"V16cV16iV16cUs", "ncV:512:", "avx512f">;
def __builtin_ia32_pmovdb512mem_mask: TargetBuiltin<"vV16c*V16iUs", "nV:512:", "avx512f">;
def __builtin_ia32_pmovwb512mem_mask: TargetBuiltin<"vV32c*V32sUi", "nV:512:", "avx512bw">;
def __builtin_ia32_pmovdw512_mask: TargetBuiltin<"V16sV16iV16sUs", "ncV:512:", "avx512f">;
def __builtin_ia32_pmovdw512mem_mask: TargetBuiltin<"vV16s*V16iUs", "nV:512:", "avx512f">;
def __builtin_ia32_pmovqb512_mask: TargetBuiltin<"V16cV8OiV16cUc", "ncV:512:", "avx512f">;
def __builtin_ia32_pmovqb512mem_mask: TargetBuiltin<"vV16c*V8OiUc", "nV:512:", "avx512f">;
def __builtin_ia32_pmovqd512_mask: TargetBuiltin<"V8iV8OiV8iUc", "ncV:512:", "avx512f">;
def __builtin_ia32_pmovqd512mem_mask: TargetBuiltin<"vV8i*V8OiUc", "nV:512:", "avx512f">;
def __builtin_ia32_pmovqw512_mask: TargetBuiltin<"V8sV8OiV8sUc", "ncV:512:", "avx512f">;
def __builtin_ia32_pmovqw512mem_mask: TargetBuiltin<"vV8s*V8OiUc", "nV:512:", "avx512f">;
def __builtin_ia32_pmovdb128_mask: TargetBuiltin<"V16cV4iV16cUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmovwb128mem_mask: TargetBuiltin<"vV16c*V8sUc", "nV:128:", "avx512vl,avx512bw">;
def __builtin_ia32_pmovdb128mem_mask: TargetBuiltin<"vV16c*V4iUc", "nV:128:", "avx512vl">;
def __builtin_ia32_pmovdb256_mask: TargetBuiltin<"V16cV8iV16cUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmovdb256mem_mask: TargetBuiltin<"vV16c*V8iUc", "nV:256:", "avx512vl">;
def __builtin_ia32_pmovwb256mem_mask: TargetBuiltin<"vV16c*V16sUs", "nV:256:", "avx512vl,avx512bw">;
def __builtin_ia32_pmovdw128_mask: TargetBuiltin<"V8sV4iV8sUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmovdw128mem_mask: TargetBuiltin<"vV8s*V4iUc", "nV:128:", "avx512vl">;
def __builtin_ia32_pmovdw256_mask: TargetBuiltin<"V8sV8iV8sUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmovdw256mem_mask: TargetBuiltin<"vV8s*V8iUc", "nV:256:", "avx512vl">;
def __builtin_ia32_pmovqb128_mask: TargetBuiltin<"V16cV2OiV16cUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmovqb128mem_mask: TargetBuiltin<"vV16c*V2OiUc", "nV:128:", "avx512vl">;
def __builtin_ia32_pmovqb256_mask: TargetBuiltin<"V16cV4OiV16cUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmovqb256mem_mask: TargetBuiltin<"vV16c*V4OiUc", "nV:256:", "avx512vl">;
def __builtin_ia32_pmovqd128_mask: TargetBuiltin<"V4iV2OiV4iUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmovqd128mem_mask: TargetBuiltin<"vV4i*V2OiUc", "nV:128:", "avx512vl">;
def __builtin_ia32_pmovqd256mem_mask: TargetBuiltin<"vV4i*V4OiUc", "nV:256:", "avx512vl">;
def __builtin_ia32_pmovqw128_mask: TargetBuiltin<"V8sV2OiV8sUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_pmovqw128mem_mask: TargetBuiltin<"vV8s*V2OiUc", "nV:128:", "avx512vl">;
def __builtin_ia32_pmovqw256_mask: TargetBuiltin<"V8sV4OiV8sUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_pmovqw256mem_mask: TargetBuiltin<"vV8s*V4OiUc", "nV:256:", "avx512vl">;
def __builtin_ia32_extractf32x8_mask: TargetBuiltin<"V8fV16fIiV8fUc", "ncV:512:", "avx512dq">;
def __builtin_ia32_extractf64x2_512_mask: TargetBuiltin<"V2dV8dIiV2dUc", "ncV:512:", "avx512dq">;
def __builtin_ia32_extracti32x8_mask: TargetBuiltin<"V8iV16iIiV8iUc", "ncV:512:", "avx512dq">;
def __builtin_ia32_extracti64x2_512_mask: TargetBuiltin<"V2OiV8OiIiV2OiUc", "ncV:512:", "avx512dq">;
def __builtin_ia32_extracti32x4_mask: TargetBuiltin<"V4iV16iIiV4iUc", "ncV:512:", "avx512f">;
def __builtin_ia32_extracti64x4_mask: TargetBuiltin<"V4OiV8OiIiV4OiUc", "ncV:512:", "avx512f">;
def __builtin_ia32_extractf64x2_256_mask: TargetBuiltin<"V2dV4dIiV2dUc", "ncV:256:", "avx512dq,avx512vl">;
def __builtin_ia32_extracti64x2_256_mask: TargetBuiltin<"V2OiV4OiIiV2OiUc", "ncV:256:", "avx512dq,avx512vl">;
def __builtin_ia32_extractf32x4_256_mask: TargetBuiltin<"V4fV8fIiV4fUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_extracti32x4_256_mask: TargetBuiltin<"V4iV8iIiV4iUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_insertf32x8: TargetBuiltin<"V16fV16fV8fIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_insertf64x2_512: TargetBuiltin<"V8dV8dV2dIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_inserti32x8: TargetBuiltin<"V16iV16iV8iIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_inserti64x2_512: TargetBuiltin<"V8OiV8OiV2OiIi", "ncV:512:", "avx512dq">;
def __builtin_ia32_insertf64x4: TargetBuiltin<"V8dV8dV4dIi", "ncV:512:", "avx512f">;
def __builtin_ia32_inserti64x4: TargetBuiltin<"V8OiV8OiV4OiIi", "ncV:512:", "avx512f">;
def __builtin_ia32_insertf64x2_256: TargetBuiltin<"V4dV4dV2dIi", "ncV:256:", "avx512dq,avx512vl">;
def __builtin_ia32_inserti64x2_256: TargetBuiltin<"V4OiV4OiV2OiIi", "ncV:256:", "avx512dq,avx512vl">;
def __builtin_ia32_insertf32x4_256: TargetBuiltin<"V8fV8fV4fIi", "ncV:256:", "avx512vl">;
def __builtin_ia32_inserti32x4_256: TargetBuiltin<"V8iV8iV4iIi", "ncV:256:", "avx512vl">;
def __builtin_ia32_insertf32x4: TargetBuiltin<"V16fV16fV4fIi", "ncV:512:", "avx512f">;
def __builtin_ia32_inserti32x4: TargetBuiltin<"V16iV16iV4iIi", "ncV:512:", "avx512f">;
def __builtin_ia32_getmantpd128_mask: TargetBuiltin<"V2dV2dIiV2dUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_getmantpd256_mask: TargetBuiltin<"V4dV4dIiV4dUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_getmantps128_mask: TargetBuiltin<"V4fV4fIiV4fUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_getmantps256_mask: TargetBuiltin<"V8fV8fIiV8fUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_getmantpd512_mask: TargetBuiltin<"V8dV8dIiV8dUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_getmantps512_mask: TargetBuiltin<"V16fV16fIiV16fUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_getexppd512_mask: TargetBuiltin<"V8dV8dV8dUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_getexpps512_mask: TargetBuiltin<"V16fV16fV16fUsIi", "ncV:512:", "avx512f">;
def __builtin_ia32_vfmaddss3_mask: TargetBuiltin<"V4fV4fV4fV4fUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vfmaddss3_maskz: TargetBuiltin<"V4fV4fV4fV4fUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vfmaddss3_mask3: TargetBuiltin<"V4fV4fV4fV4fUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vfmaddsd3_mask: TargetBuiltin<"V2dV2dV2dV2dUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vfmaddsd3_maskz: TargetBuiltin<"V2dV2dV2dV2dUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vfmaddsd3_mask3: TargetBuiltin<"V2dV2dV2dV2dUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vfmsubsd3_mask3: TargetBuiltin<"V2dV2dV2dV2dUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vfmsubss3_mask3: TargetBuiltin<"V4fV4fV4fV4fUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_permdf512: TargetBuiltin<"V8dV8dIi", "ncV:512:", "avx512f">;
def __builtin_ia32_permdi512: TargetBuiltin<"V8OiV8OiIi", "ncV:512:", "avx512f">;
def __builtin_ia32_permvarhi512: TargetBuiltin<"V32sV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_permvardf512: TargetBuiltin<"V8dV8dV8Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_permvardi512: TargetBuiltin<"V8OiV8OiV8Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_permvarsf512: TargetBuiltin<"V16fV16fV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_permvarsi512: TargetBuiltin<"V16iV16iV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_permvarqi512: TargetBuiltin<"V64cV64cV64c", "ncV:512:", "avx512vbmi">;
def __builtin_ia32_permvarqi128: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "avx512vbmi,avx512vl">;
def __builtin_ia32_permvarqi256: TargetBuiltin<"V32cV32cV32c", "ncV:256:", "avx512vbmi,avx512vl">;
def __builtin_ia32_permvarhi128: TargetBuiltin<"V8sV8sV8s", "ncV:128:", "avx512bw,avx512vl">;
def __builtin_ia32_permvarhi256: TargetBuiltin<"V16sV16sV16s", "ncV:256:", "avx512bw,avx512vl">;
def __builtin_ia32_permvardf256: TargetBuiltin<"V4dV4dV4Oi", "ncV:256:", "avx512vl">;
def __builtin_ia32_permvardi256: TargetBuiltin<"V4OiV4OiV4Oi", "ncV:256:", "avx512vl">;
def __builtin_ia32_fpclasspd128_mask: TargetBuiltin<"UcV2dIiUc", "ncV:128:", "avx512dq,avx512vl">;
def __builtin_ia32_fpclasspd256_mask: TargetBuiltin<"UcV4dIiUc", "ncV:256:", "avx512dq,avx512vl">;
def __builtin_ia32_fpclassps128_mask: TargetBuiltin<"UcV4fIiUc", "ncV:128:", "avx512dq,avx512vl">;
def __builtin_ia32_fpclassps256_mask: TargetBuiltin<"UcV8fIiUc", "ncV:256:", "avx512dq,avx512vl">;
def __builtin_ia32_fpclassps512_mask: TargetBuiltin<"UsV16fIiUs", "ncV:512:", "avx512dq">;
def __builtin_ia32_fpclasspd512_mask: TargetBuiltin<"UcV8dIiUc", "ncV:512:", "avx512dq">;
def __builtin_ia32_fpclasssd_mask: TargetBuiltin<"UcV2dIiUc", "ncV:128:", "avx512dq">;
def __builtin_ia32_fpclassss_mask: TargetBuiltin<"UcV4fIiUc", "ncV:128:", "avx512dq">;
def __builtin_ia32_kaddqi: TargetBuiltin<"UcUcUc", "nc", "avx512dq">;
def __builtin_ia32_kaddhi: TargetBuiltin<"UsUsUs", "nc", "avx512dq">;
def __builtin_ia32_kaddsi: TargetBuiltin<"UiUiUi", "nc", "avx512bw">;
def __builtin_ia32_kadddi: TargetBuiltin<"UOiUOiUOi", "nc", "avx512bw">;
def __builtin_ia32_kandqi: TargetBuiltin<"UcUcUc", "nc", "avx512dq">;
def __builtin_ia32_kandhi: TargetBuiltin<"UsUsUs", "nc", "avx512f">;
def __builtin_ia32_kandsi: TargetBuiltin<"UiUiUi", "nc", "avx512bw">;
def __builtin_ia32_kanddi: TargetBuiltin<"UOiUOiUOi", "nc", "avx512bw">;
def __builtin_ia32_kandnqi: TargetBuiltin<"UcUcUc", "nc", "avx512dq">;
def __builtin_ia32_kandnhi: TargetBuiltin<"UsUsUs", "nc", "avx512f">;
def __builtin_ia32_kandnsi: TargetBuiltin<"UiUiUi", "nc", "avx512bw">;
def __builtin_ia32_kandndi: TargetBuiltin<"UOiUOiUOi", "nc", "avx512bw">;
def __builtin_ia32_korqi: TargetBuiltin<"UcUcUc", "nc", "avx512dq">;
def __builtin_ia32_korhi: TargetBuiltin<"UsUsUs", "nc", "avx512f">;
def __builtin_ia32_korsi: TargetBuiltin<"UiUiUi", "nc", "avx512bw">;
def __builtin_ia32_kordi: TargetBuiltin<"UOiUOiUOi", "nc", "avx512bw">;
def __builtin_ia32_kortestcqi: TargetBuiltin<"iUcUc", "nc", "avx512dq">;
def __builtin_ia32_kortestzqi: TargetBuiltin<"iUcUc", "nc", "avx512dq">;
def __builtin_ia32_kortestchi: TargetBuiltin<"iUsUs", "nc", "avx512f">;
def __builtin_ia32_kortestzhi: TargetBuiltin<"iUsUs", "nc", "avx512f">;
def __builtin_ia32_kortestcsi: TargetBuiltin<"iUiUi", "nc", "avx512bw">;
def __builtin_ia32_kortestzsi: TargetBuiltin<"iUiUi", "nc", "avx512bw">;
def __builtin_ia32_kortestcdi: TargetBuiltin<"iUOiUOi", "nc", "avx512bw">;
def __builtin_ia32_kortestzdi: TargetBuiltin<"iUOiUOi", "nc", "avx512bw">;
def __builtin_ia32_ktestcqi: TargetBuiltin<"iUcUc", "nc", "avx512dq">;
def __builtin_ia32_ktestzqi: TargetBuiltin<"iUcUc", "nc", "avx512dq">;
def __builtin_ia32_ktestchi: TargetBuiltin<"iUsUs", "nc", "avx512dq">;
def __builtin_ia32_ktestzhi: TargetBuiltin<"iUsUs", "nc", "avx512dq">;
def __builtin_ia32_ktestcsi: TargetBuiltin<"iUiUi", "nc", "avx512bw">;
def __builtin_ia32_ktestzsi: TargetBuiltin<"iUiUi", "nc", "avx512bw">;
def __builtin_ia32_ktestcdi: TargetBuiltin<"iUOiUOi", "nc", "avx512bw">;
def __builtin_ia32_ktestzdi: TargetBuiltin<"iUOiUOi", "nc", "avx512bw">;
def __builtin_ia32_kunpckhi: TargetBuiltin<"UsUsUs", "nc", "avx512f">;
def __builtin_ia32_kxnorqi: TargetBuiltin<"UcUcUc", "nc", "avx512dq">;
def __builtin_ia32_kxnorhi: TargetBuiltin<"UsUsUs", "nc", "avx512f">;
def __builtin_ia32_kxnorsi: TargetBuiltin<"UiUiUi", "nc", "avx512bw">;
def __builtin_ia32_kxnordi: TargetBuiltin<"UOiUOiUOi", "nc", "avx512bw">;
def __builtin_ia32_kxorqi: TargetBuiltin<"UcUcUc", "nc", "avx512dq">;
def __builtin_ia32_kxorhi: TargetBuiltin<"UsUsUs", "nc", "avx512f">;
def __builtin_ia32_kxorsi: TargetBuiltin<"UiUiUi", "nc", "avx512bw">;
def __builtin_ia32_kxordi: TargetBuiltin<"UOiUOiUOi", "nc", "avx512bw">;
def __builtin_ia32_kshiftliqi: TargetBuiltin<"UcUcIUi", "nc", "avx512dq">;
def __builtin_ia32_kshiftlihi: TargetBuiltin<"UsUsIUi", "nc", "avx512f">;
def __builtin_ia32_kshiftlisi: TargetBuiltin<"UiUiIUi", "nc", "avx512bw">;
def __builtin_ia32_kshiftlidi: TargetBuiltin<"UOiUOiIUi", "nc", "avx512bw">;
def __builtin_ia32_kshiftriqi: TargetBuiltin<"UcUcIUi", "nc", "avx512dq">;
def __builtin_ia32_kshiftrihi: TargetBuiltin<"UsUsIUi", "nc", "avx512f">;
def __builtin_ia32_kshiftrisi: TargetBuiltin<"UiUiIUi", "nc", "avx512bw">;
def __builtin_ia32_kshiftridi: TargetBuiltin<"UOiUOiIUi", "nc", "avx512bw">;
def __builtin_ia32_kmovb: TargetBuiltin<"UcUc", "nc", "avx512dq">;
def __builtin_ia32_kmovw: TargetBuiltin<"UsUs", "nc", "avx512f">;
def __builtin_ia32_kmovd: TargetBuiltin<"UiUi", "nc", "avx512bw">;
def __builtin_ia32_kmovq: TargetBuiltin<"UOiUOi", "nc", "avx512bw">;
def __builtin_ia32_palignr512: TargetBuiltin<"V64cV64cV64cIi", "ncV:512:", "avx512bw">;
def __builtin_ia32_dbpsadbw128: TargetBuiltin<"V8sV16cV16cIi", "ncV:128:", "avx512bw,avx512vl">;
def __builtin_ia32_dbpsadbw256: TargetBuiltin<"V16sV32cV32cIi", "ncV:256:", "avx512bw,avx512vl">;
def __builtin_ia32_dbpsadbw512: TargetBuiltin<"V32sV64cV64cIi", "ncV:512:", "avx512bw">;
def __builtin_ia32_psadbw512: TargetBuiltin<"V8OiV64cV64c", "ncV:512:", "avx512bw">;
def __builtin_ia32_compressdf512_mask: TargetBuiltin<"V8dV8dV8dUc", "ncV:512:", "avx512f">;
def __builtin_ia32_compressdi512_mask: TargetBuiltin<"V8OiV8OiV8OiUc", "ncV:512:", "avx512f">;
def __builtin_ia32_compresshi512_mask: TargetBuiltin<"V32sV32sV32sUi", "ncV:512:", "avx512vbmi2">;
def __builtin_ia32_compressqi512_mask: TargetBuiltin<"V64cV64cV64cUOi", "ncV:512:", "avx512vbmi2">;
def __builtin_ia32_compresssf512_mask: TargetBuiltin<"V16fV16fV16fUs", "ncV:512:", "avx512f">;
def __builtin_ia32_compresssi512_mask: TargetBuiltin<"V16iV16iV16iUs", "ncV:512:", "avx512f">;
def __builtin_ia32_cmpsd_mask: TargetBuiltin<"UcV2dV2dIiUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_cmpss_mask: TargetBuiltin<"UcV4fV4fIiUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_pshufd512: TargetBuiltin<"V16iV16iIi", "ncV:512:", "avx512f">;
def __builtin_ia32_expanddf512_mask: TargetBuiltin<"V8dV8dV8dUc", "ncV:512:", "avx512f">;
def __builtin_ia32_expanddi512_mask: TargetBuiltin<"V8OiV8OiV8OiUc", "ncV:512:", "avx512f">;
def __builtin_ia32_expandhi512_mask: TargetBuiltin<"V32sV32sV32sUi", "ncV:512:", "avx512vbmi2">;
def __builtin_ia32_expandqi512_mask: TargetBuiltin<"V64cV64cV64cUOi", "ncV:512:", "avx512vbmi2">;
def __builtin_ia32_expandloaddf512_mask: TargetBuiltin<"V8dV8dC*V8dUc", "nV:512:", "avx512f">;
def __builtin_ia32_expandloaddi512_mask: TargetBuiltin<"V8OiV8OiC*V8OiUc", "nV:512:", "avx512f">;
def __builtin_ia32_expandloadhi512_mask: TargetBuiltin<"V32sV32sC*V32sUi", "nV:512:", "avx512vbmi2">;
def __builtin_ia32_expandloadqi512_mask: TargetBuiltin<"V64cV64cC*V64cUOi", "nV:512:", "avx512vbmi2">;
def __builtin_ia32_expandloadsf512_mask: TargetBuiltin<"V16fV16fC*V16fUs", "nV:512:", "avx512f">;
def __builtin_ia32_expandloadsi512_mask: TargetBuiltin<"V16iV16iC*V16iUs", "nV:512:", "avx512f">;
def __builtin_ia32_expandsf512_mask: TargetBuiltin<"V16fV16fV16fUs", "ncV:512:", "avx512f">;
def __builtin_ia32_expandsi512_mask: TargetBuiltin<"V16iV16iV16iUs", "ncV:512:", "avx512f">;
def __builtin_ia32_cvtps2pd512_mask: TargetBuiltin<"V8dV8fV8dUcIi", "ncV:512:", "avx512f">;
def __builtin_ia32_compressstoredf512_mask: TargetBuiltin<"vV8d*V8dUc", "nV:512:", "avx512f">;
def __builtin_ia32_compressstoredi512_mask: TargetBuiltin<"vV8Oi*V8OiUc", "nV:512:", "avx512f">;
def __builtin_ia32_compressstorehi512_mask: TargetBuiltin<"vV32s*V32sUi", "nV:512:", "avx512vbmi2">;
def __builtin_ia32_compressstoreqi512_mask: TargetBuiltin<"vV64c*V64cUOi", "nV:512:", "avx512vbmi2">;
def __builtin_ia32_compressstoresf512_mask: TargetBuiltin<"vV16f*V16fUs", "nV:512:", "avx512f">;
def __builtin_ia32_compressstoresi512_mask: TargetBuiltin<"vV16i*V16iUs", "nV:512:", "avx512f">;
def __builtin_ia32_vcvtph2ps_mask: TargetBuiltin<"V4fV8sV4fUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_vcvtph2ps256_mask: TargetBuiltin<"V8fV8sV8fUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_vcvtps2ph_mask: TargetBuiltin<"V8sV4fIiV8sUc", "ncV:128:", "avx512vl">;
def __builtin_ia32_vcvtps2ph256_mask: TargetBuiltin<"V8sV8fIiV8sUc", "ncV:256:", "avx512vl">;
def __builtin_ia32_cvtw2mask512: TargetBuiltin<"UiV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_cvtw2mask128: TargetBuiltin<"UcV8s", "ncV:128:", "avx512bw,avx512vl">;
def __builtin_ia32_cvtw2mask256: TargetBuiltin<"UsV16s", "ncV:256:", "avx512bw,avx512vl">;
def __builtin_ia32_cvtsd2ss_round_mask: TargetBuiltin<"V4fV4fV2dV4fUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_cvtsi2ss32: TargetBuiltin<"V4fV4fiIi", "ncV:128:", "avx512f">;
def __builtin_ia32_cvtss2sd_round_mask: TargetBuiltin<"V2dV2dV4fV2dUcIi", "ncV:128:", "avx512f">;
def __builtin_ia32_cvtusi2ss32: TargetBuiltin<"V4fV4fUiIi", "ncV:128:", "avx512f">;
def __builtin_ia32_vpmultishiftqb512: TargetBuiltin<"V64cV64cV64c", "ncV:512:", "avx512vbmi">;
def __builtin_ia32_vpmultishiftqb128: TargetBuiltin<"V16cV16cV16c", "ncV:128:", "avx512vbmi,avx512vl">;
def __builtin_ia32_vpmultishiftqb256: TargetBuiltin<"V32cV32cV32c", "ncV:256:", "avx512vbmi,avx512vl">;

// bf16 intrinsics
def __builtin_ia32_cvtne2ps2bf16_128: TargetBuiltin<"V8sV4fV4f", "ncV:128:", "avx512bf16,avx512vl">;
def __builtin_ia32_cvtne2ps2bf16_256: TargetBuiltin<"V16sV8fV8f", "ncV:256:", "avx512bf16,avx512vl">;
def __builtin_ia32_cvtne2ps2bf16_512: TargetBuiltin<"V32sV16fV16f", "ncV:512:", "avx512bf16">;
def __builtin_ia32_cvtneps2bf16_128_mask: TargetBuiltin<"V8sV4fV8sUc", "ncV:128:", "avx512bf16,avx512vl">;
def __builtin_ia32_cvtneps2bf16_256_mask: TargetBuiltin<"V8sV8fV8sUc", "ncV:256:", "avx512bf16,avx512vl">;
def __builtin_ia32_cvtneps2bf16_512_mask: TargetBuiltin<"V16sV16fV16sUs", "ncV:512:", "avx512bf16">;
def __builtin_ia32_dpbf16ps_128: TargetBuiltin<"V4fV4fV4iV4i", "ncV:128:", "avx512bf16,avx512vl">;
def __builtin_ia32_dpbf16ps_256: TargetBuiltin<"V8fV8fV8iV8i", "ncV:256:", "avx512bf16,avx512vl">;
def __builtin_ia32_dpbf16ps_512: TargetBuiltin<"V16fV16fV16iV16i", "ncV:512:", "avx512bf16">;
def __builtin_ia32_cvtsbf162ss_32: TargetBuiltin<"fUs", "nc", "avx512bf16">;

def __builtin_ia32_vp2intersect_q_512: TargetBuiltin<"vV8OiV8OiUc*Uc*", "nV:512:", "avx512vp2intersect">;
def __builtin_ia32_vp2intersect_q_256: TargetBuiltin<"vV4OiV4OiUc*Uc*", "nV:256:", "avx512vp2intersect,avx512vl">;
def __builtin_ia32_vp2intersect_q_128: TargetBuiltin<"vV2OiV2OiUc*Uc*", "nV:128:", "avx512vp2intersect,avx512vl">;
def __builtin_ia32_vp2intersect_d_512: TargetBuiltin<"vV16iV16iUs*Us*", "nV:512:", "avx512vp2intersect">;
def __builtin_ia32_vp2intersect_d_256: TargetBuiltin<"vV8iV8iUc*Uc*", "nV:256:", "avx512vp2intersect,avx512vl">;
def __builtin_ia32_vp2intersect_d_128: TargetBuiltin<"vV4iV4iUc*Uc*", "nV:128:", "avx512vp2intersect,avx512vl">;

// generic select intrinsics
def __builtin_ia32_selectb_128: TargetBuiltin<"V16cUsV16cV16c", "ncV:128:", "avx512bw,avx512vl">;
def __builtin_ia32_selectb_256: TargetBuiltin<"V32cUiV32cV32c", "ncV:256:", "avx512bw,avx512vl">;
def __builtin_ia32_selectb_512: TargetBuiltin<"V64cUOiV64cV64c", "ncV:512:", "avx512bw">;
def __builtin_ia32_selectw_128: TargetBuiltin<"V8sUcV8sV8s", "ncV:128:", "avx512bw,avx512vl">;
def __builtin_ia32_selectw_256: TargetBuiltin<"V16sUsV16sV16s", "ncV:256:", "avx512bw,avx512vl">;
def __builtin_ia32_selectw_512: TargetBuiltin<"V32sUiV32sV32s", "ncV:512:", "avx512bw">;
def __builtin_ia32_selectd_128: TargetBuiltin<"V4iUcV4iV4i", "ncV:128:", "avx512vl">;
def __builtin_ia32_selectd_256: TargetBuiltin<"V8iUcV8iV8i", "ncV:256:", "avx512vl">;
def __builtin_ia32_selectd_512: TargetBuiltin<"V16iUsV16iV16i", "ncV:512:", "avx512f">;
def __builtin_ia32_selectq_128: TargetBuiltin<"V2OiUcV2OiV2Oi", "ncV:128:", "avx512vl">;
def __builtin_ia32_selectq_256: TargetBuiltin<"V4OiUcV4OiV4Oi", "ncV:256:", "avx512vl">;
def __builtin_ia32_selectq_512: TargetBuiltin<"V8OiUcV8OiV8Oi", "ncV:512:", "avx512f">;
def __builtin_ia32_selectps_128: TargetBuiltin<"V4fUcV4fV4f", "ncV:128:", "avx512vl">;
def __builtin_ia32_selectps_256: TargetBuiltin<"V8fUcV8fV8f", "ncV:256:", "avx512vl">;
def __builtin_ia32_selectps_512: TargetBuiltin<"V16fUsV16fV16f", "ncV:512:", "avx512f">;
def __builtin_ia32_selectpd_128: TargetBuiltin<"V2dUcV2dV2d", "ncV:128:", "avx512vl">;
def __builtin_ia32_selectpd_256: TargetBuiltin<"V4dUcV4dV4d", "ncV:256:", "avx512vl">;
def __builtin_ia32_selectpd_512: TargetBuiltin<"V8dUcV8dV8d", "ncV:512:", "avx512f">;
def __builtin_ia32_selectss_128: TargetBuiltin<"V4fUcV4fV4f", "ncV:128:", "avx512f">;
def __builtin_ia32_selectsd_128: TargetBuiltin<"V2dUcV2dV2d", "ncV:128:", "avx512f">;

// MONITORX/MWAITX
def __builtin_ia32_monitorx: TargetBuiltin<"vvC*UiUi", "n", "mwaitx">;
def __builtin_ia32_mwaitx: TargetBuiltin<"vUiUiUi", "n", "mwaitx">;

// WAITPKG
def __builtin_ia32_umonitor: TargetBuiltin<"vvC*", "n", "waitpkg">;
def __builtin_ia32_umwait: TargetBuiltin<"UcUiUiUi", "n", "waitpkg">;
def __builtin_ia32_tpause: TargetBuiltin<"UcUiUiUi", "n", "waitpkg">;

// CLZERO
def __builtin_ia32_clzero: TargetBuiltin<"vv*", "n", "clzero">;

// CLDEMOTE
def __builtin_ia32_cldemote: TargetBuiltin<"vvC*", "n", "cldemote">;

// Direct Move
def __builtin_ia32_directstore_u32: TargetBuiltin<"vUi*Ui", "n", "movdiri">;
def __builtin_ia32_movdir64b: TargetBuiltin<"vv*vC*", "n", "movdir64b">;

// PTWRITE
def __builtin_ia32_ptwrite32: TargetBuiltin<"vUi", "n", "ptwrite">;

// INVPCID
def __builtin_ia32_invpcid: TargetBuiltin<"vUiv*", "nc", "invpcid">;

// ENQCMD
def __builtin_ia32_enqcmd: TargetBuiltin<"Ucv*vC*", "n", "enqcmd">;
def __builtin_ia32_enqcmds: TargetBuiltin<"Ucv*vC*", "n", "enqcmd">;

// SERIALIZE
def __builtin_ia32_serialize: TargetBuiltin<"v", "n", "serialize">;

// TSXLDTRK
def __builtin_ia32_xsusldtrk: TargetBuiltin<"v", "n", "tsxldtrk">;
def __builtin_ia32_xresldtrk: TargetBuiltin<"v", "n", "tsxldtrk">;

// MSVC
def _BitScanForward: TargetHeaderBuiltin<"UcUNi*UNi", "nh", "intrin.h", AllMSLanguages, "">;
def _BitScanReverse: TargetHeaderBuiltin<"UcUNi*UNi", "nh", "intrin.h", AllMSLanguages, "">;

def _ReadWriteBarrier: TargetHeaderBuiltin<"v", "nh", "intrin.h", AllMSLanguages, "">;
def _ReadBarrier: TargetHeaderBuiltin<"v", "nh", "intrin.h", AllMSLanguages, "">;
def _WriteBarrier: TargetHeaderBuiltin<"v", "nh", "intrin.h", AllMSLanguages, "">;

def __emul: TargetHeaderBuiltin<"LLiii", "nch", "intrin.h", AllMSLanguages, "">;
def __emulu: TargetHeaderBuiltin<"ULLiUiUi", "nch", "intrin.h", AllMSLanguages, "">;

def _AddressOfReturnAddress: TargetHeaderBuiltin<"v*", "nh", "intrin.h", AllMSLanguages, "">;

def __stosb: TargetHeaderBuiltin<"vUc*Ucz", "nh", "intrin.h", AllMSLanguages, "">;
def __int2c: TargetHeaderBuiltin<"v", "nhr", "intrin.h", AllMSLanguages, "">;
def __ud2: TargetHeaderBuiltin<"v", "nhr", "intrin.h", AllMSLanguages, "">;

def __readfsbyte: TargetHeaderBuiltin<"UcUNi", "nh", "intrin.h", AllMSLanguages, "">;
def __readfsword: TargetHeaderBuiltin<"UsUNi", "nh", "intrin.h", AllMSLanguages, "">;
def __readfsdword: TargetHeaderBuiltin<"UNiUNi", "nh", "intrin.h", AllMSLanguages, "">;
def __readfsqword: TargetHeaderBuiltin<"ULLiUNi", "nh", "intrin.h", AllMSLanguages, "">;

def __readgsbyte: TargetHeaderBuiltin<"UcUNi", "nh", "intrin.h", AllMSLanguages, "">;
def __readgsword: TargetHeaderBuiltin<"UsUNi", "nh", "intrin.h", AllMSLanguages, "">;
def __readgsdword: TargetHeaderBuiltin<"UNiUNi", "nh", "intrin.h", AllMSLanguages, "">;
def __readgsqword: TargetHeaderBuiltin<"ULLiUNi", "nh", "intrin.h", AllMSLanguages, "">;

}
