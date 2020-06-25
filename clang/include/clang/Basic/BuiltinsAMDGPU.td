//==- BuiltinsAMDGPU.def - AMDGPU Builtin function database ------*- C++ -*-==//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the AMDGPU-specific builtin function database. Users of
// this file must define the BUILTIN macro to make use of this information.
//
//===----------------------------------------------------------------------===//

// Type and attribute strings are as defined in Builtins.td.

//===----------------------------------------------------------------------===//
// SI+ only builtins.
//===----------------------------------------------------------------------===//

include "BuiltinTableGenDefs.inc"

let TargetArch = "AMDGPU" in {
def __builtin_amdgcn_dispatch_ptr: Builtin<"v*4", "nc">;
def __builtin_amdgcn_kernarg_segment_ptr: Builtin<"v*4", "nc">;
def __builtin_amdgcn_implicitarg_ptr: Builtin<"v*4", "nc">;
def __builtin_amdgcn_queue_ptr: Builtin<"v*4", "nc">;

def __builtin_amdgcn_workgroup_id_x: Builtin<"Ui", "nc">;
def __builtin_amdgcn_workgroup_id_y: Builtin<"Ui", "nc">;
def __builtin_amdgcn_workgroup_id_z: Builtin<"Ui", "nc">;

def __builtin_amdgcn_workitem_id_x: Builtin<"Ui", "nc">;
def __builtin_amdgcn_workitem_id_y: Builtin<"Ui", "nc">;
def __builtin_amdgcn_workitem_id_z: Builtin<"Ui", "nc">;

def __builtin_amdgcn_workgroup_size_x: Builtin<"Us", "nc">;
def __builtin_amdgcn_workgroup_size_y: Builtin<"Us", "nc">;
def __builtin_amdgcn_workgroup_size_z: Builtin<"Us", "nc">;

def __builtin_amdgcn_mbcnt_hi: Builtin<"UiUiUi", "nc">;
def __builtin_amdgcn_mbcnt_lo: Builtin<"UiUiUi", "nc">;

//===----------------------------------------------------------------------===//
// Instruction builtins.
//===----------------------------------------------------------------------===//
def __builtin_amdgcn_s_getreg: Builtin<"UiIi", "n">;
def __builtin_amdgcn_s_setreg: Builtin<"vIiUi", "n">;
def __builtin_amdgcn_s_getpc: Builtin<"LUi", "n">;
def __builtin_amdgcn_s_waitcnt: Builtin<"vIi", "n">;
def __builtin_amdgcn_s_sendmsg: Builtin<"vIiUi", "n">;
def __builtin_amdgcn_s_sendmsghalt: Builtin<"vIiUi", "n">;
def __builtin_amdgcn_s_barrier: Builtin<"v", "n">;
def __builtin_amdgcn_wave_barrier: Builtin<"v", "n">;
def __builtin_amdgcn_s_dcache_inv: Builtin<"v", "n">;
def __builtin_amdgcn_buffer_wbinvl1: Builtin<"v", "n">;
def __builtin_amdgcn_ds_gws_init: Builtin<"vUiUi", "n">;
def __builtin_amdgcn_ds_gws_barrier: Builtin<"vUiUi", "n">;
def __builtin_amdgcn_ds_gws_sema_v: Builtin<"vUi", "n">;
def __builtin_amdgcn_ds_gws_sema_br: Builtin<"vUiUi", "n">;
def __builtin_amdgcn_ds_gws_sema_p: Builtin<"vUi", "n">;
def __builtin_amdgcn_fence: Builtin<"vUicC*", "n">;

def __builtin_amdgcn_atomic_inc32: Builtin<"ZiZiD*ZiUicC*", "n">;
def __builtin_amdgcn_atomic_inc64: Builtin<"WiWiD*WiUicC*", "n">;

def __builtin_amdgcn_atomic_dec32: Builtin<"ZiZiD*ZiUicC*", "n">;
def __builtin_amdgcn_atomic_dec64: Builtin<"WiWiD*WiUicC*", "n">;

// FIXME: Need to disallow constant address space.
def __builtin_amdgcn_div_scale: Builtin<"dddbb*", "n">;
def __builtin_amdgcn_div_scalef: Builtin<"fffbb*", "n">;
def __builtin_amdgcn_div_fmas: Builtin<"ddddb", "nc">;
def __builtin_amdgcn_div_fmasf: Builtin<"ffffb", "nc">;
def __builtin_amdgcn_div_fixup: Builtin<"dddd", "nc">;
def __builtin_amdgcn_div_fixupf: Builtin<"ffff", "nc">;
def __builtin_amdgcn_trig_preop: Builtin<"ddi", "nc">;
def __builtin_amdgcn_trig_preopf: Builtin<"ffi", "nc">;
def __builtin_amdgcn_rcp: Builtin<"dd", "nc">;
def __builtin_amdgcn_rcpf: Builtin<"ff", "nc">;
def __builtin_amdgcn_rsq: Builtin<"dd", "nc">;
def __builtin_amdgcn_rsqf: Builtin<"ff", "nc">;
def __builtin_amdgcn_rsq_clamp: Builtin<"dd", "nc">;
def __builtin_amdgcn_rsq_clampf: Builtin<"ff", "nc">;
def __builtin_amdgcn_sinf: Builtin<"ff", "nc">;
def __builtin_amdgcn_cosf: Builtin<"ff", "nc">;
def __builtin_amdgcn_log_clampf: Builtin<"ff", "nc">;
def __builtin_amdgcn_ldexp: Builtin<"ddi", "nc">;
def __builtin_amdgcn_ldexpf: Builtin<"ffi", "nc">;
def __builtin_amdgcn_frexp_mant: Builtin<"dd", "nc">;
def __builtin_amdgcn_frexp_mantf: Builtin<"ff", "nc">;
def __builtin_amdgcn_frexp_exp: Builtin<"id", "nc">;
def __builtin_amdgcn_frexp_expf: Builtin<"if", "nc">;
def __builtin_amdgcn_fract: Builtin<"dd", "nc">;
def __builtin_amdgcn_fractf: Builtin<"ff", "nc">;
def __builtin_amdgcn_lerp: Builtin<"UiUiUiUi", "nc">;
def __builtin_amdgcn_class: Builtin<"bdi", "nc">;
def __builtin_amdgcn_classf: Builtin<"bfi", "nc">;
def __builtin_amdgcn_cubeid: Builtin<"ffff", "nc">;
def __builtin_amdgcn_cubesc: Builtin<"ffff", "nc">;
def __builtin_amdgcn_cubetc: Builtin<"ffff", "nc">;
def __builtin_amdgcn_cubema: Builtin<"ffff", "nc">;
def __builtin_amdgcn_s_memtime: Builtin<"LUi", "n">;
def __builtin_amdgcn_s_sleep: Builtin<"vIi", "n">;
def __builtin_amdgcn_s_incperflevel: Builtin<"vIi", "n">;
def __builtin_amdgcn_s_decperflevel: Builtin<"vIi", "n">;
def __builtin_amdgcn_uicmp: Builtin<"LUiUiUiIi", "nc">;
def __builtin_amdgcn_uicmpl: Builtin<"LUiLUiLUiIi", "nc">;
def __builtin_amdgcn_sicmp: Builtin<"LUiiiIi", "nc">;
def __builtin_amdgcn_sicmpl: Builtin<"LUiLiLiIi", "nc">;
def __builtin_amdgcn_fcmp: Builtin<"LUiddIi", "nc">;
def __builtin_amdgcn_fcmpf: Builtin<"LUiffIi", "nc">;
def __builtin_amdgcn_ds_swizzle: Builtin<"iiIi", "nc">;
def __builtin_amdgcn_ds_permute: Builtin<"iii", "nc">;
def __builtin_amdgcn_ds_bpermute: Builtin<"iii", "nc">;
def __builtin_amdgcn_readfirstlane: Builtin<"ii", "nc">;
def __builtin_amdgcn_readlane: Builtin<"iii", "nc">;
def __builtin_amdgcn_fmed3f: Builtin<"ffff", "nc">;
def __builtin_amdgcn_ds_faddf: Builtin<"ff*3fIiIiIb", "n">;
def __builtin_amdgcn_ds_fminf: Builtin<"ff*3fIiIiIb", "n">;
def __builtin_amdgcn_ds_fmaxf: Builtin<"ff*3fIiIiIb", "n">;
def __builtin_amdgcn_ds_append: Builtin<"ii*3", "n">;
def __builtin_amdgcn_ds_consume: Builtin<"ii*3", "n">;
def __builtin_amdgcn_alignbit: Builtin<"UiUiUiUi", "nc">;
def __builtin_amdgcn_alignbyte: Builtin<"UiUiUiUi", "nc">;
def __builtin_amdgcn_ubfe: Builtin<"UiUiUiUi", "nc">;
def __builtin_amdgcn_sbfe: Builtin<"UiUiUiUi", "nc">;
def __builtin_amdgcn_cvt_pkrtz: Builtin<"E2hff", "nc">;
def __builtin_amdgcn_cvt_pknorm_i16: Builtin<"E2sff", "nc">;
def __builtin_amdgcn_cvt_pknorm_u16: Builtin<"E2Usff", "nc">;
def __builtin_amdgcn_cvt_pk_i16: Builtin<"E2sii", "nc">;
def __builtin_amdgcn_cvt_pk_u16: Builtin<"E2UsUiUi", "nc">;
def __builtin_amdgcn_cvt_pk_u8_f32: Builtin<"UifUiUi", "nc">;
def __builtin_amdgcn_sad_u8: Builtin<"UiUiUiUi", "nc">;
def __builtin_amdgcn_msad_u8: Builtin<"UiUiUiUi", "nc">;
def __builtin_amdgcn_sad_hi_u8: Builtin<"UiUiUiUi", "nc">;
def __builtin_amdgcn_sad_u16: Builtin<"UiUiUiUi", "nc">;
def __builtin_amdgcn_qsad_pk_u16_u8: Builtin<"LUiLUiUiLUi", "nc">;
def __builtin_amdgcn_mqsad_pk_u16_u8: Builtin<"LUiLUiUiLUi", "nc">;
def __builtin_amdgcn_mqsad_u32_u8: Builtin<"V4UiLUiUiV4Ui", "nc">;

//===----------------------------------------------------------------------===//
// CI+ only builtins.
//===----------------------------------------------------------------------===//
def __builtin_amdgcn_s_dcache_inv_vol: TargetBuiltin<"v", "n", "ci-insts">;
def __builtin_amdgcn_buffer_wbinvl1_vol: TargetBuiltin<"v", "n", "ci-insts">;
def __builtin_amdgcn_ds_gws_sema_release_all: TargetBuiltin<"vUi", "n", "ci-insts">;
def __builtin_amdgcn_is_shared: TargetBuiltin<"bvC*0", "nc", "flat-address-space">;
def __builtin_amdgcn_is_private: TargetBuiltin<"bvC*0", "nc", "flat-address-space">;

//===----------------------------------------------------------------------===//
// Interpolation builtins.
//===----------------------------------------------------------------------===//
def __builtin_amdgcn_interp_p1_f16: Builtin<"ffUiUibUi", "nc">;
def __builtin_amdgcn_interp_p2_f16: Builtin<"hffUiUibUi", "nc">;
def __builtin_amdgcn_interp_p1: Builtin<"ffUiUiUi", "nc">;
def __builtin_amdgcn_interp_p2: Builtin<"fffUiUiUi", "nc">;
def __builtin_amdgcn_interp_mov: Builtin<"fUiUiUiUi", "nc">;

//===----------------------------------------------------------------------===//
// VI+ only builtins.
//===----------------------------------------------------------------------===//

def __builtin_amdgcn_div_fixuph: TargetBuiltin<"hhhh", "nc", "16-bit-insts">;
def __builtin_amdgcn_rcph: TargetBuiltin<"hh", "nc", "16-bit-insts">;
def __builtin_amdgcn_rsqh: TargetBuiltin<"hh", "nc", "16-bit-insts">;
def __builtin_amdgcn_sinh: TargetBuiltin<"hh", "nc", "16-bit-insts">;
def __builtin_amdgcn_cosh: TargetBuiltin<"hh", "nc", "16-bit-insts">;
def __builtin_amdgcn_ldexph: TargetBuiltin<"hhi", "nc", "16-bit-insts">;
def __builtin_amdgcn_frexp_manth: TargetBuiltin<"hh", "nc", "16-bit-insts">;
def __builtin_amdgcn_frexp_exph: TargetBuiltin<"sh", "nc", "16-bit-insts">;
def __builtin_amdgcn_fracth: TargetBuiltin<"hh", "nc", "16-bit-insts">;
def __builtin_amdgcn_classh: TargetBuiltin<"bhi", "nc", "16-bit-insts">;
def __builtin_amdgcn_s_memrealtime: TargetBuiltin<"LUi", "n", "s-memrealtime">;
def __builtin_amdgcn_mov_dpp: TargetBuiltin<"iiIiIiIiIb", "nc", "dpp">;
def __builtin_amdgcn_update_dpp: TargetBuiltin<"iiiIiIiIiIb", "nc", "dpp">;
def __builtin_amdgcn_s_dcache_wb: TargetBuiltin<"v", "n", "gfx8-insts">;

//===----------------------------------------------------------------------===//
// GFX9+ only builtins.
//===----------------------------------------------------------------------===//

def __builtin_amdgcn_fmed3h: TargetBuiltin<"hhhh", "nc", "gfx9-insts">;

//===----------------------------------------------------------------------===//
// Deep learning builtins.
//===----------------------------------------------------------------------===//

def __builtin_amdgcn_fdot2: TargetBuiltin<"fV2hV2hfIb", "nc", "dot2-insts">;
def __builtin_amdgcn_sdot2: TargetBuiltin<"SiV2SsV2SsSiIb", "nc", "dot2-insts">;
def __builtin_amdgcn_udot2: TargetBuiltin<"UiV2UsV2UsUiIb", "nc", "dot2-insts">;
def __builtin_amdgcn_sdot4: TargetBuiltin<"SiSiSiSiIb", "nc", "dot1-insts">;
def __builtin_amdgcn_udot4: TargetBuiltin<"UiUiUiUiIb", "nc", "dot2-insts">;
def __builtin_amdgcn_sdot8: TargetBuiltin<"SiSiSiSiIb", "nc", "dot1-insts">;
def __builtin_amdgcn_udot8: TargetBuiltin<"UiUiUiUiIb", "nc", "dot2-insts">;

//===----------------------------------------------------------------------===//
// GFX10+ only builtins.
//===----------------------------------------------------------------------===//
def __builtin_amdgcn_permlane16: TargetBuiltin<"UiUiUiUiUiIbIb", "nc", "gfx10-insts">;
def __builtin_amdgcn_permlanex16: TargetBuiltin<"UiUiUiUiUiIbIb", "nc", "gfx10-insts">;
def __builtin_amdgcn_mov_dpp8: TargetBuiltin<"UiUiIUi", "nc", "gfx10-insts">;

//===----------------------------------------------------------------------===//
// Special builtins.
//===----------------------------------------------------------------------===//
def __builtin_amdgcn_read_exec: Builtin<"LUi", "nc">;
def __builtin_amdgcn_read_exec_lo: Builtin<"Ui", "nc">;
def __builtin_amdgcn_read_exec_hi: Builtin<"Ui", "nc">;

//===----------------------------------------------------------------------===//
// R600-NI only builtins.
//===----------------------------------------------------------------------===//

def __builtin_r600_implicitarg_ptr: Builtin<"Uc*7", "nc">;

def __builtin_r600_read_tgid_x: Builtin<"Ui", "nc">;
def __builtin_r600_read_tgid_y: Builtin<"Ui", "nc">;
def __builtin_r600_read_tgid_z: Builtin<"Ui", "nc">;

def __builtin_r600_read_tidig_x: Builtin<"Ui", "nc">;
def __builtin_r600_read_tidig_y: Builtin<"Ui", "nc">;
def __builtin_r600_read_tidig_z: Builtin<"Ui", "nc">;

def __builtin_r600_recipsqrt_ieee: Builtin<"dd", "nc">;
def __builtin_r600_recipsqrt_ieeef: Builtin<"ff", "nc">;

//===----------------------------------------------------------------------===//
// MFMA builtins.
//===----------------------------------------------------------------------===//

def __builtin_amdgcn_mfma_f32_32x32x1f32: TargetBuiltin<"V32fffV32fIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_f32_16x16x1f32: TargetBuiltin<"V16fffV16fIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_f32_4x4x1f32: TargetBuiltin<"V4fffV4fIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_f32_32x32x2f32: TargetBuiltin<"V16fffV16fIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_f32_16x16x4f32: TargetBuiltin<"V4fffV4fIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_f32_32x32x4f16: TargetBuiltin<"V32fV4hV4hV32fIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_f32_16x16x4f16: TargetBuiltin<"V16fV4hV4hV16fIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_f32_4x4x4f16: TargetBuiltin<"V4fV4hV4hV4fIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_f32_32x32x8f16: TargetBuiltin<"V16fV4hV4hV16fIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_f32_16x16x16f16: TargetBuiltin<"V4fV4hV4hV4fIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_i32_32x32x4i8: TargetBuiltin<"V32iiiV32iIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_i32_16x16x4i8: TargetBuiltin<"V16iiiV16iIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_i32_4x4x4i8: TargetBuiltin<"V4iiiV4iIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_i32_32x32x8i8: TargetBuiltin<"V16iiiV16iIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_i32_16x16x16i8: TargetBuiltin<"V4iiiV4iIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_f32_32x32x2bf16: TargetBuiltin<"V32fV2sV2sV32fIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_f32_16x16x2bf16: TargetBuiltin<"V16fV2sV2sV16fIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_f32_4x4x2bf16: TargetBuiltin<"V4fV2sV2sV4fIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_f32_32x32x4bf16: TargetBuiltin<"V16fV2sV2sV16fIiIiIi", "nc", "mai-insts">;
def __builtin_amdgcn_mfma_f32_16x16x8bf16: TargetBuiltin<"V4fV2sV2sV4fIiIiIi", "nc", "mai-insts">;

}
