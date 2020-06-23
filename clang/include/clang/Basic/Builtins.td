//===--- Builtins.td - Builtin function info database -----------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the standard builtin function database.
//
//===----------------------------------------------------------------------===//
// Types of functions are specified via a string.  The first character of the
// string specifies the type of the result and subsequent letters specify the
// types of any arguments as follows:
//  v -> void
//  b -> boolean
//  c -> char
//  s -> short
//  i -> int
//  h -> half
//  f -> float
//  d -> double
//  z -> size_t
//  w -> wchar_t
//  F -> constant CFString
//  G -> id
//  H -> SEL
//  M -> struct objc_super
//  a -> __builtin_va_list
//  A -> "reference" to __builtin_va_list
//  V -> Vector, followed by the number of elements and the base type.
//  q -> Scalable vector, followed by the number of elements and the base type.
//  E -> ext_vector, followed by the number of elements and the base type.
//  X -> _Complex, followed by the base type.
//  Y -> ptrdiff_t
//  P -> FILE
//  J -> jmp_buf
//  SJ -> sigjmp_buf
//  K -> ucontext_t
//  p -> pid_t
//  . -> "...".  This may only occur at the end of the function list.
//
// Types may be prefixed with the following modifiers:
//  L   -> long (e.g. Li for 'long int', Ld for 'long double')
//  LL  -> long long (e.g. LLi for 'long long int', LLd for __float128)
//  LLL -> __int128_t (e.g. LLLi)
//  Z   -> int32_t (require a native 32-bit integer type on the target)
//  W   -> int64_t (require a native 64-bit integer type on the target)
//  N   -> 'int' size if target is LP64, 'L' otherwise.
//  O   -> long for OpenCL targets, long long otherwise.
//  S   -> signed
//  U   -> unsigned
//  I   -> Required to constant fold to an integer constant expression.
//
// Types may be postfixed with the following modifiers:
// * -> pointer (optionally followed by an address space number, if no address
//               space is specified than any address space will be accepted)
// & -> reference (optionally followed by an address space number)
// C -> const
// D -> volatile
//
// Attributes of functions are also specified via strings.  These must be kept
// in sync with the predicates in the Builtin::Context class.  Currently we
// have:
//  n -> nothrow
//  r -> noreturn
//  U -> pure
//  c -> const
//  t -> signature is meaningless, use custom typechecking
//  F -> this is a libc/libm function with a '__builtin_' prefix added.
//  f -> this is a libc/libm function without the '__builtin_' prefix. It can
//       be followed by ':headername:' to state which header this function
//       comes from.
//  h -> this function requires a specific header or an explicit declaration.
//  i -> this is a runtime library implemented function without the
//       '__builtin_' prefix. It will be implemented in compiler-rt or libgcc.
//  p:N: -> this is a printf-like function whose Nth argument is the format
//          string.
//  P:N: -> similar to the p:N: attribute, but the function is like vprintf
//          in that it accepts its arguments as a va_list rather than
//          through an ellipsis
//  s:N: -> this is a scanf-like function whose Nth argument is the format
//          string.
//  S:N: -> similar to the s:N: attribute, but the function is like vscanf
//          in that it accepts its arguments as a va_list rather than
//          through an ellipsis
//  e -> const, but only when -fno-math-errno
//  j -> returns_twice (like setjmp)
//  u -> arguments are not evaluated for their side-effects
//  V:N: -> requires vectors of at least N bits to be legal
//  C<N,M_0,...,M_k> -> callback behavior: argument N is called with argument
//                      M_0, ..., M_k as payload
//  FIXME: gcc has nonnull

include "BuiltinTableGenDefs.inc"

// Standard libc/libm functions:
def __builtin_atan2 : Builtin<"ddd", "Fne">;
def __builtin_atan2f : Builtin<"fff", "Fne">;
def __builtin_atan2l : Builtin<"LdLdLd", "Fne">;
def __builtin_abs : Builtin<"ii", "ncF">;
def __builtin_copysign : Builtin<"ddd", "ncF">;
def __builtin_copysignf : Builtin<"fff", "ncF">;
def __builtin_copysignf16 : Builtin<"hhh", "ncF">;
def __builtin_copysignl : Builtin<"LdLdLd", "ncF">;
def __builtin_copysignf128 : Builtin<"LLdLLdLLd", "ncF">;
def __builtin_fabs : Builtin<"dd", "ncF">;
def __builtin_fabsf : Builtin<"ff", "ncF">;
def __builtin_fabsl : Builtin<"LdLd", "ncF">;
def __builtin_fabsf16 : Builtin<"hh", "ncF">;
def __builtin_fabsf128 : Builtin<"LLdLLd", "ncF">;
def __builtin_fmod : Builtin<"ddd", "Fne">;
def __builtin_fmodf : Builtin<"fff", "Fne">;
def __builtin_fmodf16 : Builtin<"hhh", "Fne">;
def __builtin_fmodl : Builtin<"LdLdLd", "Fne">;
def __builtin_frexp : Builtin<"ddi*", "Fn">;
def __builtin_frexpf : Builtin<"ffi*", "Fn">;
def __builtin_frexpl : Builtin<"LdLdi*", "Fn">;
def __builtin_huge_val : Builtin<"d", "nc">;
def __builtin_huge_valf : Builtin<"f", "nc">;
def __builtin_huge_vall : Builtin<"Ld", "nc">;
def __builtin_huge_valf128 : Builtin<"LLd", "nc">;
def __builtin_inf : Builtin<"d", "nc">;
def __builtin_inff : Builtin<"f", "nc">;
def __builtin_infl : Builtin<"Ld", "nc">;
def __builtin_inff128 : Builtin<"LLd", "nc">;
def __builtin_labs : Builtin<"LiLi", "Fnc">;
def __builtin_llabs : Builtin<"LLiLLi", "Fnc">;
def __builtin_ldexp : Builtin<"ddi", "Fne">;
def __builtin_ldexpf : Builtin<"ffi", "Fne">;
def __builtin_ldexpl : Builtin<"LdLdi", "Fne">;
def __builtin_modf : Builtin<"ddd*", "Fn">;
def __builtin_modff : Builtin<"fff*", "Fn">;
def __builtin_modfl : Builtin<"LdLdLd*", "Fn">;
def __builtin_nan : Builtin<"dcC*", "FnU">;
def __builtin_nanf : Builtin<"fcC*", "FnU">;
def __builtin_nanl : Builtin<"LdcC*", "FnU">;
def __builtin_nanf128 : Builtin<"LLdcC*", "FnU">;
def __builtin_nans : Builtin<"dcC*", "FnU">;
def __builtin_nansf : Builtin<"fcC*", "FnU">;
def __builtin_nansl : Builtin<"LdcC*", "FnU">;
def __builtin_nansf128 : Builtin<"LLdcC*", "FnU">;
def __builtin_powi : Builtin<"ddi", "Fnc">;
def __builtin_powif : Builtin<"ffi", "Fnc">;
def __builtin_powil : Builtin<"LdLdi", "Fnc">;
def __builtin_pow : Builtin<"ddd", "Fne">;
def __builtin_powf : Builtin<"fff", "Fne">;
def __builtin_powf16 : Builtin<"hhh", "Fne">;
def __builtin_powl : Builtin<"LdLdLd", "Fne">;

// Standard unary libc/libm functions with double/float/long double variants:
def __builtin_acos : Builtin<"dd", "Fne">;
def __builtin_acosf : Builtin<"ff", "Fne">;
def __builtin_acosl : Builtin<"LdLd", "Fne">;
def __builtin_acosh : Builtin<"dd", "Fne">;
def __builtin_acoshf : Builtin<"ff", "Fne">;
def __builtin_acoshl : Builtin<"LdLd", "Fne">;
def __builtin_asin : Builtin<"dd", "Fne">;
def __builtin_asinf : Builtin<"ff", "Fne">;
def __builtin_asinl : Builtin<"LdLd", "Fne">;
def __builtin_asinh : Builtin<"dd", "Fne">;
def __builtin_asinhf : Builtin<"ff", "Fne">;
def __builtin_asinhl : Builtin<"LdLd", "Fne">;
def __builtin_atan : Builtin<"dd", "Fne">;
def __builtin_atanf : Builtin<"ff", "Fne">;
def __builtin_atanl : Builtin<"LdLd", "Fne">;
def __builtin_atanh : Builtin<"dd", "Fne">;
def __builtin_atanhf : Builtin<"ff", "Fne">;
def __builtin_atanhl : Builtin<"LdLd", "Fne">;
def __builtin_cbrt : Builtin<"dd", "Fnc">;
def __builtin_cbrtf : Builtin<"ff", "Fnc">;
def __builtin_cbrtl : Builtin<"LdLd", "Fnc">;
def __builtin_ceil : Builtin<"dd", "Fnc">;
def __builtin_ceilf : Builtin<"ff", "Fnc">;
def __builtin_ceilf16 : Builtin<"hh", "Fnc">;
def __builtin_ceill : Builtin<"LdLd", "Fnc">;
def __builtin_cos : Builtin<"dd", "Fne">;
def __builtin_cosf : Builtin<"ff", "Fne">;
def __builtin_cosf16 : Builtin<"hh", "Fne">;
def __builtin_cosh : Builtin<"dd", "Fne">;
def __builtin_coshf : Builtin<"ff", "Fne">;
def __builtin_coshl : Builtin<"LdLd", "Fne">;
def __builtin_cosl : Builtin<"LdLd", "Fne">;
def __builtin_erf : Builtin<"dd", "Fne">;
def __builtin_erff : Builtin<"ff", "Fne">;
def __builtin_erfl : Builtin<"LdLd", "Fne">;
def __builtin_erfc : Builtin<"dd", "Fne">;
def __builtin_erfcf : Builtin<"ff", "Fne">;
def __builtin_erfcl : Builtin<"LdLd", "Fne">;
def __builtin_exp : Builtin<"dd", "Fne">;
def __builtin_expf : Builtin<"ff", "Fne">;
def __builtin_expf16 : Builtin<"hh", "Fne">;
def __builtin_expl : Builtin<"LdLd", "Fne">;
def __builtin_exp2 : Builtin<"dd", "Fne">;
def __builtin_exp2f : Builtin<"ff", "Fne">;
def __builtin_exp2f16 : Builtin<"hh", "Fne">;
def __builtin_exp2l : Builtin<"LdLd", "Fne">;
def __builtin_expm1 : Builtin<"dd", "Fne">;
def __builtin_expm1f : Builtin<"ff", "Fne">;
def __builtin_expm1l : Builtin<"LdLd", "Fne">;
def __builtin_fdim : Builtin<"ddd", "Fne">;
def __builtin_fdimf : Builtin<"fff", "Fne">;
def __builtin_fdiml : Builtin<"LdLdLd", "Fne">;
def __builtin_floor : Builtin<"dd", "Fnc">;
def __builtin_floorf : Builtin<"ff", "Fnc">;
def __builtin_floorf16 : Builtin<"hh", "Fnc">;
def __builtin_floorl : Builtin<"LdLd", "Fnc">;
def __builtin_fma : Builtin<"dddd", "Fne">;
def __builtin_fmaf : Builtin<"ffff", "Fne">;
def __builtin_fmaf16 : Builtin<"hhhh", "Fne">;
def __builtin_fmal : Builtin<"LdLdLdLd", "Fne">;
def __builtin_fmax : Builtin<"ddd", "Fnc">;
def __builtin_fmaxf : Builtin<"fff", "Fnc">;
def __builtin_fmaxf16 : Builtin<"hhh", "Fnc">;
def __builtin_fmaxl : Builtin<"LdLdLd", "Fnc">;
def __builtin_fmin : Builtin<"ddd", "Fnc">;
def __builtin_fminf : Builtin<"fff", "Fnc">;
def __builtin_fminf16 : Builtin<"hhh", "Fnc">;
def __builtin_fminl : Builtin<"LdLdLd", "Fnc">;
def __builtin_hypot : Builtin<"ddd", "Fne">;
def __builtin_hypotf : Builtin<"fff", "Fne">;
def __builtin_hypotl : Builtin<"LdLdLd", "Fne">;
def __builtin_ilogb : Builtin<"id", "Fne">;
def __builtin_ilogbf : Builtin<"if", "Fne">;
def __builtin_ilogbl : Builtin<"iLd", "Fne">;
def __builtin_lgamma : Builtin<"dd", "Fn">;
def __builtin_lgammaf : Builtin<"ff", "Fn">;
def __builtin_lgammal : Builtin<"LdLd", "Fn">;
def __builtin_llrint : Builtin<"LLid", "Fne">;
def __builtin_llrintf : Builtin<"LLif", "Fne">;
def __builtin_llrintl : Builtin<"LLiLd", "Fne">;
def __builtin_llround : Builtin<"LLid", "Fne">;
def __builtin_llroundf : Builtin<"LLif", "Fne">;
def __builtin_llroundl : Builtin<"LLiLd", "Fne">;
def __builtin_log : Builtin<"dd", "Fne">;
def __builtin_log10 : Builtin<"dd", "Fne">;
def __builtin_log10f : Builtin<"ff", "Fne">;
def __builtin_log10f16 : Builtin<"hh", "Fne">;
def __builtin_log10l : Builtin<"LdLd", "Fne">;
def __builtin_log1p : Builtin<"dd", "Fne">;
def __builtin_log1pf : Builtin<"ff", "Fne">;
def __builtin_log1pl : Builtin<"LdLd", "Fne">;
def __builtin_log2 : Builtin<"dd", "Fne">;
def __builtin_log2f : Builtin<"ff", "Fne">;
def __builtin_log2f16 : Builtin<"hh", "Fne">;
def __builtin_log2l : Builtin<"LdLd", "Fne">;
def __builtin_logb : Builtin<"dd", "Fne">;
def __builtin_logbf : Builtin<"ff", "Fne">;
def __builtin_logbl : Builtin<"LdLd", "Fne">;
def __builtin_logf : Builtin<"ff", "Fne">;
def __builtin_logf16 : Builtin<"hh", "Fne">;
def __builtin_logl : Builtin<"LdLd", "Fne">;
def __builtin_lrint : Builtin<"Lid", "Fne">;
def __builtin_lrintf : Builtin<"Lif", "Fne">;
def __builtin_lrintl : Builtin<"LiLd", "Fne">;
def __builtin_lround : Builtin<"Lid", "Fne">;
def __builtin_lroundf : Builtin<"Lif", "Fne">;
def __builtin_lroundl : Builtin<"LiLd", "Fne">;
def __builtin_nearbyint : Builtin<"dd", "Fnc">;
def __builtin_nearbyintf : Builtin<"ff", "Fnc">;
def __builtin_nearbyintl : Builtin<"LdLd", "Fnc">;
def __builtin_nextafter : Builtin<"ddd", "Fne">;
def __builtin_nextafterf : Builtin<"fff", "Fne">;
def __builtin_nextafterl : Builtin<"LdLdLd", "Fne">;
def __builtin_nexttoward : Builtin<"ddLd", "Fne">;
def __builtin_nexttowardf : Builtin<"ffLd", "Fne">;
def __builtin_nexttowardl : Builtin<"LdLdLd", "Fne">;
def __builtin_remainder : Builtin<"ddd", "Fne">;
def __builtin_remainderf : Builtin<"fff", "Fne">;
def __builtin_remainderl : Builtin<"LdLdLd", "Fne">;
def __builtin_remquo : Builtin<"dddi*", "Fn">;
def __builtin_remquof : Builtin<"fffi*", "Fn">;
def __builtin_remquol : Builtin<"LdLdLdi*", "Fn">;
def __builtin_rint : Builtin<"dd", "Fnc">;
def __builtin_rintf : Builtin<"ff", "Fnc">;
def __builtin_rintf16 : Builtin<"hh", "Fnc">;
def __builtin_rintl : Builtin<"LdLd", "Fnc">;
def __builtin_round : Builtin<"dd", "Fnc">;
def __builtin_roundf : Builtin<"ff", "Fnc">;
def __builtin_roundf16 : Builtin<"hh", "Fnc">;
def __builtin_roundl : Builtin<"LdLd", "Fnc">;
def __builtin_scalbln : Builtin<"ddLi", "Fne">;
def __builtin_scalblnf : Builtin<"ffLi", "Fne">;
def __builtin_scalblnl : Builtin<"LdLdLi", "Fne">;
def __builtin_scalbn : Builtin<"ddi", "Fne">;
def __builtin_scalbnf : Builtin<"ffi", "Fne">;
def __builtin_scalbnl : Builtin<"LdLdi", "Fne">;
def __builtin_sin : Builtin<"dd", "Fne">;
def __builtin_sinf : Builtin<"ff", "Fne">;
def __builtin_sinf16 : Builtin<"hh", "Fne">;
def __builtin_sinh : Builtin<"dd", "Fne">;
def __builtin_sinhf : Builtin<"ff", "Fne">;
def __builtin_sinhl : Builtin<"LdLd", "Fne">;
def __builtin_sinl : Builtin<"LdLd", "Fne">;
def __builtin_sqrt : Builtin<"dd", "Fne">;
def __builtin_sqrtf : Builtin<"ff", "Fne">;
def __builtin_sqrtf16 : Builtin<"hh", "Fne">;
def __builtin_sqrtl : Builtin<"LdLd", "Fne">;
def __builtin_tan : Builtin<"dd", "Fne">;
def __builtin_tanf : Builtin<"ff", "Fne">;
def __builtin_tanh : Builtin<"dd", "Fne">;
def __builtin_tanhf : Builtin<"ff", "Fne">;
def __builtin_tanhl : Builtin<"LdLd", "Fne">;
def __builtin_tanl : Builtin<"LdLd", "Fne">;
def __builtin_tgamma : Builtin<"dd", "Fne">;
def __builtin_tgammaf : Builtin<"ff", "Fne">;
def __builtin_tgammal : Builtin<"LdLd", "Fne">;
def __builtin_trunc : Builtin<"dd", "Fnc">;
def __builtin_truncf : Builtin<"ff", "Fnc">;
def __builtin_truncl : Builtin<"LdLd", "Fnc">;
def __builtin_truncf16 : Builtin<"hh", "Fnc">;

// Access to floating point environment
def __builtin_flt_rounds : Builtin<"i", "n">;

// C99 complex builtins
def __builtin_cabs : Builtin<"dXd", "Fne">;
def __builtin_cabsf : Builtin<"fXf", "Fne">;
def __builtin_cabsl : Builtin<"LdXLd", "Fne">;
def __builtin_cacos : Builtin<"XdXd", "Fne">;
def __builtin_cacosf : Builtin<"XfXf", "Fne">;
def __builtin_cacosh : Builtin<"XdXd", "Fne">;
def __builtin_cacoshf : Builtin<"XfXf", "Fne">;
def __builtin_cacoshl : Builtin<"XLdXLd", "Fne">;
def __builtin_cacosl : Builtin<"XLdXLd", "Fne">;
def __builtin_carg : Builtin<"dXd", "Fne">;
def __builtin_cargf : Builtin<"fXf", "Fne">;
def __builtin_cargl : Builtin<"LdXLd", "Fne">;
def __builtin_casin : Builtin<"XdXd", "Fne">;
def __builtin_casinf : Builtin<"XfXf", "Fne">;
def __builtin_casinh : Builtin<"XdXd", "Fne">;
def __builtin_casinhf : Builtin<"XfXf", "Fne">;
def __builtin_casinhl : Builtin<"XLdXLd", "Fne">;
def __builtin_casinl : Builtin<"XLdXLd", "Fne">;
def __builtin_catan : Builtin<"XdXd", "Fne">;
def __builtin_catanf : Builtin<"XfXf", "Fne">;
def __builtin_catanh : Builtin<"XdXd", "Fne">;
def __builtin_catanhf : Builtin<"XfXf", "Fne">;
def __builtin_catanhl : Builtin<"XLdXLd", "Fne">;
def __builtin_catanl : Builtin<"XLdXLd", "Fne">;
def __builtin_ccos : Builtin<"XdXd", "Fne">;
def __builtin_ccosf : Builtin<"XfXf", "Fne">;
def __builtin_ccosl : Builtin<"XLdXLd", "Fne">;
def __builtin_ccosh : Builtin<"XdXd", "Fne">;
def __builtin_ccoshf : Builtin<"XfXf", "Fne">;
def __builtin_ccoshl : Builtin<"XLdXLd", "Fne">;
def __builtin_cexp : Builtin<"XdXd", "Fne">;
def __builtin_cexpf : Builtin<"XfXf", "Fne">;
def __builtin_cexpl : Builtin<"XLdXLd", "Fne">;
def __builtin_cimag : Builtin<"dXd", "Fnc">;
def __builtin_cimagf : Builtin<"fXf", "Fnc">;
def __builtin_cimagl : Builtin<"LdXLd", "Fnc">;
def __builtin_conj : Builtin<"XdXd", "Fnc">;
def __builtin_conjf : Builtin<"XfXf", "Fnc">;
def __builtin_conjl : Builtin<"XLdXLd", "Fnc">;
def __builtin_clog : Builtin<"XdXd", "Fne">;
def __builtin_clogf : Builtin<"XfXf", "Fne">;
def __builtin_clogl : Builtin<"XLdXLd", "Fne">;
def __builtin_cproj : Builtin<"XdXd", "Fnc">;
def __builtin_cprojf : Builtin<"XfXf", "Fnc">;
def __builtin_cprojl : Builtin<"XLdXLd", "Fnc">;
def __builtin_cpow : Builtin<"XdXdXd", "Fne">;
def __builtin_cpowf : Builtin<"XfXfXf", "Fne">;
def __builtin_cpowl : Builtin<"XLdXLdXLd", "Fne">;
def __builtin_creal : Builtin<"dXd", "Fnc">;
def __builtin_crealf : Builtin<"fXf", "Fnc">;
def __builtin_creall : Builtin<"LdXLd", "Fnc">;
def __builtin_csin : Builtin<"XdXd", "Fne">;
def __builtin_csinf : Builtin<"XfXf", "Fne">;
def __builtin_csinl : Builtin<"XLdXLd", "Fne">;
def __builtin_csinh : Builtin<"XdXd", "Fne">;
def __builtin_csinhf : Builtin<"XfXf", "Fne">;
def __builtin_csinhl : Builtin<"XLdXLd", "Fne">;
def __builtin_csqrt : Builtin<"XdXd", "Fne">;
def __builtin_csqrtf : Builtin<"XfXf", "Fne">;
def __builtin_csqrtl : Builtin<"XLdXLd", "Fne">;
def __builtin_ctan : Builtin<"XdXd", "Fne">;
def __builtin_ctanf : Builtin<"XfXf", "Fne">;
def __builtin_ctanl : Builtin<"XLdXLd", "Fne">;
def __builtin_ctanh : Builtin<"XdXd", "Fne">;
def __builtin_ctanhf : Builtin<"XfXf", "Fne">;
def __builtin_ctanhl : Builtin<"XLdXLd", "Fne">;

// FP Comparisons.
def __builtin_isgreater : Builtin<"i.", "Fnct">;
def __builtin_isgreaterequal : Builtin<"i.", "Fnct">;
def __builtin_isless : Builtin<"i.", "Fnct">;
def __builtin_islessequal : Builtin<"i.", "Fnct">;
def __builtin_islessgreater : Builtin<"i.", "Fnct">;
def __builtin_isunordered : Builtin<"i.", "Fnct">;

// Unary FP classification
def __builtin_fpclassify : Builtin<"iiiiii.", "Fnct">;
def __builtin_isfinite : Builtin<"i.", "Fnct">;
def __builtin_isinf : Builtin<"i.", "Fnct">;
def __builtin_isinf_sign : Builtin<"i.", "Fnct">;
def __builtin_isnan : Builtin<"i.", "Fnct">;
def __builtin_isnormal : Builtin<"i.", "Fnct">;

// FP signbit builtins
def __builtin_signbit : Builtin<"i.", "Fnct">;
def __builtin_signbitf : Builtin<"if", "Fnc">;
def __builtin_signbitl : Builtin<"iLd", "Fnc">;

// Special FP builtins.
def __builtin_canonicalize : Builtin<"dd", "nc">;
def __builtin_canonicalizef : Builtin<"ff", "nc">;
def __builtin_canonicalizef16 : Builtin<"hh", "nc">;
def __builtin_canonicalizel : Builtin<"LdLd", "nc">;

// Builtins for arithmetic.
def __builtin_clzs : Builtin<"iUs", "nc">;
def __builtin_clz : Builtin<"iUi", "nc">;
def __builtin_clzl : Builtin<"iULi", "nc">;
def __builtin_clzll : Builtin<"iULLi", "nc">;
// TODO: int clzimax(uintmax_t)
def __builtin_ctzs : Builtin<"iUs", "nc">;
def __builtin_ctz : Builtin<"iUi", "nc">;
def __builtin_ctzl : Builtin<"iULi", "nc">;
def __builtin_ctzll : Builtin<"iULLi", "nc">;
// TODO: int ctzimax(uintmax_t)
def __builtin_ffs : Builtin<"ii", "Fnc">;
def __builtin_ffsl : Builtin<"iLi", "Fnc">;
def __builtin_ffsll : Builtin<"iLLi", "Fnc">;
def __builtin_parity : Builtin<"iUi", "nc">;
def __builtin_parityl : Builtin<"iULi", "nc">;
def __builtin_parityll : Builtin<"iULLi", "nc">;
def __builtin_popcount : Builtin<"iUi", "nc">;
def __builtin_popcountl : Builtin<"iULi", "nc">;
def __builtin_popcountll : Builtin<"iULLi", "nc">;
def __builtin_clrsb : Builtin<"ii", "nc">;
def __builtin_clrsbl : Builtin<"iLi", "nc">;
def __builtin_clrsbll : Builtin<"iLLi", "nc">;

// The following builtins rely on that char == 8 bits, short == 16 bits and that
// there exists native types on the target that are 32- and 64-bits wide, unless
// these conditions are fulfilled these builtins will operate on a not intended
// bitwidth.
def __builtin_bswap16 : Builtin<"UsUs", "nc">;
def __builtin_bswap32 : Builtin<"UZiUZi", "nc">;
def __builtin_bswap64 : Builtin<"UWiUWi", "nc">;

def __builtin_bitreverse8 : Builtin<"UcUc", "nc">;
def __builtin_bitreverse16 : Builtin<"UsUs", "nc">;
def __builtin_bitreverse32 : Builtin<"UZiUZi", "nc">;
def __builtin_bitreverse64 : Builtin<"UWiUWi", "nc">;

def __builtin_rotateleft8 : Builtin<"UcUcUc", "nc">;
def __builtin_rotateleft16 : Builtin<"UsUsUs", "nc">;
def __builtin_rotateleft32 : Builtin<"UZiUZiUZi", "nc">;
def __builtin_rotateleft64 : Builtin<"UWiUWiUWi", "nc">;
def __builtin_rotateright8 : Builtin<"UcUcUc", "nc">;
def __builtin_rotateright16 : Builtin<"UsUsUs", "nc">;
def __builtin_rotateright32 : Builtin<"UZiUZiUZi", "nc">;
def __builtin_rotateright64 : Builtin<"UWiUWiUWi", "nc">;

// Random GCC builtins
def __builtin_constant_p : Builtin<"i.", "nctu">;
def __builtin_classify_type : Builtin<"i.", "nctu">;
def __builtin___CFStringMakeConstantString : Builtin<"FC*cC*", "nc">;
def __builtin___NSStringMakeConstantString : Builtin<"FC*cC*", "nc">;
def __builtin_va_start : Builtin<"vA.", "nt">;
def __builtin_va_end : Builtin<"vA", "n">;
def __builtin_va_copy : Builtin<"vAA", "n">;
def __builtin_stdarg_start : Builtin<"vA.", "nt">;
def __builtin_assume_aligned : Builtin<"v*vC*z.", "nc">;
def __builtin_bcmp : Builtin<"ivC*vC*z", "Fn">;
def __builtin_bcopy : Builtin<"vv*v*z", "n">;
def __builtin_bzero : Builtin<"vv*z", "nF">;
def __builtin_fprintf : Builtin<"iP*cC*.", "Fp:1:">;
def __builtin_memchr : Builtin<"v*vC*iz", "nF">;
def __builtin_memcmp : Builtin<"ivC*vC*z", "nF">;
def __builtin_memcpy : Builtin<"v*v*vC*z", "nF">;
def __builtin_memcpy_inline : Builtin<"vv*vC*Iz", "nt">;
def __builtin_memmove : Builtin<"v*v*vC*z", "nF">;
def __builtin_mempcpy : Builtin<"v*v*vC*z", "nF">;
def __builtin_memset : Builtin<"v*v*iz", "nF">;
def __builtin_printf : Builtin<"icC*.", "Fp:0:">;
def __builtin_stpcpy : Builtin<"c*c*cC*", "nF">;
def __builtin_stpncpy : Builtin<"c*c*cC*z", "nF">;
def __builtin_strcasecmp : Builtin<"icC*cC*", "nF">;
def __builtin_strcat : Builtin<"c*c*cC*", "nF">;
def __builtin_strchr : Builtin<"c*cC*i", "nF">;
def __builtin_strcmp : Builtin<"icC*cC*", "nF">;
def __builtin_strcpy : Builtin<"c*c*cC*", "nF">;
def __builtin_strcspn : Builtin<"zcC*cC*", "nF">;
def __builtin_strdup : Builtin<"c*cC*", "nF">;
def __builtin_strlen : Builtin<"zcC*", "nF">;
def __builtin_strncasecmp : Builtin<"icC*cC*z", "nF">;
def __builtin_strncat : Builtin<"c*c*cC*z", "nF">;
def __builtin_strncmp : Builtin<"icC*cC*z", "nF">;
def __builtin_strncpy : Builtin<"c*c*cC*z", "nF">;
def __builtin_strndup : Builtin<"c*cC*z", "nF">;
def __builtin_strpbrk : Builtin<"c*cC*cC*", "nF">;
def __builtin_strrchr : Builtin<"c*cC*i", "nF">;
def __builtin_strspn : Builtin<"zcC*cC*", "nF">;
def __builtin_strstr : Builtin<"c*cC*cC*", "nF">;
def __builtin_wcschr : Builtin<"w*wC*w", "nF">;
def __builtin_wcscmp : Builtin<"iwC*wC*", "nF">;
def __builtin_wcslen : Builtin<"zwC*", "nF">;
def __builtin_wcsncmp : Builtin<"iwC*wC*z", "nF">;
def __builtin_wmemchr : Builtin<"w*wC*wz", "nF">;
def __builtin_wmemcmp : Builtin<"iwC*wC*z", "nF">;
def __builtin_wmemcpy : Builtin<"w*w*wC*z", "nF">;
def __builtin_wmemmove : Builtin<"w*w*wC*z", "nF">;
def __builtin_return_address : Builtin<"v*IUi", "n">;
def __builtin_extract_return_addr : Builtin<"v*v*", "n">;
def __builtin_frame_address : Builtin<"v*IUi", "n">;
def __builtin___clear_cache : Builtin<"vc*c*", "n">;
def __builtin_setjmp : Builtin<"iv**", "j">;
def __builtin_longjmp : Builtin<"vv**i", "r">;
def __builtin_unwind_init : Builtin<"v", "">;
def __builtin_eh_return_data_regno : Builtin<"iIi", "nc">;
def __builtin_snprintf : Builtin<"ic*zcC*.", "nFp:2:">;
def __builtin_vsprintf : Builtin<"ic*cC*a", "nFP:1:">;
def __builtin_vsnprintf : Builtin<"ic*zcC*a", "nFP:2:">;
def __builtin_thread_pointer : Builtin<"v*", "nc">;
def __builtin_launder : Builtin<"v*v*", "nt">;
def __builtin_is_constant_evaluated : LangBuiltin<"b", "n", CxxLang>;

// GCC exception builtins
def __builtin_eh_return : Builtin<"vzv*", "r">; // FIXME: Takes intptr_t, not size_t!
def __builtin_frob_return_addr : Builtin<"v*v*", "n">;
def __builtin_dwarf_cfa : Builtin<"v*", "n">;
def __builtin_init_dwarf_reg_size_table : Builtin<"vv*", "n">;
def __builtin_dwarf_sp_column : Builtin<"Ui", "n">;
def __builtin_extend_pointer : Builtin<"ULLiv*", "n">; // _Unwind_Word == uint64_t

// GCC Object size checking builtins
def __builtin_object_size : Builtin<"zvC*i", "nu">;
def __builtin_dynamic_object_size : Builtin<"zvC*i", "nu">; // Clang only.
def __builtin___memcpy_chk : Builtin<"v*v*vC*zz", "nF">;
def __builtin___memccpy_chk : Builtin<"v*v*vC*izz", "nF">;
def __builtin___memmove_chk : Builtin<"v*v*vC*zz", "nF">;
def __builtin___mempcpy_chk : Builtin<"v*v*vC*zz", "nF">;
def __builtin___memset_chk : Builtin<"v*v*izz", "nF">;
def __builtin___stpcpy_chk : Builtin<"c*c*cC*z", "nF">;
def __builtin___strcat_chk : Builtin<"c*c*cC*z", "nF">;
def __builtin___strcpy_chk : Builtin<"c*c*cC*z", "nF">;
def __builtin___strlcat_chk : Builtin<"zc*cC*zz", "nF">;
def __builtin___strlcpy_chk : Builtin<"zc*cC*zz", "nF">;
def __builtin___strncat_chk : Builtin<"c*c*cC*zz", "nF">;
def __builtin___strncpy_chk : Builtin<"c*c*cC*zz", "nF">;
def __builtin___stpncpy_chk : Builtin<"c*c*cC*zz", "nF">;
def __builtin___snprintf_chk : Builtin<"ic*zizcC*.", "Fp:4:">;
def __builtin___sprintf_chk : Builtin<"ic*izcC*.", "Fp:3:">;
def __builtin___vsnprintf_chk : Builtin<"ic*zizcC*a", "FP:4:">;
def __builtin___vsprintf_chk : Builtin<"ic*izcC*a", "FP:3:">;
def __builtin___fprintf_chk : Builtin<"iP*icC*.", "Fp:2:">;
def __builtin___printf_chk : Builtin<"iicC*.", "Fp:1:">;
def __builtin___vfprintf_chk : Builtin<"iP*icC*a", "FP:2:">;
def __builtin___vprintf_chk : Builtin<"iicC*a", "FP:1:">;

def __builtin_unpredictable : Builtin<"LiLi", "nc">;
def __builtin_expect : Builtin<"LiLiLi", "nc">;
def __builtin_prefetch : Builtin<"vvC*.", "nc">;
def __builtin_readcyclecounter : Builtin<"ULLi", "n">;
def __builtin_trap : Builtin<"v", "nr">;
def __builtin_debugtrap : Builtin<"v", "n">;
def __builtin_unreachable : Builtin<"v", "nr">;
def __builtin_shufflevector : Builtin<"v.", "nct">;
def __builtin_convertvector : Builtin<"v.", "nct">;
def __builtin_alloca : Builtin<"v*z", "Fn">;
def __builtin_alloca_with_align : Builtin<"v*zIz", "Fn">;
def __builtin_call_with_static_chain : Builtin<"v.", "nt">;

def __builtin_matrix_transpose : Builtin<"v.", "nFt">;

// "Overloaded" Atomic operator builtins.  These are overloaded to support data
// types of i8, i16, i32, i64, and i128.  The front-end sees calls to the
// non-suffixed version of these (which has a bogus type) and transforms them to
// the right overloaded version in Sema (plus casts).

// FIXME: These assume that char -> i8, short -> i16, int -> i32,
// long long -> i64.

def __sync_fetch_and_add : Builtin<"v.", "t">;
def __sync_fetch_and_add_1 : Builtin<"ccD*c.", "nt">;
def __sync_fetch_and_add_2 : Builtin<"ssD*s.", "nt">;
def __sync_fetch_and_add_4 : Builtin<"iiD*i.", "nt">;
def __sync_fetch_and_add_8 : Builtin<"LLiLLiD*LLi.", "nt">;
def __sync_fetch_and_add_16 : Builtin<"LLLiLLLiD*LLLi.", "nt">;

def __sync_fetch_and_sub : Builtin<"v.", "t">;
def __sync_fetch_and_sub_1 : Builtin<"ccD*c.", "nt">;
def __sync_fetch_and_sub_2 : Builtin<"ssD*s.", "nt">;
def __sync_fetch_and_sub_4 : Builtin<"iiD*i.", "nt">;
def __sync_fetch_and_sub_8 : Builtin<"LLiLLiD*LLi.", "nt">;
def __sync_fetch_and_sub_16 : Builtin<"LLLiLLLiD*LLLi.", "nt">;

def __sync_fetch_and_or : Builtin<"v.", "t">;
def __sync_fetch_and_or_1 : Builtin<"ccD*c.", "nt">;
def __sync_fetch_and_or_2 : Builtin<"ssD*s.", "nt">;
def __sync_fetch_and_or_4 : Builtin<"iiD*i.", "nt">;
def __sync_fetch_and_or_8 : Builtin<"LLiLLiD*LLi.", "nt">;
def __sync_fetch_and_or_16 : Builtin<"LLLiLLLiD*LLLi.", "nt">;

def __sync_fetch_and_and : Builtin<"v.", "t">;
def __sync_fetch_and_and_1 : Builtin<"ccD*c.", "tn">;
def __sync_fetch_and_and_2 : Builtin<"ssD*s.", "tn">;
def __sync_fetch_and_and_4 : Builtin<"iiD*i.", "tn">;
def __sync_fetch_and_and_8 : Builtin<"LLiLLiD*LLi.", "tn">;
def __sync_fetch_and_and_16 : Builtin<"LLLiLLLiD*LLLi.", "tn">;

def __sync_fetch_and_xor : Builtin<"v.", "t">;
def __sync_fetch_and_xor_1 : Builtin<"ccD*c.", "tn">;
def __sync_fetch_and_xor_2 : Builtin<"ssD*s.", "tn">;
def __sync_fetch_and_xor_4 : Builtin<"iiD*i.", "tn">;
def __sync_fetch_and_xor_8 : Builtin<"LLiLLiD*LLi.", "tn">;
def __sync_fetch_and_xor_16 : Builtin<"LLLiLLLiD*LLLi.", "tn">;

def __sync_fetch_and_nand : Builtin<"v.", "t">;
def __sync_fetch_and_nand_1 : Builtin<"ccD*c.", "tn">;
def __sync_fetch_and_nand_2 : Builtin<"ssD*s.", "tn">;
def __sync_fetch_and_nand_4 : Builtin<"iiD*i.", "tn">;
def __sync_fetch_and_nand_8 : Builtin<"LLiLLiD*LLi.", "tn">;
def __sync_fetch_and_nand_16 : Builtin<"LLLiLLLiD*LLLi.", "tn">;

def __sync_add_and_fetch : Builtin<"v.", "t">;
def __sync_add_and_fetch_1 : Builtin<"ccD*c.", "tn">;
def __sync_add_and_fetch_2 : Builtin<"ssD*s.", "tn">;
def __sync_add_and_fetch_4 : Builtin<"iiD*i.", "tn">;
def __sync_add_and_fetch_8 : Builtin<"LLiLLiD*LLi.", "tn">;
def __sync_add_and_fetch_16 : Builtin<"LLLiLLLiD*LLLi.", "tn">;

def __sync_sub_and_fetch : Builtin<"v.", "t">;
def __sync_sub_and_fetch_1 : Builtin<"ccD*c.", "tn">;
def __sync_sub_and_fetch_2 : Builtin<"ssD*s.", "tn">;
def __sync_sub_and_fetch_4 : Builtin<"iiD*i.", "tn">;
def __sync_sub_and_fetch_8 : Builtin<"LLiLLiD*LLi.", "tn">;
def __sync_sub_and_fetch_16 : Builtin<"LLLiLLLiD*LLLi.", "tn">;

def __sync_or_and_fetch : Builtin<"v.", "t">;
def __sync_or_and_fetch_1 : Builtin<"ccD*c.", "tn">;
def __sync_or_and_fetch_2 : Builtin<"ssD*s.", "tn">;
def __sync_or_and_fetch_4 : Builtin<"iiD*i.", "tn">;
def __sync_or_and_fetch_8 : Builtin<"LLiLLiD*LLi.", "tn">;
def __sync_or_and_fetch_16 : Builtin<"LLLiLLLiD*LLLi.", "tn">;

def __sync_and_and_fetch : Builtin<"v.", "t">;
def __sync_and_and_fetch_1 : Builtin<"ccD*c.", "tn">;
def __sync_and_and_fetch_2 : Builtin<"ssD*s.", "tn">;
def __sync_and_and_fetch_4 : Builtin<"iiD*i.", "tn">;
def __sync_and_and_fetch_8 : Builtin<"LLiLLiD*LLi.", "tn">;
def __sync_and_and_fetch_16 : Builtin<"LLLiLLLiD*LLLi.", "tn">;

def __sync_xor_and_fetch : Builtin<"v.", "t">;
def __sync_xor_and_fetch_1 : Builtin<"ccD*c.", "tn">;
def __sync_xor_and_fetch_2 : Builtin<"ssD*s.", "tn">;
def __sync_xor_and_fetch_4 : Builtin<"iiD*i.", "tn">;
def __sync_xor_and_fetch_8 : Builtin<"LLiLLiD*LLi.", "tn">;
def __sync_xor_and_fetch_16 : Builtin<"LLLiLLLiD*LLLi.", "tn">;

def __sync_nand_and_fetch : Builtin<"v.", "t">;
def __sync_nand_and_fetch_1 : Builtin<"ccD*c.", "tn">;
def __sync_nand_and_fetch_2 : Builtin<"ssD*s.", "tn">;
def __sync_nand_and_fetch_4 : Builtin<"iiD*i.", "tn">;
def __sync_nand_and_fetch_8 : Builtin<"LLiLLiD*LLi.", "tn">;
def __sync_nand_and_fetch_16 : Builtin<"LLLiLLLiD*LLLi.", "tn">;

def __sync_bool_compare_and_swap : Builtin<"v.", "t">;
def __sync_bool_compare_and_swap_1 : Builtin<"bcD*cc.", "tn">;
def __sync_bool_compare_and_swap_2 : Builtin<"bsD*ss.", "tn">;
def __sync_bool_compare_and_swap_4 : Builtin<"biD*ii.", "tn">;
def __sync_bool_compare_and_swap_8 : Builtin<"bLLiD*LLiLLi.", "tn">;
def __sync_bool_compare_and_swap_16 : Builtin<"bLLLiD*LLLiLLLi.", "tn">;

def __sync_val_compare_and_swap : Builtin<"v.", "t">;
def __sync_val_compare_and_swap_1 : Builtin<"ccD*cc.", "tn">;
def __sync_val_compare_and_swap_2 : Builtin<"ssD*ss.", "tn">;
def __sync_val_compare_and_swap_4 : Builtin<"iiD*ii.", "tn">;
def __sync_val_compare_and_swap_8 : Builtin<"LLiLLiD*LLiLLi.", "tn">;
def __sync_val_compare_and_swap_16 : Builtin<"LLLiLLLiD*LLLiLLLi.", "tn">;

def __sync_lock_test_and_set : Builtin<"v.", "t">;
def __sync_lock_test_and_set_1 : Builtin<"ccD*c.", "tn">;
def __sync_lock_test_and_set_2 : Builtin<"ssD*s.", "tn">;
def __sync_lock_test_and_set_4 : Builtin<"iiD*i.", "tn">;
def __sync_lock_test_and_set_8 : Builtin<"LLiLLiD*LLi.", "tn">;
def __sync_lock_test_and_set_16 : Builtin<"LLLiLLLiD*LLLi.", "tn">;

def __sync_lock_release : Builtin<"v.", "t">;
def __sync_lock_release_1 : Builtin<"vcD*.", "tn">;
def __sync_lock_release_2 : Builtin<"vsD*.", "tn">;
def __sync_lock_release_4 : Builtin<"viD*.", "tn">;
def __sync_lock_release_8 : Builtin<"vLLiD*.", "tn">;
def __sync_lock_release_16 : Builtin<"vLLLiD*.", "tn">;

def __sync_swap : Builtin<"v.", "t">;
def __sync_swap_1 : Builtin<"ccD*c.", "tn">;
def __sync_swap_2 : Builtin<"ssD*s.", "tn">;
def __sync_swap_4 : Builtin<"iiD*i.", "tn">;
def __sync_swap_8 : Builtin<"LLiLLiD*LLi.", "tn">;
def __sync_swap_16 : Builtin<"LLLiLLLiD*LLLi.", "tn">;

// Some of our atomics builtins are handled by AtomicExpr rather than
// as normal builtin CallExprs. This macro is used for such builtins.

// C11 _Atomic operations for <stdatomic.h>.
let Atomic = 1 in {
  def __c11_atomic_init : Builtin<"v.", "t">;
  def __c11_atomic_load : Builtin<"v.", "t">;
  def __c11_atomic_store : Builtin<"v.", "t">;
  def __c11_atomic_exchange : Builtin<"v.", "t">;
  def __c11_atomic_compare_exchange_strong : Builtin<"v.", "t">;
  def __c11_atomic_compare_exchange_weak : Builtin<"v.", "t">;
  def __c11_atomic_fetch_add : Builtin<"v.", "t">;
  def __c11_atomic_fetch_sub : Builtin<"v.", "t">;
  def __c11_atomic_fetch_and : Builtin<"v.", "t">;
  def __c11_atomic_fetch_or : Builtin<"v.", "t">;
  def __c11_atomic_fetch_xor : Builtin<"v.", "t">;
  def __c11_atomic_fetch_max : Builtin<"v.", "t">;
  def __c11_atomic_fetch_min : Builtin<"v.", "t">;
}
def __c11_atomic_thread_fence : Builtin<"vi", "n">;
def __c11_atomic_signal_fence : Builtin<"vi", "n">;
def __c11_atomic_is_lock_free : Builtin<"bz", "n">;

// GNU atomic builtins.
let Atomic = 1 in {
  def __atomic_load : Builtin<"v.", "t">;
  def __atomic_load_n : Builtin<"v.", "t">;
  def __atomic_store : Builtin<"v.", "t">;
  def __atomic_store_n : Builtin<"v.", "t">;
  def __atomic_exchange : Builtin<"v.", "t">;
  def __atomic_exchange_n : Builtin<"v.", "t">;
  def __atomic_compare_exchange : Builtin<"v.", "t">;
  def __atomic_compare_exchange_n : Builtin<"v.", "t">;
  def __atomic_fetch_add : Builtin<"v.", "t">;
  def __atomic_fetch_sub : Builtin<"v.", "t">;
  def __atomic_fetch_and : Builtin<"v.", "t">;
  def __atomic_fetch_or : Builtin<"v.", "t">;
  def __atomic_fetch_xor : Builtin<"v.", "t">;
  def __atomic_fetch_nand : Builtin<"v.", "t">;
  def __atomic_add_fetch : Builtin<"v.", "t">;
  def __atomic_sub_fetch : Builtin<"v.", "t">;
  def __atomic_and_fetch : Builtin<"v.", "t">;
  def __atomic_or_fetch : Builtin<"v.", "t">;
  def __atomic_xor_fetch : Builtin<"v.", "t">;
  def __atomic_max_fetch : Builtin<"v.", "t">;
  def __atomic_min_fetch : Builtin<"v.", "t">;
  def __atomic_nand_fetch : Builtin<"v.", "t">;
}
def __atomic_test_and_set : Builtin<"bvD*i", "n">;
def __atomic_clear : Builtin<"vvD*i", "n">;
def __atomic_thread_fence : Builtin<"vi", "n">;
def __atomic_signal_fence : Builtin<"vi", "n">;
def __atomic_always_lock_free : Builtin<"bzvCD*", "n">;
def __atomic_is_lock_free : Builtin<"bzvCD*", "n">;

// OpenCL 2.0 atomic builtins.
let Atomic = 1 in {
  def __opencl_atomic_init : Builtin<"v.", "t">;
  def __opencl_atomic_load : Builtin<"v.", "t">;
  def __opencl_atomic_store : Builtin<"v.", "t">;
  def __opencl_atomic_exchange : Builtin<"v.", "t">;
  def __opencl_atomic_compare_exchange_strong : Builtin<"v.", "t">;
  def __opencl_atomic_compare_exchange_weak : Builtin<"v.", "t">;
  def __opencl_atomic_fetch_add : Builtin<"v.", "t">;
  def __opencl_atomic_fetch_sub : Builtin<"v.", "t">;
  def __opencl_atomic_fetch_and : Builtin<"v.", "t">;
  def __opencl_atomic_fetch_or : Builtin<"v.", "t">;
  def __opencl_atomic_fetch_xor : Builtin<"v.", "t">;
  def __opencl_atomic_fetch_min : Builtin<"v.", "t">;
  def __opencl_atomic_fetch_max : Builtin<"v.", "t">;

// GCC does not support these, they are a Clang extension.
  def __atomic_fetch_min : Builtin<"v.", "t">;
  def __atomic_fetch_max : Builtin<"v.", "t">;


// Non-overloaded atomic builtins.
}
def __sync_synchronize : Builtin<"v", "n">;
// GCC does not support these, they are a Clang extension.
def __sync_fetch_and_min : Builtin<"iiD*i", "n">;
def __sync_fetch_and_max : Builtin<"iiD*i", "n">;
def __sync_fetch_and_umin : Builtin<"UiUiD*Ui", "n">;
def __sync_fetch_and_umax : Builtin<"UiUiD*Ui", "n">;

// Random libc builtins.
def __builtin_abort : Builtin<"v", "Fnr">;
def __builtin_index : Builtin<"c*cC*i", "Fn">;
def __builtin_rindex : Builtin<"c*cC*i", "Fn">;

// ignored glibc builtin, see https://sourceware.org/bugzilla/show_bug.cgi?id=25399
def __warn_memset_zero_len : Builtin<"v", "nU">;

// Microsoft builtins.  These are only active with -fms-extensions.
def _alloca : LangBuiltin<"v*z", "n", AllMSLanguages>;
def __annotation : LangBuiltin<"wC*.", "n", AllMSLanguages>;
def __assume : LangBuiltin<"vb", "n", AllMSLanguages>;
def _bittest : LangBuiltin<"UcNiC*Ni", "n", AllMSLanguages>;
def _bittestandcomplement : LangBuiltin<"UcNi*Ni", "n", AllMSLanguages>;
def _bittestandreset : LangBuiltin<"UcNi*Ni", "n", AllMSLanguages>;
def _bittestandset : LangBuiltin<"UcNi*Ni", "n", AllMSLanguages>;
def _bittest64 : LangBuiltin<"UcWiC*Wi", "n", AllMSLanguages>;
def _bittestandcomplement64 : LangBuiltin<"UcWi*Wi", "n", AllMSLanguages>;
def _bittestandreset64 : LangBuiltin<"UcWi*Wi", "n", AllMSLanguages>;
def _bittestandset64 : LangBuiltin<"UcWi*Wi", "n", AllMSLanguages>;
def _byteswap_ushort : LibraryBuiltin<"UsUs", "fnc", "stdlib.h", AllMSLanguages>;
def _byteswap_ulong : LibraryBuiltin<"UNiUNi", "fnc", "stdlib.h", AllMSLanguages>;
def _byteswap_uint64 : LibraryBuiltin<"ULLiULLi", "fnc", "stdlib.h", AllMSLanguages>;
def __debugbreak : LangBuiltin<"v", "n", AllMSLanguages>;
def __exception_code : LangBuiltin<"UNi", "n", AllMSLanguages>;
def _exception_code : LangBuiltin<"UNi", "n", AllMSLanguages>;
def __exception_info : LangBuiltin<"v*", "n", AllMSLanguages>;
def _exception_info : LangBuiltin<"v*", "n", AllMSLanguages>;
def __abnormal_termination : LangBuiltin<"i", "n", AllMSLanguages>;
def _abnormal_termination : LangBuiltin<"i", "n", AllMSLanguages>;
def __GetExceptionInfo : LangBuiltin<"v*.", "ntu", AllMSLanguages>;
def _InterlockedAnd8 : LangBuiltin<"ccD*c", "n", AllMSLanguages>;
def _InterlockedAnd16 : LangBuiltin<"ssD*s", "n", AllMSLanguages>;
def _InterlockedAnd : LangBuiltin<"NiNiD*Ni", "n", AllMSLanguages>;
def _InterlockedCompareExchange8 : LangBuiltin<"ccD*cc", "n", AllMSLanguages>;
def _InterlockedCompareExchange16 : LangBuiltin<"ssD*ss", "n", AllMSLanguages>;
def _InterlockedCompareExchange : LangBuiltin<"NiNiD*NiNi", "n", AllMSLanguages>;
def _InterlockedCompareExchange64 : LangBuiltin<"LLiLLiD*LLiLLi", "n", AllMSLanguages>;
def _InterlockedCompareExchangePointer : LangBuiltin<"v*v*D*v*v*", "n", AllMSLanguages>;
def _InterlockedCompareExchangePointer_nf : LangBuiltin<"v*v*D*v*v*", "n", AllMSLanguages>;
def _InterlockedDecrement16 : LangBuiltin<"ssD*", "n", AllMSLanguages>;
def _InterlockedDecrement : LangBuiltin<"NiNiD*", "n", AllMSLanguages>;
def _InterlockedExchange : LangBuiltin<"NiNiD*Ni", "n", AllMSLanguages>;
def _InterlockedExchange8 : LangBuiltin<"ccD*c", "n", AllMSLanguages>;
def _InterlockedExchange16 : LangBuiltin<"ssD*s", "n", AllMSLanguages>;
def _InterlockedExchangeAdd8 : LangBuiltin<"ccD*c", "n", AllMSLanguages>;
def _InterlockedExchangeAdd16 : LangBuiltin<"ssD*s", "n", AllMSLanguages>;
def _InterlockedExchangeAdd : LangBuiltin<"NiNiD*Ni", "n", AllMSLanguages>;
def _InterlockedExchangePointer : LangBuiltin<"v*v*D*v*", "n", AllMSLanguages>;
def _InterlockedExchangeSub8 : LangBuiltin<"ccD*c", "n", AllMSLanguages>;
def _InterlockedExchangeSub16 : LangBuiltin<"ssD*s", "n", AllMSLanguages>;
def _InterlockedExchangeSub : LangBuiltin<"NiNiD*Ni", "n", AllMSLanguages>;
def _InterlockedIncrement16 : LangBuiltin<"ssD*", "n", AllMSLanguages>;
def _InterlockedIncrement : LangBuiltin<"NiNiD*", "n", AllMSLanguages>;
def _InterlockedOr8 : LangBuiltin<"ccD*c", "n", AllMSLanguages>;
def _InterlockedOr16 : LangBuiltin<"ssD*s", "n", AllMSLanguages>;
def _InterlockedOr : LangBuiltin<"NiNiD*Ni", "n", AllMSLanguages>;
def _InterlockedXor8 : LangBuiltin<"ccD*c", "n", AllMSLanguages>;
def _InterlockedXor16 : LangBuiltin<"ssD*s", "n", AllMSLanguages>;
def _InterlockedXor : LangBuiltin<"NiNiD*Ni", "n", AllMSLanguages>;
def _interlockedbittestandreset : LangBuiltin<"UcNiD*Ni", "n", AllMSLanguages>;
def _interlockedbittestandreset64 : LangBuiltin<"UcWiD*Wi", "n", AllMSLanguages>;
def _interlockedbittestandreset_acq : LangBuiltin<"UcNiD*Ni", "n", AllMSLanguages>;
def _interlockedbittestandreset_nf : LangBuiltin<"UcNiD*Ni", "n", AllMSLanguages>;
def _interlockedbittestandreset_rel : LangBuiltin<"UcNiD*Ni", "n", AllMSLanguages>;
def _interlockedbittestandset : LangBuiltin<"UcNiD*Ni", "n", AllMSLanguages>;
def _interlockedbittestandset64 : LangBuiltin<"UcWiD*Wi", "n", AllMSLanguages>;
def _interlockedbittestandset_acq : LangBuiltin<"UcNiD*Ni", "n", AllMSLanguages>;
def _interlockedbittestandset_nf : LangBuiltin<"UcNiD*Ni", "n", AllMSLanguages>;
def _interlockedbittestandset_rel : LangBuiltin<"UcNiD*Ni", "n", AllMSLanguages>;
def __iso_volatile_load8 : LangBuiltin<"ccCD*", "n", AllMSLanguages>;
def __iso_volatile_load16 : LangBuiltin<"ssCD*", "n", AllMSLanguages>;
def __iso_volatile_load32 : LangBuiltin<"iiCD*", "n", AllMSLanguages>;
def __iso_volatile_load64 : LangBuiltin<"LLiLLiCD*", "n", AllMSLanguages>;
def __iso_volatile_store8 : LangBuiltin<"vcD*c", "n", AllMSLanguages>;
def __iso_volatile_store16 : LangBuiltin<"vsD*s", "n", AllMSLanguages>;
def __iso_volatile_store32 : LangBuiltin<"viD*i", "n", AllMSLanguages>;
def __iso_volatile_store64 : LangBuiltin<"vLLiD*LLi", "n", AllMSLanguages>;
def __noop : LangBuiltin<"i.", "n", AllMSLanguages>;
def __lzcnt16 : LangBuiltin<"UsUs", "nc", AllMSLanguages>;
def __lzcnt : LangBuiltin<"UiUi", "nc", AllMSLanguages>;
def __lzcnt64 : LangBuiltin<"UWiUWi", "nc", AllMSLanguages>;
def __popcnt16 : LangBuiltin<"UsUs", "nc", AllMSLanguages>;
def __popcnt : LangBuiltin<"UiUi", "nc", AllMSLanguages>;
def __popcnt64 : LangBuiltin<"UWiUWi", "nc", AllMSLanguages>;
def _ReturnAddress : LangBuiltin<"v*", "n", AllMSLanguages>;
def _rotl8 : LangBuiltin<"UcUcUc", "n", AllMSLanguages>;
def _rotl16 : LangBuiltin<"UsUsUc", "n", AllMSLanguages>;
def _rotl : LangBuiltin<"UiUii", "n", AllMSLanguages>;
def _lrotl : LangBuiltin<"ULiULii", "n", AllMSLanguages>;
def _rotl64 : LangBuiltin<"UWiUWii", "n", AllMSLanguages>;
def _rotr8 : LangBuiltin<"UcUcUc", "n", AllMSLanguages>;
def _rotr16 : LangBuiltin<"UsUsUc", "n", AllMSLanguages>;
def _rotr : LangBuiltin<"UiUii", "n", AllMSLanguages>;
def _lrotr : LangBuiltin<"ULiULii", "n", AllMSLanguages>;
def _rotr64 : LangBuiltin<"UWiUWii", "n", AllMSLanguages>;
def __va_start : LangBuiltin<"vc**.", "nt", AllMSLanguages>;
def __fastfail : LangBuiltin<"vUi", "nr", AllMSLanguages>;

// Microsoft library builtins.
def _setjmpex : LibraryBuiltin<"iJ", "fj", "setjmpex.h", AllMSLanguages>;

// C99 library functions
// C99 stdarg.h
def va_start : LibraryBuiltin<"vA.", "fn", "stdarg.h", AllLanguages>;
def va_end : LibraryBuiltin<"vA", "fn", "stdarg.h", AllLanguages>;
def va_copy : LibraryBuiltin<"vAA", "fn", "stdarg.h", AllLanguages>;
// C99 stdlib.h
def abort : LibraryBuiltin<"v", "fr", "stdlib.h", AllLanguages>;
def calloc : LibraryBuiltin<"v*zz", "f", "stdlib.h", AllLanguages>;
def exit : LibraryBuiltin<"vi", "fr", "stdlib.h", AllLanguages>;
def _Exit : LibraryBuiltin<"vi", "fr", "stdlib.h", AllLanguages>;
def malloc : LibraryBuiltin<"v*z", "f", "stdlib.h", AllLanguages>;
def realloc : LibraryBuiltin<"v*v*z", "f", "stdlib.h", AllLanguages>;
def strtod : LibraryBuiltin<"dcC*c**", "f", "stdlib.h", AllLanguages>;
def strtof : LibraryBuiltin<"fcC*c**", "f", "stdlib.h", AllLanguages>;
def strtold : LibraryBuiltin<"LdcC*c**", "f", "stdlib.h", AllLanguages>;
def strtol : LibraryBuiltin<"LicC*c**i", "f", "stdlib.h", AllLanguages>;
def strtoll : LibraryBuiltin<"LLicC*c**i", "f", "stdlib.h", AllLanguages>;
def strtoul : LibraryBuiltin<"ULicC*c**i", "f", "stdlib.h", AllLanguages>;
def strtoull : LibraryBuiltin<"ULLicC*c**i", "f", "stdlib.h", AllLanguages>;
// C99 string.h
def memcpy : LibraryBuiltin<"v*v*vC*z", "f", "string.h", AllLanguages>;
def memcmp : LibraryBuiltin<"ivC*vC*z", "f", "string.h", AllLanguages>;
def memmove : LibraryBuiltin<"v*v*vC*z", "f", "string.h", AllLanguages>;
def strcpy : LibraryBuiltin<"c*c*cC*", "f", "string.h", AllLanguages>;
def strncpy : LibraryBuiltin<"c*c*cC*z", "f", "string.h", AllLanguages>;
def strcmp : LibraryBuiltin<"icC*cC*", "f", "string.h", AllLanguages>;
def strncmp : LibraryBuiltin<"icC*cC*z", "f", "string.h", AllLanguages>;
def strcat : LibraryBuiltin<"c*c*cC*", "f", "string.h", AllLanguages>;
def strncat : LibraryBuiltin<"c*c*cC*z", "f", "string.h", AllLanguages>;
def strxfrm : LibraryBuiltin<"zc*cC*z", "f", "string.h", AllLanguages>;
def memchr : LibraryBuiltin<"v*vC*iz", "f", "string.h", AllLanguages>;
def strchr : LibraryBuiltin<"c*cC*i", "f", "string.h", AllLanguages>;
def strcspn : LibraryBuiltin<"zcC*cC*", "f", "string.h", AllLanguages>;
def strpbrk : LibraryBuiltin<"c*cC*cC*", "f", "string.h", AllLanguages>;
def strrchr : LibraryBuiltin<"c*cC*i", "f", "string.h", AllLanguages>;
def strspn : LibraryBuiltin<"zcC*cC*", "f", "string.h", AllLanguages>;
def strstr : LibraryBuiltin<"c*cC*cC*", "f", "string.h", AllLanguages>;
def strtok : LibraryBuiltin<"c*c*cC*", "f", "string.h", AllLanguages>;
def memset : LibraryBuiltin<"v*v*iz", "f", "string.h", AllLanguages>;
def strerror : LibraryBuiltin<"c*i", "f", "string.h", AllLanguages>;
def strlen : LibraryBuiltin<"zcC*", "f", "string.h", AllLanguages>;
// C99 stdio.h
// FIXME: This list is incomplete.
def printf : LibraryBuiltin<"icC*.", "fp:0:", "stdio.h", AllLanguages>;
def fprintf : LibraryBuiltin<"iP*cC*.", "fp:1:", "stdio.h", AllLanguages>;
def snprintf : LibraryBuiltin<"ic*zcC*.", "fp:2:", "stdio.h", AllLanguages>;
def sprintf : LibraryBuiltin<"ic*cC*.", "fp:1:", "stdio.h", AllLanguages>;
def vprintf : LibraryBuiltin<"icC*a", "fP:0:", "stdio.h", AllLanguages>;
def vfprintf : LibraryBuiltin<"iP*cC*a", "fP:1:", "stdio.h", AllLanguages>;
def vsnprintf : LibraryBuiltin<"ic*zcC*a", "fP:2:", "stdio.h", AllLanguages>;
def vsprintf : LibraryBuiltin<"ic*cC*a", "fP:1:", "stdio.h", AllLanguages>;
def scanf : LibraryBuiltin<"icC*R.", "fs:0:", "stdio.h", AllLanguages>;
def fscanf : LibraryBuiltin<"iP*RcC*R.", "fs:1:", "stdio.h", AllLanguages>;
def sscanf : LibraryBuiltin<"icC*RcC*R.", "fs:1:", "stdio.h", AllLanguages>;
def vscanf : LibraryBuiltin<"icC*Ra", "fS:0:", "stdio.h", AllLanguages>;
def vfscanf : LibraryBuiltin<"iP*RcC*Ra", "fS:1:", "stdio.h", AllLanguages>;
def vsscanf : LibraryBuiltin<"icC*RcC*Ra", "fS:1:", "stdio.h", AllLanguages>;
def fopen : LibraryBuiltin<"P*cC*cC*", "f", "stdio.h", AllLanguages>;
def fread : LibraryBuiltin<"zv*zzP*", "f", "stdio.h", AllLanguages>;
def fwrite : LibraryBuiltin<"zvC*zzP*", "f", "stdio.h", AllLanguages>;

// C99 ctype.h
def isalnum : LibraryBuiltin<"ii", "fnU", "ctype.h", AllLanguages>;
def isalpha : LibraryBuiltin<"ii", "fnU", "ctype.h", AllLanguages>;
def isblank : LibraryBuiltin<"ii", "fnU", "ctype.h", AllLanguages>;
def iscntrl : LibraryBuiltin<"ii", "fnU", "ctype.h", AllLanguages>;
def isdigit : LibraryBuiltin<"ii", "fnU", "ctype.h", AllLanguages>;
def isgraph : LibraryBuiltin<"ii", "fnU", "ctype.h", AllLanguages>;
def islower : LibraryBuiltin<"ii", "fnU", "ctype.h", AllLanguages>;
def isprint : LibraryBuiltin<"ii", "fnU", "ctype.h", AllLanguages>;
def ispunct : LibraryBuiltin<"ii", "fnU", "ctype.h", AllLanguages>;
def isspace : LibraryBuiltin<"ii", "fnU", "ctype.h", AllLanguages>;
def isupper : LibraryBuiltin<"ii", "fnU", "ctype.h", AllLanguages>;
def isxdigit : LibraryBuiltin<"ii", "fnU", "ctype.h", AllLanguages>;
def tolower : LibraryBuiltin<"ii", "fnU", "ctype.h", AllLanguages>;
def toupper : LibraryBuiltin<"ii", "fnU", "ctype.h", AllLanguages>;
// C99 wchar.h
// FIXME: This list is incomplete. We should cover at least the functions that
// take format strings.
def wcschr : LibraryBuiltin<"w*wC*w", "f", "wchar.h", AllLanguages>;
def wcscmp : LibraryBuiltin<"iwC*wC*", "f", "wchar.h", AllLanguages>;
def wcslen : LibraryBuiltin<"zwC*", "f", "wchar.h", AllLanguages>;
def wcsncmp : LibraryBuiltin<"iwC*wC*z", "f", "wchar.h", AllLanguages>;
def wmemchr : LibraryBuiltin<"w*wC*wz", "f", "wchar.h", AllLanguages>;
def wmemcmp : LibraryBuiltin<"iwC*wC*z", "f", "wchar.h", AllLanguages>;
def wmemcpy : LibraryBuiltin<"w*w*wC*z", "f", "wchar.h", AllLanguages>;
def wmemmove : LibraryBuiltin<"w*w*wC*z", "f", "wchar.h", AllLanguages>;

// C99
// In some systems setjmp is a macro that expands to _setjmp. We undefine
// it here to avoid having two identical LIBBUILTIN entries.
def setjmp : LibraryBuiltin<"iJ", "fj", "setjmp.h", AllLanguages>;
def longjmp : LibraryBuiltin<"vJi", "fr", "setjmp.h", AllLanguages>;

// Non-C library functions, active in GNU mode only.
// Functions with (returns_twice) attribute (marked as "j") are still active in
// all languages, because losing this attribute would result in miscompilation
// when these functions are used in non-GNU mode. PR16138.
def alloca : LibraryBuiltin<"v*z", "f", "stdlib.h", AllGnuLanguages>;
// POSIX string.h
def memccpy : LibraryBuiltin<"v*v*vC*iz", "f", "string.h", AllGnuLanguages>;
def mempcpy : LibraryBuiltin<"v*v*vC*z", "f", "string.h", AllGnuLanguages>;
def stpcpy : LibraryBuiltin<"c*c*cC*", "f", "string.h", AllGnuLanguages>;
def stpncpy : LibraryBuiltin<"c*c*cC*z", "f", "string.h", AllGnuLanguages>;
def strdup : LibraryBuiltin<"c*cC*", "f", "string.h", AllGnuLanguages>;
def strndup : LibraryBuiltin<"c*cC*z", "f", "string.h", AllGnuLanguages>;
// POSIX strings.h
def index : LibraryBuiltin<"c*cC*i", "f", "strings.h", AllGnuLanguages>;
def rindex : LibraryBuiltin<"c*cC*i", "f", "strings.h", AllGnuLanguages>;
def bzero : LibraryBuiltin<"vv*z", "f", "strings.h", AllGnuLanguages>;
def bcmp : LibraryBuiltin<"ivC*vC*z", "f", "strings.h", AllGnuLanguages>;
// In some systems str[n]casejmp is a macro that expands to _str[n]icmp.
// We undefine then here to avoid wrong name.
def strcasecmp : LibraryBuiltin<"icC*cC*", "f", "strings.h", AllGnuLanguages>;
def strncasecmp : LibraryBuiltin<"icC*cC*z", "f", "strings.h", AllGnuLanguages>;
// POSIX unistd.h
def _exit : LibraryBuiltin<"vi", "fr", "unistd.h", AllGnuLanguages>;
def vfork : LibraryBuiltin<"p", "fj", "unistd.h", AllLanguages>;
// POSIX pthread.h
def pthread_create : LibraryBuiltin<"", "fC<2,3>", "pthread.h", AllGnuLanguages>;

// POSIX setjmp.h

def _setjmp : LibraryBuiltin<"iJ", "fj", "setjmp.h", AllLanguages>;
def __sigsetjmp : LibraryBuiltin<"iSJi", "fj", "setjmp.h", AllLanguages>;
def sigsetjmp : LibraryBuiltin<"iSJi", "fj", "setjmp.h", AllLanguages>;
def savectx : LibraryBuiltin<"iJ", "fj", "setjmp.h", AllLanguages>;
def getcontext : LibraryBuiltin<"iK*", "fj", "setjmp.h", AllLanguages>;

def _longjmp : LibraryBuiltin<"vJi", "fr", "setjmp.h", AllGnuLanguages>;
def siglongjmp : LibraryBuiltin<"vSJi", "fr", "setjmp.h", AllGnuLanguages>;
// non-standard but very common
def strlcpy : LibraryBuiltin<"zc*cC*z", "f", "string.h", AllGnuLanguages>;
def strlcat : LibraryBuiltin<"zc*cC*z", "f", "string.h", AllGnuLanguages>;
//   id objc_msgSend(id, SEL, ...)
def objc_msgSend : LibraryBuiltin<"GGH.", "f", "objc/message.h", ObjcLang>;
// long double objc_msgSend_fpret(id self, SEL op, ...)
def objc_msgSend_fpret : LibraryBuiltin<"LdGH.", "f", "objc/message.h", ObjcLang>;
// _Complex long double objc_msgSend_fp2ret(id self, SEL op, ...)
def objc_msgSend_fp2ret : LibraryBuiltin<"XLdGH.", "f", "objc/message.h", ObjcLang>;
// void objc_msgSend_stret (id, SEL, ...)
def objc_msgSend_stret : LibraryBuiltin<"vGH.", "f", "objc/message.h", ObjcLang>;
// id objc_msgSendSuper(struct objc_super *super, SEL op, ...)
def objc_msgSendSuper : LibraryBuiltin<"GM*H.", "f", "objc/message.h", ObjcLang>;
// void objc_msgSendSuper_stret(struct objc_super *super, SEL op, ...)
def objc_msgSendSuper_stret : LibraryBuiltin<"vM*H.", "f", "objc/message.h", ObjcLang>;
//   id objc_getClass(const char *name)
def objc_getClass : LibraryBuiltin<"GcC*", "f", "objc/runtime.h", ObjcLang>;
//   id objc_getMetaClass(const char *name)
def objc_getMetaClass : LibraryBuiltin<"GcC*", "f", "objc/runtime.h", ObjcLang>;
// void objc_enumerationMutation(id)
def objc_enumerationMutation : LibraryBuiltin<"vG", "f", "objc/runtime.h", ObjcLang>;

// id objc_read_weak(id *location)
def objc_read_weak : LibraryBuiltin<"GG*", "f", "objc/objc-auto.h", ObjcLang>;
// id objc_assign_weak(id value, id *location)
def objc_assign_weak : LibraryBuiltin<"GGG*", "f", "objc/objc-auto.h", ObjcLang>;
// id objc_assign_ivar(id value, id dest, ptrdiff_t offset)
def objc_assign_ivar : LibraryBuiltin<"GGGY", "f", "objc/objc-auto.h", ObjcLang>;
// id objc_assign_global(id val, id *dest)
def objc_assign_global : LibraryBuiltin<"GGG*", "f", "objc/objc-auto.h", ObjcLang>;
// id objc_assign_strongCast(id val, id *dest
def objc_assign_strongCast : LibraryBuiltin<"GGG*", "f", "objc/objc-auto.h", ObjcLang>;

// id objc_exception_extract(void *localExceptionData)
def objc_exception_extract : LibraryBuiltin<"Gv*", "f", "objc/objc-exception.h", ObjcLang>;
// void objc_exception_try_enter(void *localExceptionData)
def objc_exception_try_enter : LibraryBuiltin<"vv*", "f", "objc/objc-exception.h", ObjcLang>;
// void objc_exception_try_exit(void *localExceptionData)
def objc_exception_try_exit : LibraryBuiltin<"vv*", "f", "objc/objc-exception.h", ObjcLang>;
// int objc_exception_match(Class exceptionClass, id exception)
def objc_exception_match : LibraryBuiltin<"iGG", "f", "objc/objc-exception.h", ObjcLang>;
// void objc_exception_throw(id exception)
def objc_exception_throw : LibraryBuiltin<"vG", "f", "objc/objc-exception.h", ObjcLang>;

// int objc_sync_enter(id obj)
def objc_sync_enter : LibraryBuiltin<"iG", "f", "objc/objc-sync.h", ObjcLang>;
// int objc_sync_exit(id obj)
def objc_sync_exit : LibraryBuiltin<"iG", "f", "objc/objc-sync.h", ObjcLang>;

def __builtin_objc_memmove_collectable : Builtin<"v*v*vC*z", "nF">;

// void NSLog(NSString *fmt, ...)
def NSLog : LibraryBuiltin<"vG.", "fp:0:", "Foundation/NSObjCRuntime.h", ObjcLang>;
// void NSLogv(NSString *fmt, va_list args)
def NSLogv : LibraryBuiltin<"vGa", "fP:0:", "Foundation/NSObjCRuntime.h", ObjcLang>;

// Builtin math library functions
def atan2 : LibraryBuiltin<"ddd", "fne", "math.h", AllLanguages>;
def atan2f : LibraryBuiltin<"fff", "fne", "math.h", AllLanguages>;
def atan2l : LibraryBuiltin<"LdLdLd", "fne", "math.h", AllLanguages>;

def abs : LibraryBuiltin<"ii", "fnc", "stdlib.h", AllLanguages>;
def labs : LibraryBuiltin<"LiLi", "fnc", "stdlib.h", AllLanguages>;
def llabs : LibraryBuiltin<"LLiLLi", "fnc", "stdlib.h", AllLanguages>;

def copysign : LibraryBuiltin<"ddd", "fnc", "math.h", AllLanguages>;
def copysignf : LibraryBuiltin<"fff", "fnc", "math.h", AllLanguages>;
def copysignl : LibraryBuiltin<"LdLdLd", "fnc", "math.h", AllLanguages>;

def fabs : LibraryBuiltin<"dd", "fnc", "math.h", AllLanguages>;
def fabsf : LibraryBuiltin<"ff", "fnc", "math.h", AllLanguages>;
def fabsl : LibraryBuiltin<"LdLd", "fnc", "math.h", AllLanguages>;

// Some systems define finitef as alias of _finitef.
def finite : LibraryBuiltin<"id", "fnc", "math.h", GnuLang>;
def finitef : LibraryBuiltin<"if", "fnc", "math.h", GnuLang>;
def finitel : LibraryBuiltin<"iLd", "fnc", "math.h", GnuLang>;
// glibc's math.h generates calls to __finite
def __finite : LibraryBuiltin<"id", "fnc", "math.h", AllLanguages>;
def __finitef : LibraryBuiltin<"if", "fnc", "math.h", AllLanguages>;
def __finitel : LibraryBuiltin<"iLd", "fnc", "math.h", AllLanguages>;

def fmod : LibraryBuiltin<"ddd", "fne", "math.h", AllLanguages>;
def fmodf : LibraryBuiltin<"fff", "fne", "math.h", AllLanguages>;
def fmodl : LibraryBuiltin<"LdLdLd", "fne", "math.h", AllLanguages>;

def frexp : LibraryBuiltin<"ddi*", "fn", "math.h", AllLanguages>;
def frexpf : LibraryBuiltin<"ffi*", "fn", "math.h", AllLanguages>;
def frexpl : LibraryBuiltin<"LdLdi*", "fn", "math.h", AllLanguages>;

def ldexp : LibraryBuiltin<"ddi", "fne", "math.h", AllLanguages>;
def ldexpf : LibraryBuiltin<"ffi", "fne", "math.h", AllLanguages>;
def ldexpl : LibraryBuiltin<"LdLdi", "fne", "math.h", AllLanguages>;

def modf : LibraryBuiltin<"ddd*", "fn", "math.h", AllLanguages>;
def modff : LibraryBuiltin<"fff*", "fn", "math.h", AllLanguages>;
def modfl : LibraryBuiltin<"LdLdLd*", "fn", "math.h", AllLanguages>;

def nan : LibraryBuiltin<"dcC*", "fUn", "math.h", AllLanguages>;
def nanf : LibraryBuiltin<"fcC*", "fUn", "math.h", AllLanguages>;
def nanl : LibraryBuiltin<"LdcC*", "fUn", "math.h", AllLanguages>;

def pow : LibraryBuiltin<"ddd", "fne", "math.h", AllLanguages>;
def powf : LibraryBuiltin<"fff", "fne", "math.h", AllLanguages>;
def powl : LibraryBuiltin<"LdLdLd", "fne", "math.h", AllLanguages>;

def acos : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def acosf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def acosl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def acosh : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def acoshf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def acoshl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def asin : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def asinf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def asinl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def asinh : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def asinhf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def asinhl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def atan : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def atanf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def atanl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def atanh : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def atanhf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def atanhl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def cbrt : LibraryBuiltin<"dd", "fnc", "math.h", AllLanguages>;
def cbrtf : LibraryBuiltin<"ff", "fnc", "math.h", AllLanguages>;
def cbrtl : LibraryBuiltin<"LdLd", "fnc", "math.h", AllLanguages>;

def ceil : LibraryBuiltin<"dd", "fnc", "math.h", AllLanguages>;
def ceilf : LibraryBuiltin<"ff", "fnc", "math.h", AllLanguages>;
def ceill : LibraryBuiltin<"LdLd", "fnc", "math.h", AllLanguages>;

def cos : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def cosf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def cosl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def cosh : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def coshf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def coshl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def erf : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def erff : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def erfl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def erfc : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def erfcf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def erfcl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def exp : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def expf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def expl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def exp2 : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def exp2f : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def exp2l : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def expm1 : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def expm1f : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def expm1l : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def fdim : LibraryBuiltin<"ddd", "fne", "math.h", AllLanguages>;
def fdimf : LibraryBuiltin<"fff", "fne", "math.h", AllLanguages>;
def fdiml : LibraryBuiltin<"LdLdLd", "fne", "math.h", AllLanguages>;

def floor : LibraryBuiltin<"dd", "fnc", "math.h", AllLanguages>;
def floorf : LibraryBuiltin<"ff", "fnc", "math.h", AllLanguages>;
def floorl : LibraryBuiltin<"LdLd", "fnc", "math.h", AllLanguages>;

def fma : LibraryBuiltin<"dddd", "fne", "math.h", AllLanguages>;
def fmaf : LibraryBuiltin<"ffff", "fne", "math.h", AllLanguages>;
def fmal : LibraryBuiltin<"LdLdLdLd", "fne", "math.h", AllLanguages>;

def fmax : LibraryBuiltin<"ddd", "fnc", "math.h", AllLanguages>;
def fmaxf : LibraryBuiltin<"fff", "fnc", "math.h", AllLanguages>;
def fmaxl : LibraryBuiltin<"LdLdLd", "fnc", "math.h", AllLanguages>;

def fmin : LibraryBuiltin<"ddd", "fnc", "math.h", AllLanguages>;
def fminf : LibraryBuiltin<"fff", "fnc", "math.h", AllLanguages>;
def fminl : LibraryBuiltin<"LdLdLd", "fnc", "math.h", AllLanguages>;

def hypot : LibraryBuiltin<"ddd", "fne", "math.h", AllLanguages>;
def hypotf : LibraryBuiltin<"fff", "fne", "math.h", AllLanguages>;
def hypotl : LibraryBuiltin<"LdLdLd", "fne", "math.h", AllLanguages>;

def ilogb : LibraryBuiltin<"id", "fne", "math.h", AllLanguages>;
def ilogbf : LibraryBuiltin<"if", "fne", "math.h", AllLanguages>;
def ilogbl : LibraryBuiltin<"iLd", "fne", "math.h", AllLanguages>;

// POSIX math.h declares a global, signgam, that lgamma writes to, so these
// shouldn't have "e" or "c" attributes
def lgamma : LibraryBuiltin<"dd", "fn", "math.h", AllLanguages>;
def lgammaf : LibraryBuiltin<"ff", "fn", "math.h", AllLanguages>;
def lgammal : LibraryBuiltin<"LdLd", "fn", "math.h", AllLanguages>;

def llrint : LibraryBuiltin<"LLid", "fne", "math.h", AllLanguages>;
def llrintf : LibraryBuiltin<"LLif", "fne", "math.h", AllLanguages>;
def llrintl : LibraryBuiltin<"LLiLd", "fne", "math.h", AllLanguages>;

def llround : LibraryBuiltin<"LLid", "fne", "math.h", AllLanguages>;
def llroundf : LibraryBuiltin<"LLif", "fne", "math.h", AllLanguages>;
def llroundl : LibraryBuiltin<"LLiLd", "fne", "math.h", AllLanguages>;

def log : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def logf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def logl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def log10 : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def log10f : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def log10l : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def log1p : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def log1pf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def log1pl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def log2 : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def log2f : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def log2l : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def logb : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def logbf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def logbl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def lrint : LibraryBuiltin<"Lid", "fne", "math.h", AllLanguages>;
def lrintf : LibraryBuiltin<"Lif", "fne", "math.h", AllLanguages>;
def lrintl : LibraryBuiltin<"LiLd", "fne", "math.h", AllLanguages>;

def lround : LibraryBuiltin<"Lid", "fne", "math.h", AllLanguages>;
def lroundf : LibraryBuiltin<"Lif", "fne", "math.h", AllLanguages>;
def lroundl : LibraryBuiltin<"LiLd", "fne", "math.h", AllLanguages>;

def nearbyint : LibraryBuiltin<"dd", "fnc", "math.h", AllLanguages>;
def nearbyintf : LibraryBuiltin<"ff", "fnc", "math.h", AllLanguages>;
def nearbyintl : LibraryBuiltin<"LdLd", "fnc", "math.h", AllLanguages>;

def nextafter : LibraryBuiltin<"ddd", "fne", "math.h", AllLanguages>;
def nextafterf : LibraryBuiltin<"fff", "fne", "math.h", AllLanguages>;
def nextafterl : LibraryBuiltin<"LdLdLd", "fne", "math.h", AllLanguages>;

def nexttoward : LibraryBuiltin<"ddLd", "fne", "math.h", AllLanguages>;
def nexttowardf : LibraryBuiltin<"ffLd", "fne", "math.h", AllLanguages>;
def nexttowardl : LibraryBuiltin<"LdLdLd", "fne", "math.h", AllLanguages>;

def remainder : LibraryBuiltin<"ddd", "fne", "math.h", AllLanguages>;
def remainderf : LibraryBuiltin<"fff", "fne", "math.h", AllLanguages>;
def remainderl : LibraryBuiltin<"LdLdLd", "fne", "math.h", AllLanguages>;

def remquo : LibraryBuiltin<"dddi*", "fn", "math.h", AllLanguages>;
def remquof : LibraryBuiltin<"fffi*", "fn", "math.h", AllLanguages>;
def remquol : LibraryBuiltin<"LdLdLdi*", "fn", "math.h", AllLanguages>;

def rint : LibraryBuiltin<"dd", "fnc", "math.h", AllLanguages>;
def rintf : LibraryBuiltin<"ff", "fnc", "math.h", AllLanguages>;
def rintl : LibraryBuiltin<"LdLd", "fnc", "math.h", AllLanguages>;

def round : LibraryBuiltin<"dd", "fnc", "math.h", AllLanguages>;
def roundf : LibraryBuiltin<"ff", "fnc", "math.h", AllLanguages>;
def roundl : LibraryBuiltin<"LdLd", "fnc", "math.h", AllLanguages>;

def scalbln : LibraryBuiltin<"ddLi", "fne", "math.h", AllLanguages>;
def scalblnf : LibraryBuiltin<"ffLi", "fne", "math.h", AllLanguages>;
def scalblnl : LibraryBuiltin<"LdLdLi", "fne", "math.h", AllLanguages>;

def scalbn : LibraryBuiltin<"ddi", "fne", "math.h", AllLanguages>;
def scalbnf : LibraryBuiltin<"ffi", "fne", "math.h", AllLanguages>;
def scalbnl : LibraryBuiltin<"LdLdi", "fne", "math.h", AllLanguages>;

def sin : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def sinf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def sinl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def sinh : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def sinhf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def sinhl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def sqrt : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def sqrtf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def sqrtl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def tan : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def tanf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def tanl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def tanh : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def tanhf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def tanhl : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def tgamma : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def tgammaf : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;
def tgammal : LibraryBuiltin<"LdLd", "fne", "math.h", AllLanguages>;

def trunc : LibraryBuiltin<"dd", "fnc", "math.h", AllLanguages>;
def truncf : LibraryBuiltin<"ff", "fnc", "math.h", AllLanguages>;
def truncl : LibraryBuiltin<"LdLd", "fnc", "math.h", AllLanguages>;

def cabs : LibraryBuiltin<"dXd", "fne", "complex.h", AllLanguages>;
def cabsf : LibraryBuiltin<"fXf", "fne", "complex.h", AllLanguages>;
def cabsl : LibraryBuiltin<"LdXLd", "fne", "complex.h", AllLanguages>;

def cacos : LibraryBuiltin<"XdXd", "fne", "complex.h", AllLanguages>;
def cacosf : LibraryBuiltin<"XfXf", "fne", "complex.h", AllLanguages>;
def cacosl : LibraryBuiltin<"XLdXLd", "fne", "complex.h", AllLanguages>;

def cacosh : LibraryBuiltin<"XdXd", "fne", "complex.h", AllLanguages>;
def cacoshf : LibraryBuiltin<"XfXf", "fne", "complex.h", AllLanguages>;
def cacoshl : LibraryBuiltin<"XLdXLd", "fne", "complex.h", AllLanguages>;

def carg : LibraryBuiltin<"dXd", "fne", "complex.h", AllLanguages>;
def cargf : LibraryBuiltin<"fXf", "fne", "complex.h", AllLanguages>;
def cargl : LibraryBuiltin<"LdXLd", "fne", "complex.h", AllLanguages>;

def casin : LibraryBuiltin<"XdXd", "fne", "complex.h", AllLanguages>;
def casinf : LibraryBuiltin<"XfXf", "fne", "complex.h", AllLanguages>;
def casinl : LibraryBuiltin<"XLdXLd", "fne", "complex.h", AllLanguages>;

def casinh : LibraryBuiltin<"XdXd", "fne", "complex.h", AllLanguages>;
def casinhf : LibraryBuiltin<"XfXf", "fne", "complex.h", AllLanguages>;
def casinhl : LibraryBuiltin<"XLdXLd", "fne", "complex.h", AllLanguages>;

def catan : LibraryBuiltin<"XdXd", "fne", "complex.h", AllLanguages>;
def catanf : LibraryBuiltin<"XfXf", "fne", "complex.h", AllLanguages>;
def catanl : LibraryBuiltin<"XLdXLd", "fne", "complex.h", AllLanguages>;

def catanh : LibraryBuiltin<"XdXd", "fne", "complex.h", AllLanguages>;
def catanhf : LibraryBuiltin<"XfXf", "fne", "complex.h", AllLanguages>;
def catanhl : LibraryBuiltin<"XLdXLd", "fne", "complex.h", AllLanguages>;

def ccos : LibraryBuiltin<"XdXd", "fne", "complex.h", AllLanguages>;
def ccosf : LibraryBuiltin<"XfXf", "fne", "complex.h", AllLanguages>;
def ccosl : LibraryBuiltin<"XLdXLd", "fne", "complex.h", AllLanguages>;

def ccosh : LibraryBuiltin<"XdXd", "fne", "complex.h", AllLanguages>;
def ccoshf : LibraryBuiltin<"XfXf", "fne", "complex.h", AllLanguages>;
def ccoshl : LibraryBuiltin<"XLdXLd", "fne", "complex.h", AllLanguages>;

def cexp : LibraryBuiltin<"XdXd", "fne", "complex.h", AllLanguages>;
def cexpf : LibraryBuiltin<"XfXf", "fne", "complex.h", AllLanguages>;
def cexpl : LibraryBuiltin<"XLdXLd", "fne", "complex.h", AllLanguages>;

def cimag : LibraryBuiltin<"dXd", "fnc", "complex.h", AllLanguages>;
def cimagf : LibraryBuiltin<"fXf", "fnc", "complex.h", AllLanguages>;
def cimagl : LibraryBuiltin<"LdXLd", "fnc", "complex.h", AllLanguages>;

def conj : LibraryBuiltin<"XdXd", "fnc", "complex.h", AllLanguages>;
def conjf : LibraryBuiltin<"XfXf", "fnc", "complex.h", AllLanguages>;
def conjl : LibraryBuiltin<"XLdXLd", "fnc", "complex.h", AllLanguages>;

def clog : LibraryBuiltin<"XdXd", "fne", "complex.h", AllLanguages>;
def clogf : LibraryBuiltin<"XfXf", "fne", "complex.h", AllLanguages>;
def clogl : LibraryBuiltin<"XLdXLd", "fne", "complex.h", AllLanguages>;

def cproj : LibraryBuiltin<"XdXd", "fnc", "complex.h", AllLanguages>;
def cprojf : LibraryBuiltin<"XfXf", "fnc", "complex.h", AllLanguages>;
def cprojl : LibraryBuiltin<"XLdXLd", "fnc", "complex.h", AllLanguages>;

def cpow : LibraryBuiltin<"XdXdXd", "fne", "complex.h", AllLanguages>;
def cpowf : LibraryBuiltin<"XfXfXf", "fne", "complex.h", AllLanguages>;
def cpowl : LibraryBuiltin<"XLdXLdXLd", "fne", "complex.h", AllLanguages>;

def creal : LibraryBuiltin<"dXd", "fnc", "complex.h", AllLanguages>;
def crealf : LibraryBuiltin<"fXf", "fnc", "complex.h", AllLanguages>;
def creall : LibraryBuiltin<"LdXLd", "fnc", "complex.h", AllLanguages>;

def csin : LibraryBuiltin<"XdXd", "fne", "complex.h", AllLanguages>;
def csinf : LibraryBuiltin<"XfXf", "fne", "complex.h", AllLanguages>;
def csinl : LibraryBuiltin<"XLdXLd", "fne", "complex.h", AllLanguages>;

def csinh : LibraryBuiltin<"XdXd", "fne", "complex.h", AllLanguages>;
def csinhf : LibraryBuiltin<"XfXf", "fne", "complex.h", AllLanguages>;
def csinhl : LibraryBuiltin<"XLdXLd", "fne", "complex.h", AllLanguages>;

def csqrt : LibraryBuiltin<"XdXd", "fne", "complex.h", AllLanguages>;
def csqrtf : LibraryBuiltin<"XfXf", "fne", "complex.h", AllLanguages>;
def csqrtl : LibraryBuiltin<"XLdXLd", "fne", "complex.h", AllLanguages>;

def ctan : LibraryBuiltin<"XdXd", "fne", "complex.h", AllLanguages>;
def ctanf : LibraryBuiltin<"XfXf", "fne", "complex.h", AllLanguages>;
def ctanl : LibraryBuiltin<"XLdXLd", "fne", "complex.h", AllLanguages>;

def ctanh : LibraryBuiltin<"XdXd", "fne", "complex.h", AllLanguages>;
def ctanhf : LibraryBuiltin<"XfXf", "fne", "complex.h", AllLanguages>;
def ctanhl : LibraryBuiltin<"XLdXLd", "fne", "complex.h", AllLanguages>;

// __sinpi and friends are OS X specific library functions, but otherwise much
// like the standard (non-complex) sin (etc).
def __sinpi : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def __sinpif : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;

def __cospi : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def __cospif : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;

def __tanpi : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def __tanpif : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;

// Similarly, __exp10 is OS X only
def __exp10 : LibraryBuiltin<"dd", "fne", "math.h", AllLanguages>;
def __exp10f : LibraryBuiltin<"ff", "fne", "math.h", AllLanguages>;

// Blocks runtime Builtin math library functions
def _Block_object_assign : LibraryBuiltin<"vv*vC*iC", "f", "Blocks.h", AllLanguages>;
def _Block_object_dispose : LibraryBuiltin<"vvC*iC", "f", "Blocks.h", AllLanguages>;
// FIXME: Also declare NSConcreteGlobalBlock and NSConcreteStackBlock.

// Annotation function
def __builtin_annotation : Builtin<"v.", "tn">;

// Invariants
def __builtin_assume : Builtin<"vb", "n">;

// Multiprecision Arithmetic Builtins.
def __builtin_addcb : Builtin<"UcUcCUcCUcCUc*", "n">;
def __builtin_addcs : Builtin<"UsUsCUsCUsCUs*", "n">;
def __builtin_addc : Builtin<"UiUiCUiCUiCUi*", "n">;
def __builtin_addcl : Builtin<"ULiULiCULiCULiCULi*", "n">;
def __builtin_addcll : Builtin<"ULLiULLiCULLiCULLiCULLi*", "n">;
def __builtin_subcb : Builtin<"UcUcCUcCUcCUc*", "n">;
def __builtin_subcs : Builtin<"UsUsCUsCUsCUs*", "n">;
def __builtin_subc : Builtin<"UiUiCUiCUiCUi*", "n">;
def __builtin_subcl : Builtin<"ULiULiCULiCULiCULi*", "n">;
def __builtin_subcll : Builtin<"ULLiULLiCULLiCULLiCULLi*", "n">;

// Checked Arithmetic Builtins for Security.
def __builtin_add_overflow : Builtin<"b.", "nt">;
def __builtin_sub_overflow : Builtin<"b.", "nt">;
def __builtin_mul_overflow : Builtin<"b.", "nt">;
def __builtin_uadd_overflow : Builtin<"bUiCUiCUi*", "n">;
def __builtin_uaddl_overflow : Builtin<"bULiCULiCULi*", "n">;
def __builtin_uaddll_overflow : Builtin<"bULLiCULLiCULLi*", "n">;
def __builtin_usub_overflow : Builtin<"bUiCUiCUi*", "n">;
def __builtin_usubl_overflow : Builtin<"bULiCULiCULi*", "n">;
def __builtin_usubll_overflow : Builtin<"bULLiCULLiCULLi*", "n">;
def __builtin_umul_overflow : Builtin<"bUiCUiCUi*", "n">;
def __builtin_umull_overflow : Builtin<"bULiCULiCULi*", "n">;
def __builtin_umulll_overflow : Builtin<"bULLiCULLiCULLi*", "n">;
def __builtin_sadd_overflow : Builtin<"bSiCSiCSi*", "n">;
def __builtin_saddl_overflow : Builtin<"bSLiCSLiCSLi*", "n">;
def __builtin_saddll_overflow : Builtin<"bSLLiCSLLiCSLLi*", "n">;
def __builtin_ssub_overflow : Builtin<"bSiCSiCSi*", "n">;
def __builtin_ssubl_overflow : Builtin<"bSLiCSLiCSLi*", "n">;
def __builtin_ssubll_overflow : Builtin<"bSLLiCSLLiCSLLi*", "n">;
def __builtin_smul_overflow : Builtin<"bSiCSiCSi*", "n">;
def __builtin_smull_overflow : Builtin<"bSLiCSLiCSLi*", "n">;
def __builtin_smulll_overflow : Builtin<"bSLLiCSLLiCSLLi*", "n">;

// Clang builtins (not available in GCC).
def __builtin_addressof : Builtin<"v*v&", "nct">;
def __builtin_operator_new : Builtin<"v*z", "tc">;
def __builtin_operator_delete : Builtin<"vv*", "tn">;
def __builtin_char_memchr : Builtin<"c*cC*iz", "n">;
def __builtin_dump_struct : Builtin<"ivC*v*", "tn">;
def __builtin_preserve_access_index : Builtin<"v.", "t">;

// Alignment builtins (uses custom parsing to support pointers and integers)
def __builtin_is_aligned : Builtin<"bvC*z", "nct">;
def __builtin_align_up : Builtin<"v*vC*z", "nct">;
def __builtin_align_down : Builtin<"v*vC*z", "nct">;

// Safestack builtins
def __builtin___get_unsafe_stack_start : Builtin<"v*", "Fn">;
def __builtin___get_unsafe_stack_bottom : Builtin<"v*", "Fn">;
def __builtin___get_unsafe_stack_top : Builtin<"v*", "Fn">;
def __builtin___get_unsafe_stack_ptr : Builtin<"v*", "Fn">;

// Nontemporal loads/stores builtins
def __builtin_nontemporal_store : Builtin<"v.", "t">;
def __builtin_nontemporal_load : Builtin<"v.", "t">;

// Coroutine intrinsics.
def __builtin_coro_resume : Builtin<"vv*", "">;
def __builtin_coro_destroy : Builtin<"vv*", "">;
def __builtin_coro_done : Builtin<"bv*", "n">;
def __builtin_coro_promise : Builtin<"v*v*IiIb", "n">;

def __builtin_coro_size : Builtin<"z", "n">;
def __builtin_coro_frame : Builtin<"v*", "n">;
def __builtin_coro_noop : Builtin<"v*", "n">;
def __builtin_coro_free : Builtin<"v*v*", "n">;

def __builtin_coro_id : Builtin<"v*Iiv*v*v*", "n">;
def __builtin_coro_alloc : Builtin<"b", "n">;
def __builtin_coro_begin : Builtin<"v*v*", "n">;
def __builtin_coro_end : Builtin<"bv*Ib", "n">;
def __builtin_coro_suspend : Builtin<"cIb", "n">;
def __builtin_coro_param : Builtin<"bv*v*", "n">;

// OpenCL v2.0 s6.13.16, s9.17.3.5 - Pipe functions.
// We need the generic prototype, since the packet type could be anything.
def read_pipe : LangBuiltin<"i.", "tn", OCLC20Lang>;
def write_pipe : LangBuiltin<"i.", "tn", OCLC20Lang>;

def reserve_read_pipe : LangBuiltin<"i.", "tn", OCLC20Lang>;
def reserve_write_pipe : LangBuiltin<"i.", "tn", OCLC20Lang>;

def commit_write_pipe : LangBuiltin<"v.", "tn", OCLC20Lang>;
def commit_read_pipe : LangBuiltin<"v.", "tn", OCLC20Lang>;

def sub_group_reserve_read_pipe : LangBuiltin<"i.", "tn", OCLC20Lang>;
def sub_group_reserve_write_pipe : LangBuiltin<"i.", "tn", OCLC20Lang>;

def sub_group_commit_read_pipe : LangBuiltin<"v.", "tn", OCLC20Lang>;
def sub_group_commit_write_pipe : LangBuiltin<"v.", "tn", OCLC20Lang>;

def work_group_reserve_read_pipe : LangBuiltin<"i.", "tn", OCLC20Lang>;
def work_group_reserve_write_pipe : LangBuiltin<"i.", "tn", OCLC20Lang>;

def work_group_commit_read_pipe : LangBuiltin<"v.", "tn", OCLC20Lang>;
def work_group_commit_write_pipe : LangBuiltin<"v.", "tn", OCLC20Lang>;

def get_pipe_num_packets : LangBuiltin<"Ui.", "tn", OCLC20Lang>;
def get_pipe_max_packets : LangBuiltin<"Ui.", "tn", OCLC20Lang>;

// OpenCL v2.0 s6.13.17 - Enqueue kernel functions.
// Custom builtin check allows to perform special check of passed block arguments.
def enqueue_kernel : LangBuiltin<"i.", "tn", OCLC20Lang>;
def get_kernel_work_group_size : LangBuiltin<"Ui.", "tn", OCLC20Lang>;
def get_kernel_preferred_work_group_size_multiple : LangBuiltin<"Ui.", "tn", OCLC20Lang>;
def get_kernel_max_sub_group_size_for_ndrange : LangBuiltin<"Ui.", "tn", OCLC20Lang>;
def get_kernel_sub_group_count_for_ndrange : LangBuiltin<"Ui.", "tn", OCLC20Lang>;

// OpenCL v2.0 s6.13.9 - Address space qualifier functions.
// FIXME: Pointer parameters of OpenCL builtins should have their address space
// requirement defined.
def to_global : LangBuiltin<"v*v*", "tn", OCLC20Lang>;
def to_local : LangBuiltin<"v*v*", "tn", OCLC20Lang>;
def to_private : LangBuiltin<"v*v*", "tn", OCLC20Lang>;

// OpenCL half load/store builtin
def __builtin_store_half : LangBuiltin<"vdh*", "n", AllOCLCLanguages>;
def __builtin_store_halff : LangBuiltin<"vfh*", "n", AllOCLCLanguages>;
def __builtin_load_half : LangBuiltin<"dhC*", "nc", AllOCLCLanguages>;
def __builtin_load_halff : LangBuiltin<"fhC*", "nc", AllOCLCLanguages>;

// Builtins for os_log/os_trace
def __builtin_os_log_format_buffer_size : Builtin<"zcC*.", "p:0:nut">;
def __builtin_os_log_format : Builtin<"v*v*cC*.", "p:0:nt">;

// OpenMP 4.0
def omp_is_initial_device : LangBuiltin<"i", "nc", OMPLang>;

// Builtins for XRay
def __xray_customevent : Builtin<"vcC*z", "">;
def __xray_typedevent : Builtin<"vzcC*z", "">;

// Win64-compatible va_list functions
def __builtin_ms_va_start : Builtin<"vc*&.", "nt">;
def __builtin_ms_va_end : Builtin<"vc*&", "n">;
def __builtin_ms_va_copy : Builtin<"vc*&c*&", "n">;

