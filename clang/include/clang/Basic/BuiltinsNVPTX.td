//===--- BuiltinsPTX.def - PTX Builtin function database ----*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the PTX-specific builtin function database.  Users of
// this file must define the BUILTIN macro to make use of this information.
//
//===----------------------------------------------------------------------===//

// Type and attribute strings are as defined in Builtins.td.






// Special Registers

include "BuiltinTableGenDefs.inc"

let TargetArch = "NVPTX" in {
def __nvvm_read_ptx_sreg_tid_x: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_tid_y: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_tid_z: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_tid_w: Builtin<"i", "nc">;

def __nvvm_read_ptx_sreg_ntid_x: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_ntid_y: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_ntid_z: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_ntid_w: Builtin<"i", "nc">;

def __nvvm_read_ptx_sreg_ctaid_x: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_ctaid_y: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_ctaid_z: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_ctaid_w: Builtin<"i", "nc">;

def __nvvm_read_ptx_sreg_nctaid_x: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_nctaid_y: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_nctaid_z: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_nctaid_w: Builtin<"i", "nc">;

def __nvvm_read_ptx_sreg_laneid: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_warpid: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_nwarpid: Builtin<"i", "nc">;

def __nvvm_read_ptx_sreg_smid: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_nsmid: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_gridid: Builtin<"i", "nc">;

def __nvvm_read_ptx_sreg_lanemask_eq: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_lanemask_le: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_lanemask_lt: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_lanemask_ge: Builtin<"i", "nc">;
def __nvvm_read_ptx_sreg_lanemask_gt: Builtin<"i", "nc">;

def __nvvm_read_ptx_sreg_clock: Builtin<"i", "n">;
def __nvvm_read_ptx_sreg_clock64: Builtin<"LLi", "n">;

def __nvvm_read_ptx_sreg_pm0: Builtin<"i", "n">;
def __nvvm_read_ptx_sreg_pm1: Builtin<"i", "n">;
def __nvvm_read_ptx_sreg_pm2: Builtin<"i", "n">;
def __nvvm_read_ptx_sreg_pm3: Builtin<"i", "n">;

// MISC

def __nvvm_prmt: Builtin<"UiUiUiUi", "">;

// Min Max

def __nvvm_fmax_ftz_f: Builtin<"fff", "">;
def __nvvm_fmax_f: Builtin<"fff", "">;
def __nvvm_fmin_ftz_f: Builtin<"fff", "">;
def __nvvm_fmin_f: Builtin<"fff", "">;

def __nvvm_fmax_d: Builtin<"ddd", "">;
def __nvvm_fmin_d: Builtin<"ddd", "">;

// Multiplication

def __nvvm_mulhi_i: Builtin<"iii", "">;
def __nvvm_mulhi_ui: Builtin<"UiUiUi", "">;
def __nvvm_mulhi_ll: Builtin<"LLiLLiLLi", "">;
def __nvvm_mulhi_ull: Builtin<"ULLiULLiULLi", "">;

def __nvvm_mul_rn_ftz_f: Builtin<"fff", "">;
def __nvvm_mul_rn_f: Builtin<"fff", "">;
def __nvvm_mul_rz_ftz_f: Builtin<"fff", "">;
def __nvvm_mul_rz_f: Builtin<"fff", "">;
def __nvvm_mul_rm_ftz_f: Builtin<"fff", "">;
def __nvvm_mul_rm_f: Builtin<"fff", "">;
def __nvvm_mul_rp_ftz_f: Builtin<"fff", "">;
def __nvvm_mul_rp_f: Builtin<"fff", "">;

def __nvvm_mul_rn_d: Builtin<"ddd", "">;
def __nvvm_mul_rz_d: Builtin<"ddd", "">;
def __nvvm_mul_rm_d: Builtin<"ddd", "">;
def __nvvm_mul_rp_d: Builtin<"ddd", "">;

def __nvvm_mul24_i: Builtin<"iii", "">;
def __nvvm_mul24_ui: Builtin<"UiUiUi", "">;

// Div

def __nvvm_div_approx_ftz_f: Builtin<"fff", "">;
def __nvvm_div_approx_f: Builtin<"fff", "">;

def __nvvm_div_rn_ftz_f: Builtin<"fff", "">;
def __nvvm_div_rn_f: Builtin<"fff", "">;
def __nvvm_div_rz_ftz_f: Builtin<"fff", "">;
def __nvvm_div_rz_f: Builtin<"fff", "">;
def __nvvm_div_rm_ftz_f: Builtin<"fff", "">;
def __nvvm_div_rm_f: Builtin<"fff", "">;
def __nvvm_div_rp_ftz_f: Builtin<"fff", "">;
def __nvvm_div_rp_f: Builtin<"fff", "">;

def __nvvm_div_rn_d: Builtin<"ddd", "">;
def __nvvm_div_rz_d: Builtin<"ddd", "">;
def __nvvm_div_rm_d: Builtin<"ddd", "">;
def __nvvm_div_rp_d: Builtin<"ddd", "">;

// Sad

def __nvvm_sad_i: Builtin<"iiii", "">;
def __nvvm_sad_ui: Builtin<"UiUiUiUi", "">;

// Floor, Ceil

def __nvvm_floor_ftz_f: Builtin<"ff", "">;
def __nvvm_floor_f: Builtin<"ff", "">;
def __nvvm_floor_d: Builtin<"dd", "">;

def __nvvm_ceil_ftz_f: Builtin<"ff", "">;
def __nvvm_ceil_f: Builtin<"ff", "">;
def __nvvm_ceil_d: Builtin<"dd", "">;

// Abs

def __nvvm_fabs_ftz_f: Builtin<"ff", "">;
def __nvvm_fabs_f: Builtin<"ff", "">;
def __nvvm_fabs_d: Builtin<"dd", "">;

// Round

def __nvvm_round_ftz_f: Builtin<"ff", "">;
def __nvvm_round_f: Builtin<"ff", "">;
def __nvvm_round_d: Builtin<"dd", "">;

// Trunc

def __nvvm_trunc_ftz_f: Builtin<"ff", "">;
def __nvvm_trunc_f: Builtin<"ff", "">;
def __nvvm_trunc_d: Builtin<"dd", "">;

// Saturate

def __nvvm_saturate_ftz_f: Builtin<"ff", "">;
def __nvvm_saturate_f: Builtin<"ff", "">;
def __nvvm_saturate_d: Builtin<"dd", "">;

// Exp2, Log2

def __nvvm_ex2_approx_ftz_f: Builtin<"ff", "">;
def __nvvm_ex2_approx_f: Builtin<"ff", "">;
def __nvvm_ex2_approx_d: Builtin<"dd", "">;

def __nvvm_lg2_approx_ftz_f: Builtin<"ff", "">;
def __nvvm_lg2_approx_f: Builtin<"ff", "">;
def __nvvm_lg2_approx_d: Builtin<"dd", "">;

// Sin, Cos

def __nvvm_sin_approx_ftz_f: Builtin<"ff", "">;
def __nvvm_sin_approx_f: Builtin<"ff", "">;

def __nvvm_cos_approx_ftz_f: Builtin<"ff", "">;
def __nvvm_cos_approx_f: Builtin<"ff", "">;

// Fma

def __nvvm_fma_rn_ftz_f: Builtin<"ffff", "">;
def __nvvm_fma_rn_f: Builtin<"ffff", "">;
def __nvvm_fma_rz_ftz_f: Builtin<"ffff", "">;
def __nvvm_fma_rz_f: Builtin<"ffff", "">;
def __nvvm_fma_rm_ftz_f: Builtin<"ffff", "">;
def __nvvm_fma_rm_f: Builtin<"ffff", "">;
def __nvvm_fma_rp_ftz_f: Builtin<"ffff", "">;
def __nvvm_fma_rp_f: Builtin<"ffff", "">;
def __nvvm_fma_rn_d: Builtin<"dddd", "">;
def __nvvm_fma_rz_d: Builtin<"dddd", "">;
def __nvvm_fma_rm_d: Builtin<"dddd", "">;
def __nvvm_fma_rp_d: Builtin<"dddd", "">;

// Rcp

def __nvvm_rcp_rn_ftz_f: Builtin<"ff", "">;
def __nvvm_rcp_rn_f: Builtin<"ff", "">;
def __nvvm_rcp_rz_ftz_f: Builtin<"ff", "">;
def __nvvm_rcp_rz_f: Builtin<"ff", "">;
def __nvvm_rcp_rm_ftz_f: Builtin<"ff", "">;
def __nvvm_rcp_rm_f: Builtin<"ff", "">;
def __nvvm_rcp_rp_ftz_f: Builtin<"ff", "">;
def __nvvm_rcp_rp_f: Builtin<"ff", "">;

def __nvvm_rcp_rn_d: Builtin<"dd", "">;
def __nvvm_rcp_rz_d: Builtin<"dd", "">;
def __nvvm_rcp_rm_d: Builtin<"dd", "">;
def __nvvm_rcp_rp_d: Builtin<"dd", "">;
def __nvvm_rcp_approx_ftz_d: Builtin<"dd", "">;

// Sqrt

def __nvvm_sqrt_rn_ftz_f: Builtin<"ff", "">;
def __nvvm_sqrt_rn_f: Builtin<"ff", "">;
def __nvvm_sqrt_rz_ftz_f: Builtin<"ff", "">;
def __nvvm_sqrt_rz_f: Builtin<"ff", "">;
def __nvvm_sqrt_rm_ftz_f: Builtin<"ff", "">;
def __nvvm_sqrt_rm_f: Builtin<"ff", "">;
def __nvvm_sqrt_rp_ftz_f: Builtin<"ff", "">;
def __nvvm_sqrt_rp_f: Builtin<"ff", "">;
def __nvvm_sqrt_approx_ftz_f: Builtin<"ff", "">;
def __nvvm_sqrt_approx_f: Builtin<"ff", "">;

def __nvvm_sqrt_rn_d: Builtin<"dd", "">;
def __nvvm_sqrt_rz_d: Builtin<"dd", "">;
def __nvvm_sqrt_rm_d: Builtin<"dd", "">;
def __nvvm_sqrt_rp_d: Builtin<"dd", "">;

// Rsqrt

def __nvvm_rsqrt_approx_ftz_f: Builtin<"ff", "">;
def __nvvm_rsqrt_approx_f: Builtin<"ff", "">;
def __nvvm_rsqrt_approx_d: Builtin<"dd", "">;

// Add

def __nvvm_add_rn_ftz_f: Builtin<"fff", "">;
def __nvvm_add_rn_f: Builtin<"fff", "">;
def __nvvm_add_rz_ftz_f: Builtin<"fff", "">;
def __nvvm_add_rz_f: Builtin<"fff", "">;
def __nvvm_add_rm_ftz_f: Builtin<"fff", "">;
def __nvvm_add_rm_f: Builtin<"fff", "">;
def __nvvm_add_rp_ftz_f: Builtin<"fff", "">;
def __nvvm_add_rp_f: Builtin<"fff", "">;

def __nvvm_add_rn_d: Builtin<"ddd", "">;
def __nvvm_add_rz_d: Builtin<"ddd", "">;
def __nvvm_add_rm_d: Builtin<"ddd", "">;
def __nvvm_add_rp_d: Builtin<"ddd", "">;

// Convert

def __nvvm_d2f_rn_ftz: Builtin<"fd", "">;
def __nvvm_d2f_rn: Builtin<"fd", "">;
def __nvvm_d2f_rz_ftz: Builtin<"fd", "">;
def __nvvm_d2f_rz: Builtin<"fd", "">;
def __nvvm_d2f_rm_ftz: Builtin<"fd", "">;
def __nvvm_d2f_rm: Builtin<"fd", "">;
def __nvvm_d2f_rp_ftz: Builtin<"fd", "">;
def __nvvm_d2f_rp: Builtin<"fd", "">;

def __nvvm_d2i_rn: Builtin<"id", "">;
def __nvvm_d2i_rz: Builtin<"id", "">;
def __nvvm_d2i_rm: Builtin<"id", "">;
def __nvvm_d2i_rp: Builtin<"id", "">;

def __nvvm_d2ui_rn: Builtin<"Uid", "">;
def __nvvm_d2ui_rz: Builtin<"Uid", "">;
def __nvvm_d2ui_rm: Builtin<"Uid", "">;
def __nvvm_d2ui_rp: Builtin<"Uid", "">;

def __nvvm_i2d_rn: Builtin<"di", "">;
def __nvvm_i2d_rz: Builtin<"di", "">;
def __nvvm_i2d_rm: Builtin<"di", "">;
def __nvvm_i2d_rp: Builtin<"di", "">;

def __nvvm_ui2d_rn: Builtin<"dUi", "">;
def __nvvm_ui2d_rz: Builtin<"dUi", "">;
def __nvvm_ui2d_rm: Builtin<"dUi", "">;
def __nvvm_ui2d_rp: Builtin<"dUi", "">;

def __nvvm_f2i_rn_ftz: Builtin<"if", "">;
def __nvvm_f2i_rn: Builtin<"if", "">;
def __nvvm_f2i_rz_ftz: Builtin<"if", "">;
def __nvvm_f2i_rz: Builtin<"if", "">;
def __nvvm_f2i_rm_ftz: Builtin<"if", "">;
def __nvvm_f2i_rm: Builtin<"if", "">;
def __nvvm_f2i_rp_ftz: Builtin<"if", "">;
def __nvvm_f2i_rp: Builtin<"if", "">;

def __nvvm_f2ui_rn_ftz: Builtin<"Uif", "">;
def __nvvm_f2ui_rn: Builtin<"Uif", "">;
def __nvvm_f2ui_rz_ftz: Builtin<"Uif", "">;
def __nvvm_f2ui_rz: Builtin<"Uif", "">;
def __nvvm_f2ui_rm_ftz: Builtin<"Uif", "">;
def __nvvm_f2ui_rm: Builtin<"Uif", "">;
def __nvvm_f2ui_rp_ftz: Builtin<"Uif", "">;
def __nvvm_f2ui_rp: Builtin<"Uif", "">;

def __nvvm_i2f_rn: Builtin<"fi", "">;
def __nvvm_i2f_rz: Builtin<"fi", "">;
def __nvvm_i2f_rm: Builtin<"fi", "">;
def __nvvm_i2f_rp: Builtin<"fi", "">;

def __nvvm_ui2f_rn: Builtin<"fUi", "">;
def __nvvm_ui2f_rz: Builtin<"fUi", "">;
def __nvvm_ui2f_rm: Builtin<"fUi", "">;
def __nvvm_ui2f_rp: Builtin<"fUi", "">;

def __nvvm_lohi_i2d: Builtin<"dii", "">;

def __nvvm_d2i_lo: Builtin<"id", "">;
def __nvvm_d2i_hi: Builtin<"id", "">;

def __nvvm_f2ll_rn_ftz: Builtin<"LLif", "">;
def __nvvm_f2ll_rn: Builtin<"LLif", "">;
def __nvvm_f2ll_rz_ftz: Builtin<"LLif", "">;
def __nvvm_f2ll_rz: Builtin<"LLif", "">;
def __nvvm_f2ll_rm_ftz: Builtin<"LLif", "">;
def __nvvm_f2ll_rm: Builtin<"LLif", "">;
def __nvvm_f2ll_rp_ftz: Builtin<"LLif", "">;
def __nvvm_f2ll_rp: Builtin<"LLif", "">;

def __nvvm_f2ull_rn_ftz: Builtin<"ULLif", "">;
def __nvvm_f2ull_rn: Builtin<"ULLif", "">;
def __nvvm_f2ull_rz_ftz: Builtin<"ULLif", "">;
def __nvvm_f2ull_rz: Builtin<"ULLif", "">;
def __nvvm_f2ull_rm_ftz: Builtin<"ULLif", "">;
def __nvvm_f2ull_rm: Builtin<"ULLif", "">;
def __nvvm_f2ull_rp_ftz: Builtin<"ULLif", "">;
def __nvvm_f2ull_rp: Builtin<"ULLif", "">;

def __nvvm_d2ll_rn: Builtin<"LLid", "">;
def __nvvm_d2ll_rz: Builtin<"LLid", "">;
def __nvvm_d2ll_rm: Builtin<"LLid", "">;
def __nvvm_d2ll_rp: Builtin<"LLid", "">;

def __nvvm_d2ull_rn: Builtin<"ULLid", "">;
def __nvvm_d2ull_rz: Builtin<"ULLid", "">;
def __nvvm_d2ull_rm: Builtin<"ULLid", "">;
def __nvvm_d2ull_rp: Builtin<"ULLid", "">;

def __nvvm_ll2f_rn: Builtin<"fLLi", "">;
def __nvvm_ll2f_rz: Builtin<"fLLi", "">;
def __nvvm_ll2f_rm: Builtin<"fLLi", "">;
def __nvvm_ll2f_rp: Builtin<"fLLi", "">;

def __nvvm_ull2f_rn: Builtin<"fULLi", "">;
def __nvvm_ull2f_rz: Builtin<"fULLi", "">;
def __nvvm_ull2f_rm: Builtin<"fULLi", "">;
def __nvvm_ull2f_rp: Builtin<"fULLi", "">;

def __nvvm_ll2d_rn: Builtin<"dLLi", "">;
def __nvvm_ll2d_rz: Builtin<"dLLi", "">;
def __nvvm_ll2d_rm: Builtin<"dLLi", "">;
def __nvvm_ll2d_rp: Builtin<"dLLi", "">;

def __nvvm_ull2d_rn: Builtin<"dULLi", "">;
def __nvvm_ull2d_rz: Builtin<"dULLi", "">;
def __nvvm_ull2d_rm: Builtin<"dULLi", "">;
def __nvvm_ull2d_rp: Builtin<"dULLi", "">;

def __nvvm_f2h_rn_ftz: Builtin<"Usf", "">;
def __nvvm_f2h_rn: Builtin<"Usf", "">;

// Bitcast

def __nvvm_bitcast_f2i: Builtin<"if", "">;
def __nvvm_bitcast_i2f: Builtin<"fi", "">;

def __nvvm_bitcast_ll2d: Builtin<"dLLi", "">;
def __nvvm_bitcast_d2ll: Builtin<"LLid", "">;

// FNS
def __nvvm_fns: TargetBuiltin<"UiUiUii", "n", "PTX60">;

// Sync

def __syncthreads: Builtin<"v", "">;
def __nvvm_bar0_popc: Builtin<"ii", "">;
def __nvvm_bar0_and: Builtin<"ii", "">;
def __nvvm_bar0_or: Builtin<"ii", "">;
def __nvvm_bar_sync: Builtin<"vi", "n">;
def __nvvm_bar_warp_sync: TargetBuiltin<"vUi", "n", "PTX60">;
def __nvvm_barrier_sync: TargetBuiltin<"vUi", "n", "PTX60">;
def __nvvm_barrier_sync_cnt: TargetBuiltin<"vUiUi", "n", "PTX60">;

// Shuffle

def __nvvm_shfl_down_i32: Builtin<"iiii", "">;
def __nvvm_shfl_down_f32: Builtin<"ffii", "">;
def __nvvm_shfl_up_i32: Builtin<"iiii", "">;
def __nvvm_shfl_up_f32: Builtin<"ffii", "">;
def __nvvm_shfl_bfly_i32: Builtin<"iiii", "">;
def __nvvm_shfl_bfly_f32: Builtin<"ffii", "">;
def __nvvm_shfl_idx_i32: Builtin<"iiii", "">;
def __nvvm_shfl_idx_f32: Builtin<"ffii", "">;

def __nvvm_shfl_sync_down_i32: TargetBuiltin<"iUiiii", "", "PTX60">;
def __nvvm_shfl_sync_down_f32: TargetBuiltin<"fUifii", "", "PTX60">;
def __nvvm_shfl_sync_up_i32: TargetBuiltin<"iUiiii", "", "PTX60">;
def __nvvm_shfl_sync_up_f32: TargetBuiltin<"fUifii", "", "PTX60">;
def __nvvm_shfl_sync_bfly_i32: TargetBuiltin<"iUiiii", "", "PTX60">;
def __nvvm_shfl_sync_bfly_f32: TargetBuiltin<"fUifii", "", "PTX60">;
def __nvvm_shfl_sync_idx_i32: TargetBuiltin<"iUiiii", "", "PTX60">;
def __nvvm_shfl_sync_idx_f32: TargetBuiltin<"fUifii", "", "PTX60">;

// Vote
def __nvvm_vote_all: Builtin<"bb", "">;
def __nvvm_vote_any: Builtin<"bb", "">;
def __nvvm_vote_uni: Builtin<"bb", "">;
def __nvvm_vote_ballot: Builtin<"Uib", "">;

def __nvvm_vote_all_sync: TargetBuiltin<"bUib", "", "PTX60">;
def __nvvm_vote_any_sync: TargetBuiltin<"bUib", "", "PTX60">;
def __nvvm_vote_uni_sync: TargetBuiltin<"bUib", "", "PTX60">;
def __nvvm_vote_ballot_sync: TargetBuiltin<"UiUib", "", "PTX60">;

// Match
def __nvvm_match_any_sync_i32: TargetBuiltin<"UiUiUi", "", "PTX60">;
def __nvvm_match_any_sync_i64: TargetBuiltin<"WiUiWi", "", "PTX60">;
// These return a pair {value, predicate}, which requires custom lowering.
def __nvvm_match_all_sync_i32p: TargetBuiltin<"UiUiUii*", "", "PTX60">;
def __nvvm_match_all_sync_i64p: TargetBuiltin<"WiUiWii*", "", "PTX60">;

// Membar

def __nvvm_membar_cta: Builtin<"v", "">;
def __nvvm_membar_gl: Builtin<"v", "">;
def __nvvm_membar_sys: Builtin<"v", "">;

// Memcpy, Memset

def __nvvm_memcpy: Builtin<"vUc*Uc*zi", "">;
def __nvvm_memset: Builtin<"vUc*Uczi", "">;

// Image

def __builtin_ptx_read_image2Dfi_: Builtin<"V4fiiii", "">;
def __builtin_ptx_read_image2Dff_: Builtin<"V4fiiff", "">;
def __builtin_ptx_read_image2Dii_: Builtin<"V4iiiii", "">;
def __builtin_ptx_read_image2Dif_: Builtin<"V4iiiff", "">;

def __builtin_ptx_read_image3Dfi_: Builtin<"V4fiiiiii", "">;
def __builtin_ptx_read_image3Dff_: Builtin<"V4fiiffff", "">;
def __builtin_ptx_read_image3Dii_: Builtin<"V4iiiiiii", "">;
def __builtin_ptx_read_image3Dif_: Builtin<"V4iiiffff", "">;

def __builtin_ptx_write_image2Df_: Builtin<"viiiffff", "">;
def __builtin_ptx_write_image2Di_: Builtin<"viiiiiii", "">;
def __builtin_ptx_write_image2Dui_: Builtin<"viiiUiUiUiUi", "">;
def __builtin_ptx_get_image_depthi_: Builtin<"ii", "">;
def __builtin_ptx_get_image_heighti_: Builtin<"ii", "">;
def __builtin_ptx_get_image_widthi_: Builtin<"ii", "">;
def __builtin_ptx_get_image_channel_data_typei_: Builtin<"ii", "">;
def __builtin_ptx_get_image_channel_orderi_: Builtin<"ii", "">;

// Atomic
//
// We need the atom intrinsics because
// - they are used in converging analysis
// - they are used in address space analysis and optimization
// So it does not hurt to expose them as builtins.
//
def __nvvm_atom_add_gen_i: Builtin<"iiD*i", "n">;
def __nvvm_atom_cta_add_gen_i: TargetBuiltin<"iiD*i", "n", "SM_60">;
def __nvvm_atom_sys_add_gen_i: TargetBuiltin<"iiD*i", "n", "SM_60">;
def __nvvm_atom_add_gen_l: Builtin<"LiLiD*Li", "n">;
def __nvvm_atom_cta_add_gen_l: TargetBuiltin<"LiLiD*Li", "n", "SM_60">;
def __nvvm_atom_sys_add_gen_l: TargetBuiltin<"LiLiD*Li", "n", "SM_60">;
def __nvvm_atom_add_gen_ll: Builtin<"LLiLLiD*LLi", "n">;
def __nvvm_atom_cta_add_gen_ll: TargetBuiltin<"LLiLLiD*LLi", "n", "SM_60">;
def __nvvm_atom_sys_add_gen_ll: TargetBuiltin<"LLiLLiD*LLi", "n", "SM_60">;
def __nvvm_atom_add_gen_f: Builtin<"ffD*f", "n">;
def __nvvm_atom_cta_add_gen_f: TargetBuiltin<"ffD*f", "n", "SM_60">;
def __nvvm_atom_sys_add_gen_f: TargetBuiltin<"ffD*f", "n", "SM_60">;
def __nvvm_atom_add_gen_d: TargetBuiltin<"ddD*d", "n", "SM_60">;
def __nvvm_atom_cta_add_gen_d: TargetBuiltin<"ddD*d", "n", "SM_60">;
def __nvvm_atom_sys_add_gen_d: TargetBuiltin<"ddD*d", "n", "SM_60">;

def __nvvm_atom_sub_gen_i: Builtin<"iiD*i", "n">;
def __nvvm_atom_sub_gen_l: Builtin<"LiLiD*Li", "n">;
def __nvvm_atom_sub_gen_ll: Builtin<"LLiLLiD*LLi", "n">;

def __nvvm_atom_xchg_gen_i: Builtin<"iiD*i", "n">;
def __nvvm_atom_cta_xchg_gen_i: TargetBuiltin<"iiD*i", "n", "SM_60">;
def __nvvm_atom_sys_xchg_gen_i: TargetBuiltin<"iiD*i", "n", "SM_60">;
def __nvvm_atom_xchg_gen_l: Builtin<"LiLiD*Li", "n">;
def __nvvm_atom_cta_xchg_gen_l: TargetBuiltin<"LiLiD*Li", "n", "SM_60">;
def __nvvm_atom_sys_xchg_gen_l: TargetBuiltin<"LiLiD*Li", "n", "SM_60">;
def __nvvm_atom_xchg_gen_ll: Builtin<"LLiLLiD*LLi", "n">;
def __nvvm_atom_cta_xchg_gen_ll: TargetBuiltin<"LLiLLiD*LLi", "n", "SM_60">;
def __nvvm_atom_sys_xchg_gen_ll: TargetBuiltin<"LLiLLiD*LLi", "n", "SM_60">;

def __nvvm_atom_max_gen_i: Builtin<"iiD*i", "n">;
def __nvvm_atom_cta_max_gen_i: TargetBuiltin<"iiD*i", "n", "SM_60">;
def __nvvm_atom_sys_max_gen_i: TargetBuiltin<"iiD*i", "n", "SM_60">;
def __nvvm_atom_max_gen_ui: Builtin<"UiUiD*Ui", "n">;
def __nvvm_atom_cta_max_gen_ui: TargetBuiltin<"UiUiD*Ui", "n", "SM_60">;
def __nvvm_atom_sys_max_gen_ui: TargetBuiltin<"UiUiD*Ui", "n", "SM_60">;
def __nvvm_atom_max_gen_l: Builtin<"LiLiD*Li", "n">;
def __nvvm_atom_cta_max_gen_l: TargetBuiltin<"LiLiD*Li", "n", "SM_60">;
def __nvvm_atom_sys_max_gen_l: TargetBuiltin<"LiLiD*Li", "n", "SM_60">;
def __nvvm_atom_max_gen_ul: Builtin<"ULiULiD*ULi", "n">;
def __nvvm_atom_cta_max_gen_ul: TargetBuiltin<"ULiULiD*ULi", "n", "SM_60">;
def __nvvm_atom_sys_max_gen_ul: TargetBuiltin<"ULiULiD*ULi", "n", "SM_60">;
def __nvvm_atom_max_gen_ll: Builtin<"LLiLLiD*LLi", "n">;
def __nvvm_atom_cta_max_gen_ll: TargetBuiltin<"LLiLLiD*LLi", "n", "SM_60">;
def __nvvm_atom_sys_max_gen_ll: TargetBuiltin<"LLiLLiD*LLi", "n", "SM_60">;
def __nvvm_atom_max_gen_ull: Builtin<"ULLiULLiD*ULLi", "n">;
def __nvvm_atom_cta_max_gen_ull: TargetBuiltin<"ULLiULLiD*ULLi", "n", "SM_60">;
def __nvvm_atom_sys_max_gen_ull: TargetBuiltin<"ULLiULLiD*ULLi", "n", "SM_60">;

def __nvvm_atom_min_gen_i: Builtin<"iiD*i", "n">;
def __nvvm_atom_cta_min_gen_i: TargetBuiltin<"iiD*i", "n", "SM_60">;
def __nvvm_atom_sys_min_gen_i: TargetBuiltin<"iiD*i", "n", "SM_60">;
def __nvvm_atom_min_gen_ui: Builtin<"UiUiD*Ui", "n">;
def __nvvm_atom_cta_min_gen_ui: TargetBuiltin<"UiUiD*Ui", "n", "SM_60">;
def __nvvm_atom_sys_min_gen_ui: TargetBuiltin<"UiUiD*Ui", "n", "SM_60">;
def __nvvm_atom_min_gen_l: Builtin<"LiLiD*Li", "n">;
def __nvvm_atom_cta_min_gen_l: TargetBuiltin<"LiLiD*Li", "n", "SM_60">;
def __nvvm_atom_sys_min_gen_l: TargetBuiltin<"LiLiD*Li", "n", "SM_60">;
def __nvvm_atom_min_gen_ul: Builtin<"ULiULiD*ULi", "n">;
def __nvvm_atom_cta_min_gen_ul: TargetBuiltin<"ULiULiD*ULi", "n", "SM_60">;
def __nvvm_atom_sys_min_gen_ul: TargetBuiltin<"ULiULiD*ULi", "n", "SM_60">;
def __nvvm_atom_min_gen_ll: Builtin<"LLiLLiD*LLi", "n">;
def __nvvm_atom_cta_min_gen_ll: TargetBuiltin<"LLiLLiD*LLi", "n", "SM_60">;
def __nvvm_atom_sys_min_gen_ll: TargetBuiltin<"LLiLLiD*LLi", "n", "SM_60">;
def __nvvm_atom_min_gen_ull: Builtin<"ULLiULLiD*ULLi", "n">;
def __nvvm_atom_cta_min_gen_ull: TargetBuiltin<"ULLiULLiD*ULLi", "n", "SM_60">;
def __nvvm_atom_sys_min_gen_ull: TargetBuiltin<"ULLiULLiD*ULLi", "n", "SM_60">;

def __nvvm_atom_inc_gen_ui: Builtin<"UiUiD*Ui", "n">;
def __nvvm_atom_cta_inc_gen_ui: TargetBuiltin<"UiUiD*Ui", "n", "SM_60">;
def __nvvm_atom_sys_inc_gen_ui: TargetBuiltin<"UiUiD*Ui", "n", "SM_60">;
def __nvvm_atom_dec_gen_ui: Builtin<"UiUiD*Ui", "n">;
def __nvvm_atom_cta_dec_gen_ui: TargetBuiltin<"UiUiD*Ui", "n", "SM_60">;
def __nvvm_atom_sys_dec_gen_ui: TargetBuiltin<"UiUiD*Ui", "n", "SM_60">;

def __nvvm_atom_and_gen_i: Builtin<"iiD*i", "n">;
def __nvvm_atom_cta_and_gen_i: TargetBuiltin<"iiD*i", "n", "SM_60">;
def __nvvm_atom_sys_and_gen_i: TargetBuiltin<"iiD*i", "n", "SM_60">;
def __nvvm_atom_and_gen_l: Builtin<"LiLiD*Li", "n">;
def __nvvm_atom_cta_and_gen_l: TargetBuiltin<"LiLiD*Li", "n", "SM_60">;
def __nvvm_atom_sys_and_gen_l: TargetBuiltin<"LiLiD*Li", "n", "SM_60">;
def __nvvm_atom_and_gen_ll: Builtin<"LLiLLiD*LLi", "n">;
def __nvvm_atom_cta_and_gen_ll: TargetBuiltin<"LLiLLiD*LLi", "n", "SM_60">;
def __nvvm_atom_sys_and_gen_ll: TargetBuiltin<"LLiLLiD*LLi", "n", "SM_60">;

def __nvvm_atom_or_gen_i: Builtin<"iiD*i", "n">;
def __nvvm_atom_cta_or_gen_i: TargetBuiltin<"iiD*i", "n", "SM_60">;
def __nvvm_atom_sys_or_gen_i: TargetBuiltin<"iiD*i", "n", "SM_60">;
def __nvvm_atom_or_gen_l: Builtin<"LiLiD*Li", "n">;
def __nvvm_atom_cta_or_gen_l: TargetBuiltin<"LiLiD*Li", "n", "SM_60">;
def __nvvm_atom_sys_or_gen_l: TargetBuiltin<"LiLiD*Li", "n", "SM_60">;
def __nvvm_atom_or_gen_ll: Builtin<"LLiLLiD*LLi", "n">;
def __nvvm_atom_cta_or_gen_ll: TargetBuiltin<"LLiLLiD*LLi", "n", "SM_60">;
def __nvvm_atom_sys_or_gen_ll: TargetBuiltin<"LLiLLiD*LLi", "n", "SM_60">;

def __nvvm_atom_xor_gen_i: Builtin<"iiD*i", "n">;
def __nvvm_atom_cta_xor_gen_i: TargetBuiltin<"iiD*i", "n", "SM_60">;
def __nvvm_atom_sys_xor_gen_i: TargetBuiltin<"iiD*i", "n", "SM_60">;
def __nvvm_atom_xor_gen_l: Builtin<"LiLiD*Li", "n">;
def __nvvm_atom_cta_xor_gen_l: TargetBuiltin<"LiLiD*Li", "n", "SM_60">;
def __nvvm_atom_sys_xor_gen_l: TargetBuiltin<"LiLiD*Li", "n", "SM_60">;
def __nvvm_atom_xor_gen_ll: Builtin<"LLiLLiD*LLi", "n">;
def __nvvm_atom_cta_xor_gen_ll: TargetBuiltin<"LLiLLiD*LLi", "n", "SM_60">;
def __nvvm_atom_sys_xor_gen_ll: TargetBuiltin<"LLiLLiD*LLi", "n", "SM_60">;

def __nvvm_atom_cas_gen_i: Builtin<"iiD*ii", "n">;
def __nvvm_atom_cta_cas_gen_i: TargetBuiltin<"iiD*ii", "n", "SM_60">;
def __nvvm_atom_sys_cas_gen_i: TargetBuiltin<"iiD*ii", "n", "SM_60">;
def __nvvm_atom_cas_gen_l: Builtin<"LiLiD*LiLi", "n">;
def __nvvm_atom_cta_cas_gen_l: TargetBuiltin<"LiLiD*LiLi", "n", "SM_60">;
def __nvvm_atom_sys_cas_gen_l: TargetBuiltin<"LiLiD*LiLi", "n", "SM_60">;
def __nvvm_atom_cas_gen_ll: Builtin<"LLiLLiD*LLiLLi", "n">;
def __nvvm_atom_cta_cas_gen_ll: TargetBuiltin<"LLiLLiD*LLiLLi", "n", "SM_60">;
def __nvvm_atom_sys_cas_gen_ll: TargetBuiltin<"LLiLLiD*LLiLLi", "n", "SM_60">;

// Compiler Error Warn
def __nvvm_compiler_error: Builtin<"vcC*4", "n">;
def __nvvm_compiler_warn: Builtin<"vcC*4", "n">;

// __ldg.  This is not implemented as a builtin by nvcc.
def __nvvm_ldg_c: Builtin<"ccC*", "">;
def __nvvm_ldg_s: Builtin<"ssC*", "">;
def __nvvm_ldg_i: Builtin<"iiC*", "">;
def __nvvm_ldg_l: Builtin<"LiLiC*", "">;
def __nvvm_ldg_ll: Builtin<"LLiLLiC*", "">;

def __nvvm_ldg_uc: Builtin<"UcUcC*", "">;
def __nvvm_ldg_us: Builtin<"UsUsC*", "">;
def __nvvm_ldg_ui: Builtin<"UiUiC*", "">;
def __nvvm_ldg_ul: Builtin<"ULiULiC*", "">;
def __nvvm_ldg_ull: Builtin<"ULLiULLiC*", "">;

def __nvvm_ldg_f: Builtin<"ffC*", "">;
def __nvvm_ldg_d: Builtin<"ddC*", "">;

def __nvvm_ldg_c2: Builtin<"E2cE2cC*", "">;
def __nvvm_ldg_c4: Builtin<"E4cE4cC*", "">;
def __nvvm_ldg_s2: Builtin<"E2sE2sC*", "">;
def __nvvm_ldg_s4: Builtin<"E4sE4sC*", "">;
def __nvvm_ldg_i2: Builtin<"E2iE2iC*", "">;
def __nvvm_ldg_i4: Builtin<"E4iE4iC*", "">;
def __nvvm_ldg_ll2: Builtin<"E2LLiE2LLiC*", "">;

def __nvvm_ldg_uc2: Builtin<"E2UcE2UcC*", "">;
def __nvvm_ldg_uc4: Builtin<"E4UcE4UcC*", "">;
def __nvvm_ldg_us2: Builtin<"E2UsE2UsC*", "">;
def __nvvm_ldg_us4: Builtin<"E4UsE4UsC*", "">;
def __nvvm_ldg_ui2: Builtin<"E2UiE2UiC*", "">;
def __nvvm_ldg_ui4: Builtin<"E4UiE4UiC*", "">;
def __nvvm_ldg_ull2: Builtin<"E2ULLiE2ULLiC*", "">;

def __nvvm_ldg_f2: Builtin<"E2fE2fC*", "">;
def __nvvm_ldg_f4: Builtin<"E4fE4fC*", "">;
def __nvvm_ldg_d2: Builtin<"E2dE2dC*", "">;

// Builtins to support WMMA instructions on sm_70
def __hmma_m16n16k16_ld_a: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_70,PTX60)">;
def __hmma_m16n16k16_ld_b: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_70,PTX60)">;
def __hmma_m16n16k16_ld_c_f16: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_70,PTX60)">;
def __hmma_m16n16k16_ld_c_f32: TargetBuiltin<"vf*fC*UiIi", "", "AND(SM_70,PTX60)">;
def __hmma_m16n16k16_st_c_f16: TargetBuiltin<"vi*i*UiIi", "", "AND(SM_70,PTX60)">;
def __hmma_m16n16k16_st_c_f32: TargetBuiltin<"vf*f*UiIi", "", "AND(SM_70,PTX60)">;

def __hmma_m32n8k16_ld_a: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m32n8k16_ld_b: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m32n8k16_ld_c_f16: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m32n8k16_ld_c_f32: TargetBuiltin<"vf*fC*UiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m32n8k16_st_c_f16: TargetBuiltin<"vi*i*UiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m32n8k16_st_c_f32: TargetBuiltin<"vf*f*UiIi", "", "AND(SM_70,PTX61)">;

def __hmma_m8n32k16_ld_a: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m8n32k16_ld_b: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m8n32k16_ld_c_f16: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m8n32k16_ld_c_f32: TargetBuiltin<"vf*fC*UiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m8n32k16_st_c_f16: TargetBuiltin<"vi*i*UiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m8n32k16_st_c_f32: TargetBuiltin<"vf*f*UiIi", "", "AND(SM_70,PTX61)">;

def __hmma_m16n16k16_mma_f16f16: TargetBuiltin<"vi*iC*iC*iC*IiIi", "", "AND(SM_70,PTX60)">;
def __hmma_m16n16k16_mma_f32f16: TargetBuiltin<"vf*iC*iC*iC*IiIi", "", "AND(SM_70,PTX60)">;
def __hmma_m16n16k16_mma_f32f32: TargetBuiltin<"vf*iC*iC*fC*IiIi", "", "AND(SM_70,PTX60)">;
def __hmma_m16n16k16_mma_f16f32: TargetBuiltin<"vi*iC*iC*fC*IiIi", "", "AND(SM_70,PTX60)">;

def __hmma_m32n8k16_mma_f16f16: TargetBuiltin<"vi*iC*iC*iC*IiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m32n8k16_mma_f32f16: TargetBuiltin<"vf*iC*iC*iC*IiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m32n8k16_mma_f32f32: TargetBuiltin<"vf*iC*iC*fC*IiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m32n8k16_mma_f16f32: TargetBuiltin<"vi*iC*iC*fC*IiIi", "", "AND(SM_70,PTX61)">;

def __hmma_m8n32k16_mma_f16f16: TargetBuiltin<"vi*iC*iC*iC*IiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m8n32k16_mma_f32f16: TargetBuiltin<"vf*iC*iC*iC*IiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m8n32k16_mma_f32f32: TargetBuiltin<"vf*iC*iC*fC*IiIi", "", "AND(SM_70,PTX61)">;
def __hmma_m8n32k16_mma_f16f32: TargetBuiltin<"vi*iC*iC*fC*IiIi", "", "AND(SM_70,PTX61)">;

// Builtins to support integer and sub-integer WMMA instructions on sm_72/sm_75
def __bmma_m8n8k128_ld_a_b1: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_75,PTX63)">;
def __bmma_m8n8k128_ld_b_b1: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_75,PTX63)">;
def __bmma_m8n8k128_ld_c: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_75,PTX63)">;
def __bmma_m8n8k128_mma_xor_popc_b1: TargetBuiltin<"vi*iC*iC*iC*Ii", "", "AND(SM_75,PTX63)">;
def __bmma_m8n8k128_st_c_i32: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_75,PTX63)">;
def __imma_m16n16k16_ld_a_s8: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m16n16k16_ld_a_u8: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m16n16k16_ld_b_s8: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m16n16k16_ld_b_u8: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m16n16k16_ld_c: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m16n16k16_mma_s8: TargetBuiltin<"vi*iC*iC*iC*IiIi", "", "AND(SM_72,PTX63)">;
def __imma_m16n16k16_mma_u8: TargetBuiltin<"vi*iC*iC*iC*IiIi", "", "AND(SM_72,PTX63)">;
def __imma_m16n16k16_st_c_i32: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m32n8k16_ld_a_s8: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m32n8k16_ld_a_u8: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m32n8k16_ld_b_s8: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m32n8k16_ld_b_u8: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m32n8k16_ld_c: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m32n8k16_mma_s8: TargetBuiltin<"vi*iC*iC*iC*IiIi", "", "AND(SM_72,PTX63)">;
def __imma_m32n8k16_mma_u8: TargetBuiltin<"vi*iC*iC*iC*IiIi", "", "AND(SM_72,PTX63)">;
def __imma_m32n8k16_st_c_i32: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m8n32k16_ld_a_s8: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m8n32k16_ld_a_u8: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m8n32k16_ld_b_s8: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m8n32k16_ld_b_u8: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m8n32k16_ld_c: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m8n32k16_mma_s8: TargetBuiltin<"vi*iC*iC*iC*IiIi", "", "AND(SM_72,PTX63)">;
def __imma_m8n32k16_mma_u8: TargetBuiltin<"vi*iC*iC*iC*IiIi", "", "AND(SM_72,PTX63)">;
def __imma_m8n32k16_st_c_i32: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_72,PTX63)">;
def __imma_m8n8k32_ld_a_s4: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_75,PTX63)">;
def __imma_m8n8k32_ld_a_u4: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_75,PTX63)">;
def __imma_m8n8k32_ld_b_s4: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_75,PTX63)">;
def __imma_m8n8k32_ld_b_u4: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_75,PTX63)">;
def __imma_m8n8k32_ld_c: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_75,PTX63)">;
def __imma_m8n8k32_mma_s4: TargetBuiltin<"vi*iC*iC*iC*IiIi", "", "AND(SM_75,PTX63)">;
def __imma_m8n8k32_mma_u4: TargetBuiltin<"vi*iC*iC*iC*IiIi", "", "AND(SM_75,PTX63)">;
def __imma_m8n8k32_st_c_i32: TargetBuiltin<"vi*iC*UiIi", "", "AND(SM_75,PTX63)">;

}
