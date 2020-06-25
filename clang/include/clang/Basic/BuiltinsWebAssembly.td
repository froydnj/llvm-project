// BuiltinsWebAssembly.def - WebAssembly builtin function database -*- C++ -*-//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file defines the WebAssembly-specific builtin function database.
/// Users of this file must define the BUILTIN macro to make use of this
/// information.
///
//===----------------------------------------------------------------------===//

// Type and attribute strings are as defined in Builtins.td.


// Query the current memory size, and increase the current memory size.
// Note that memory.size is not "c" (readnone) because it must be sequenced
// with respect to memory.grow calls.
include "BuiltinTableGenDefs.inc"

let TargetArch = "WebAssembly" in {
def __builtin_wasm_memory_size: Builtin<"zIi", "n">;
def __builtin_wasm_memory_grow: Builtin<"zIiz", "n">;

// Bulk memory builtins
def __builtin_wasm_memory_init: TargetBuiltin<"vIUiIUiv*UiUi", "", "bulk-memory">;
def __builtin_wasm_data_drop: TargetBuiltin<"vIUi", "", "bulk-memory">;

// Thread-local storage
def __builtin_wasm_tls_size: TargetBuiltin<"z", "nc", "bulk-memory">;
def __builtin_wasm_tls_align: TargetBuiltin<"z", "nc", "bulk-memory">;
def __builtin_wasm_tls_base: TargetBuiltin<"v*", "nU", "bulk-memory">;

// Floating point min/max
def __builtin_wasm_min_f32: Builtin<"fff", "nc">;
def __builtin_wasm_max_f32: Builtin<"fff", "nc">;
def __builtin_wasm_min_f64: Builtin<"ddd", "nc">;
def __builtin_wasm_max_f64: Builtin<"ddd", "nc">;

// Exception handling builtins.
def __builtin_wasm_throw: TargetBuiltin<"vIUiv*", "r", "exception-handling">;
def __builtin_wasm_rethrow_in_catch: TargetBuiltin<"v", "r", "exception-handling">;

// Atomic wait and notify.
def __builtin_wasm_atomic_wait_i32: TargetBuiltin<"ii*iLLi", "n", "atomics">;
def __builtin_wasm_atomic_wait_i64: TargetBuiltin<"iLLi*LLiLLi", "n", "atomics">;
def __builtin_wasm_atomic_notify: TargetBuiltin<"Uii*Ui", "n", "atomics">;

// Trapping fp-to-int conversions
def __builtin_wasm_trunc_s_i32_f32: Builtin<"if", "nc">;
def __builtin_wasm_trunc_u_i32_f32: Builtin<"if", "nc">;
def __builtin_wasm_trunc_s_i32_f64: Builtin<"id", "nc">;
def __builtin_wasm_trunc_u_i32_f64: Builtin<"id", "nc">;
def __builtin_wasm_trunc_s_i64_f32: Builtin<"LLif", "nc">;
def __builtin_wasm_trunc_u_i64_f32: Builtin<"LLif", "nc">;
def __builtin_wasm_trunc_s_i64_f64: Builtin<"LLid", "nc">;
def __builtin_wasm_trunc_u_i64_f64: Builtin<"LLid", "nc">;

// Saturating fp-to-int conversions
def __builtin_wasm_trunc_saturate_s_i32_f32: TargetBuiltin<"if", "nc", "nontrapping-fptoint">;
def __builtin_wasm_trunc_saturate_u_i32_f32: TargetBuiltin<"if", "nc", "nontrapping-fptoint">;
def __builtin_wasm_trunc_saturate_s_i32_f64: TargetBuiltin<"id", "nc", "nontrapping-fptoint">;
def __builtin_wasm_trunc_saturate_u_i32_f64: TargetBuiltin<"id", "nc", "nontrapping-fptoint">;
def __builtin_wasm_trunc_saturate_s_i64_f32: TargetBuiltin<"LLif", "nc", "nontrapping-fptoint">;
def __builtin_wasm_trunc_saturate_u_i64_f32: TargetBuiltin<"LLif", "nc", "nontrapping-fptoint">;
def __builtin_wasm_trunc_saturate_s_i64_f64: TargetBuiltin<"LLid", "nc", "nontrapping-fptoint">;
def __builtin_wasm_trunc_saturate_u_i64_f64: TargetBuiltin<"LLid", "nc", "nontrapping-fptoint">;

// SIMD builtins
def __builtin_wasm_swizzle_v8x16: TargetBuiltin<"V16cV16cV16c", "nc", "simd128">;

def __builtin_wasm_extract_lane_s_i8x16: TargetBuiltin<"iV16cIi", "nc", "simd128">;
def __builtin_wasm_extract_lane_u_i8x16: TargetBuiltin<"iV16cIi", "nc", "simd128">;
def __builtin_wasm_extract_lane_s_i16x8: TargetBuiltin<"iV8sIi", "nc", "simd128">;
def __builtin_wasm_extract_lane_u_i16x8: TargetBuiltin<"iV8sIi", "nc", "simd128">;
def __builtin_wasm_extract_lane_i32x4: TargetBuiltin<"iV4iIi", "nc", "simd128">;
def __builtin_wasm_extract_lane_i64x2: TargetBuiltin<"LLiV2LLiIi", "nc", "simd128">;
def __builtin_wasm_extract_lane_f32x4: TargetBuiltin<"fV4fIi", "nc", "simd128">;
def __builtin_wasm_extract_lane_f64x2: TargetBuiltin<"dV2dIi", "nc", "simd128">;

def __builtin_wasm_replace_lane_i8x16: TargetBuiltin<"V16cV16cIii", "nc", "simd128">;
def __builtin_wasm_replace_lane_i16x8: TargetBuiltin<"V8sV8sIii", "nc", "simd128">;
def __builtin_wasm_replace_lane_i32x4: TargetBuiltin<"V4iV4iIii", "nc", "simd128">;
def __builtin_wasm_replace_lane_i64x2: TargetBuiltin<"V2LLiV2LLiIiLLi", "nc", "simd128">;
def __builtin_wasm_replace_lane_f32x4: TargetBuiltin<"V4fV4fIif", "nc", "simd128">;
def __builtin_wasm_replace_lane_f64x2: TargetBuiltin<"V2dV2dIid", "nc", "simd128">;

def __builtin_wasm_add_saturate_s_i8x16: TargetBuiltin<"V16cV16cV16c", "nc", "simd128">;
def __builtin_wasm_add_saturate_u_i8x16: TargetBuiltin<"V16cV16cV16c", "nc", "simd128">;
def __builtin_wasm_add_saturate_s_i16x8: TargetBuiltin<"V8sV8sV8s", "nc", "simd128">;
def __builtin_wasm_add_saturate_u_i16x8: TargetBuiltin<"V8sV8sV8s", "nc", "simd128">;

def __builtin_wasm_sub_saturate_s_i8x16: TargetBuiltin<"V16cV16cV16c", "nc", "simd128">;
def __builtin_wasm_sub_saturate_u_i8x16: TargetBuiltin<"V16cV16cV16c", "nc", "simd128">;
def __builtin_wasm_sub_saturate_s_i16x8: TargetBuiltin<"V8sV8sV8s", "nc", "simd128">;
def __builtin_wasm_sub_saturate_u_i16x8: TargetBuiltin<"V8sV8sV8s", "nc", "simd128">;

def __builtin_wasm_abs_i8x16: TargetBuiltin<"V16cV16c", "nc", "simd128">;
def __builtin_wasm_abs_i16x8: TargetBuiltin<"V8sV8s", "nc", "simd128">;
def __builtin_wasm_abs_i32x4: TargetBuiltin<"V4iV4i", "nc", "simd128">;

def __builtin_wasm_min_s_i8x16: TargetBuiltin<"V16cV16cV16c", "nc", "simd128">;
def __builtin_wasm_min_u_i8x16: TargetBuiltin<"V16cV16cV16c", "nc", "simd128">;
def __builtin_wasm_max_s_i8x16: TargetBuiltin<"V16cV16cV16c", "nc", "simd128">;
def __builtin_wasm_max_u_i8x16: TargetBuiltin<"V16cV16cV16c", "nc", "simd128">;
def __builtin_wasm_min_s_i16x8: TargetBuiltin<"V8sV8sV8s", "nc", "simd128">;
def __builtin_wasm_min_u_i16x8: TargetBuiltin<"V8sV8sV8s", "nc", "simd128">;
def __builtin_wasm_max_s_i16x8: TargetBuiltin<"V8sV8sV8s", "nc", "simd128">;
def __builtin_wasm_max_u_i16x8: TargetBuiltin<"V8sV8sV8s", "nc", "simd128">;
def __builtin_wasm_min_s_i32x4: TargetBuiltin<"V4iV4iV4i", "nc", "simd128">;
def __builtin_wasm_min_u_i32x4: TargetBuiltin<"V4iV4iV4i", "nc", "simd128">;
def __builtin_wasm_max_s_i32x4: TargetBuiltin<"V4iV4iV4i", "nc", "simd128">;
def __builtin_wasm_max_u_i32x4: TargetBuiltin<"V4iV4iV4i", "nc", "simd128">;

def __builtin_wasm_avgr_u_i8x16: TargetBuiltin<"V16cV16cV16c", "nc", "simd128">;
def __builtin_wasm_avgr_u_i16x8: TargetBuiltin<"V8sV8sV8s", "nc", "simd128">;

def __builtin_wasm_bitselect: TargetBuiltin<"V4iV4iV4iV4i", "nc", "simd128">;
def __builtin_wasm_shuffle_v8x16: TargetBuiltin<"V16cV16cV16cIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIi", "nc", "simd128">;

def __builtin_wasm_any_true_i8x16: TargetBuiltin<"iV16c", "nc", "simd128">;
def __builtin_wasm_any_true_i16x8: TargetBuiltin<"iV8s", "nc", "simd128">;
def __builtin_wasm_any_true_i32x4: TargetBuiltin<"iV4i", "nc", "simd128">;
def __builtin_wasm_any_true_i64x2: TargetBuiltin<"iV2LLi", "nc", "unimplemented-simd128">;
def __builtin_wasm_all_true_i8x16: TargetBuiltin<"iV16c", "nc", "simd128">;
def __builtin_wasm_all_true_i16x8: TargetBuiltin<"iV8s", "nc", "simd128">;
def __builtin_wasm_all_true_i32x4: TargetBuiltin<"iV4i", "nc", "simd128">;
def __builtin_wasm_all_true_i64x2: TargetBuiltin<"iV2LLi", "nc", "unimplemented-simd128">;

def __builtin_wasm_bitmask_i8x16: TargetBuiltin<"iV16c", "nc", "simd128">;
def __builtin_wasm_bitmask_i16x8: TargetBuiltin<"iV8s", "nc", "simd128">;
def __builtin_wasm_bitmask_i32x4: TargetBuiltin<"iV4i", "nc", "simd128">;

def __builtin_wasm_abs_f32x4: TargetBuiltin<"V4fV4f", "nc", "simd128">;
def __builtin_wasm_abs_f64x2: TargetBuiltin<"V2dV2d", "nc", "simd128">;

def __builtin_wasm_min_f32x4: TargetBuiltin<"V4fV4fV4f", "nc", "simd128">;
def __builtin_wasm_max_f32x4: TargetBuiltin<"V4fV4fV4f", "nc", "simd128">;
def __builtin_wasm_pmin_f32x4: TargetBuiltin<"V4fV4fV4f", "nc", "simd128">;
def __builtin_wasm_pmax_f32x4: TargetBuiltin<"V4fV4fV4f", "nc", "simd128">;
def __builtin_wasm_min_f64x2: TargetBuiltin<"V2dV2dV2d", "nc", "simd128">;
def __builtin_wasm_max_f64x2: TargetBuiltin<"V2dV2dV2d", "nc", "simd128">;
def __builtin_wasm_pmin_f64x2: TargetBuiltin<"V2dV2dV2d", "nc", "simd128">;
def __builtin_wasm_pmax_f64x2: TargetBuiltin<"V2dV2dV2d", "nc", "simd128">;

def __builtin_wasm_ceil_f32x4: TargetBuiltin<"V4fV4f", "nc", "simd128">;
def __builtin_wasm_floor_f32x4: TargetBuiltin<"V4fV4f", "nc", "simd128">;
def __builtin_wasm_trunc_f32x4: TargetBuiltin<"V4fV4f", "nc", "simd128">;
def __builtin_wasm_nearest_f32x4: TargetBuiltin<"V4fV4f", "nc", "simd128">;
def __builtin_wasm_ceil_f64x2: TargetBuiltin<"V2dV2d", "nc", "simd128">;
def __builtin_wasm_floor_f64x2: TargetBuiltin<"V2dV2d", "nc", "simd128">;
def __builtin_wasm_trunc_f64x2: TargetBuiltin<"V2dV2d", "nc", "simd128">;
def __builtin_wasm_nearest_f64x2: TargetBuiltin<"V2dV2d", "nc", "simd128">;

def __builtin_wasm_dot_s_i32x4_i16x8: TargetBuiltin<"V4iV8sV8s", "nc", "simd128">;

def __builtin_wasm_sqrt_f32x4: TargetBuiltin<"V4fV4f", "nc", "simd128">;
def __builtin_wasm_sqrt_f64x2: TargetBuiltin<"V2dV2d", "nc", "simd128">;

def __builtin_wasm_qfma_f32x4: TargetBuiltin<"V4fV4fV4fV4f", "nc", "unimplemented-simd128">;
def __builtin_wasm_qfms_f32x4: TargetBuiltin<"V4fV4fV4fV4f", "nc", "unimplemented-simd128">;
def __builtin_wasm_qfma_f64x2: TargetBuiltin<"V2dV2dV2dV2d", "nc", "unimplemented-simd128">;
def __builtin_wasm_qfms_f64x2: TargetBuiltin<"V2dV2dV2dV2d", "nc", "unimplemented-simd128">;

def __builtin_wasm_trunc_saturate_s_i32x4_f32x4: TargetBuiltin<"V4iV4f", "nc", "simd128">;
def __builtin_wasm_trunc_saturate_u_i32x4_f32x4: TargetBuiltin<"V4iV4f", "nc", "simd128">;

def __builtin_wasm_narrow_s_i8x16_i16x8: TargetBuiltin<"V16cV8sV8s", "nc", "simd128">;
def __builtin_wasm_narrow_u_i8x16_i16x8: TargetBuiltin<"V16cV8sV8s", "nc", "simd128">;
def __builtin_wasm_narrow_s_i16x8_i32x4: TargetBuiltin<"V8sV4iV4i", "nc", "simd128">;
def __builtin_wasm_narrow_u_i16x8_i32x4: TargetBuiltin<"V8sV4iV4i", "nc", "simd128">;

def __builtin_wasm_widen_low_s_i16x8_i8x16: TargetBuiltin<"V8sV16c", "nc", "simd128">;
def __builtin_wasm_widen_high_s_i16x8_i8x16: TargetBuiltin<"V8sV16c", "nc", "simd128">;
def __builtin_wasm_widen_low_u_i16x8_i8x16: TargetBuiltin<"V8sV16c", "nc", "simd128">;
def __builtin_wasm_widen_high_u_i16x8_i8x16: TargetBuiltin<"V8sV16c", "nc", "simd128">;
def __builtin_wasm_widen_low_s_i32x4_i16x8: TargetBuiltin<"V4iV8s", "nc", "simd128">;
def __builtin_wasm_widen_high_s_i32x4_i16x8: TargetBuiltin<"V4iV8s", "nc", "simd128">;
def __builtin_wasm_widen_low_u_i32x4_i16x8: TargetBuiltin<"V4iV8s", "nc", "simd128">;
def __builtin_wasm_widen_high_u_i32x4_i16x8: TargetBuiltin<"V4iV8s", "nc", "simd128">;

}
