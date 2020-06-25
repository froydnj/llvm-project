//===-- BuiltinsMips.def - Mips Builtin function database --------*- C++ -*-==//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the MIPS-specific builtin function database. Users of
// this file must define the BUILTIN macro to make use of this information.
//
//===----------------------------------------------------------------------===//

// Type and attribute strings are as defined in Builtins.td.

// MIPS DSP Rev 1

// Add/subtract with optional saturation
include "BuiltinTableGenDefs.inc"

let TargetArch = "Mips" in {
def __builtin_mips_addu_qb: Builtin<"V4ScV4ScV4Sc", "n">;
def __builtin_mips_addu_s_qb: Builtin<"V4ScV4ScV4Sc", "n">;
def __builtin_mips_subu_qb: Builtin<"V4ScV4ScV4Sc", "n">;
def __builtin_mips_subu_s_qb: Builtin<"V4ScV4ScV4Sc", "n">;

def __builtin_mips_addq_ph: Builtin<"V2sV2sV2s", "n">;
def __builtin_mips_addq_s_ph: Builtin<"V2sV2sV2s", "n">;
def __builtin_mips_subq_ph: Builtin<"V2sV2sV2s", "n">;
def __builtin_mips_subq_s_ph: Builtin<"V2sV2sV2s", "n">;

def __builtin_mips_madd: Builtin<"LLiLLiii", "nc">;
def __builtin_mips_maddu: Builtin<"LLiLLiUiUi", "nc">;
def __builtin_mips_msub: Builtin<"LLiLLiii", "nc">;
def __builtin_mips_msubu: Builtin<"LLiLLiUiUi", "nc">;

def __builtin_mips_addq_s_w: Builtin<"iii", "n">;
def __builtin_mips_subq_s_w: Builtin<"iii", "n">;

def __builtin_mips_addsc: Builtin<"iii", "n">;
def __builtin_mips_addwc: Builtin<"iii", "n">;

def __builtin_mips_modsub: Builtin<"iii", "nc">;

def __builtin_mips_raddu_w_qb: Builtin<"iV4Sc", "nc">;

def __builtin_mips_absq_s_ph: Builtin<"V2sV2s", "n">;
def __builtin_mips_absq_s_w: Builtin<"ii", "n">;

def __builtin_mips_precrq_qb_ph: Builtin<"V4ScV2sV2s", "nc">;
def __builtin_mips_precrqu_s_qb_ph: Builtin<"V4ScV2sV2s", "n">;
def __builtin_mips_precrq_ph_w: Builtin<"V2sii", "nc">;
def __builtin_mips_precrq_rs_ph_w: Builtin<"V2sii", "n">;
def __builtin_mips_preceq_w_phl: Builtin<"iV2s", "nc">;
def __builtin_mips_preceq_w_phr: Builtin<"iV2s", "nc">;
def __builtin_mips_precequ_ph_qbl: Builtin<"V2sV4Sc", "nc">;
def __builtin_mips_precequ_ph_qbr: Builtin<"V2sV4Sc", "nc">;
def __builtin_mips_precequ_ph_qbla: Builtin<"V2sV4Sc", "nc">;
def __builtin_mips_precequ_ph_qbra: Builtin<"V2sV4Sc", "nc">;
def __builtin_mips_preceu_ph_qbl: Builtin<"V2sV4Sc", "nc">;
def __builtin_mips_preceu_ph_qbr: Builtin<"V2sV4Sc", "nc">;
def __builtin_mips_preceu_ph_qbla: Builtin<"V2sV4Sc", "nc">;
def __builtin_mips_preceu_ph_qbra: Builtin<"V2sV4Sc", "nc">;

def __builtin_mips_shll_qb: Builtin<"V4ScV4Sci", "n">;
def __builtin_mips_shrl_qb: Builtin<"V4ScV4Sci", "nc">;
def __builtin_mips_shll_ph: Builtin<"V2sV2si", "n">;
def __builtin_mips_shll_s_ph: Builtin<"V2sV2si", "n">;
def __builtin_mips_shra_ph: Builtin<"V2sV2si", "nc">;
def __builtin_mips_shra_r_ph: Builtin<"V2sV2si", "nc">;
def __builtin_mips_shll_s_w: Builtin<"iii", "n">;
def __builtin_mips_shra_r_w: Builtin<"iii", "nc">;
def __builtin_mips_shilo: Builtin<"LLiLLii", "nc">;

def __builtin_mips_muleu_s_ph_qbl: Builtin<"V2sV4ScV2s", "n">;
def __builtin_mips_muleu_s_ph_qbr: Builtin<"V2sV4ScV2s", "n">;
def __builtin_mips_mulq_rs_ph: Builtin<"V2sV2sV2s", "n">;
def __builtin_mips_muleq_s_w_phl: Builtin<"iV2sV2s", "n">;
def __builtin_mips_muleq_s_w_phr: Builtin<"iV2sV2s", "n">;
def __builtin_mips_mulsaq_s_w_ph: Builtin<"LLiLLiV2sV2s", "n">;
def __builtin_mips_maq_s_w_phl: Builtin<"LLiLLiV2sV2s", "n">;
def __builtin_mips_maq_s_w_phr: Builtin<"LLiLLiV2sV2s", "n">;
def __builtin_mips_maq_sa_w_phl: Builtin<"LLiLLiV2sV2s", "n">;
def __builtin_mips_maq_sa_w_phr: Builtin<"LLiLLiV2sV2s", "n">;
def __builtin_mips_mult: Builtin<"LLiii", "nc">;
def __builtin_mips_multu: Builtin<"LLiUiUi", "nc">;

def __builtin_mips_dpau_h_qbl: Builtin<"LLiLLiV4ScV4Sc", "nc">;
def __builtin_mips_dpau_h_qbr: Builtin<"LLiLLiV4ScV4Sc", "nc">;
def __builtin_mips_dpsu_h_qbl: Builtin<"LLiLLiV4ScV4Sc", "nc">;
def __builtin_mips_dpsu_h_qbr: Builtin<"LLiLLiV4ScV4Sc", "nc">;
def __builtin_mips_dpaq_s_w_ph: Builtin<"LLiLLiV2sV2s", "n">;
def __builtin_mips_dpsq_s_w_ph: Builtin<"LLiLLiV2sV2s", "n">;
def __builtin_mips_dpaq_sa_l_w: Builtin<"LLiLLiii", "n">;
def __builtin_mips_dpsq_sa_l_w: Builtin<"LLiLLiii", "n">;

def __builtin_mips_cmpu_eq_qb: Builtin<"vV4ScV4Sc", "n">;
def __builtin_mips_cmpu_lt_qb: Builtin<"vV4ScV4Sc", "n">;
def __builtin_mips_cmpu_le_qb: Builtin<"vV4ScV4Sc", "n">;
def __builtin_mips_cmpgu_eq_qb: Builtin<"iV4ScV4Sc", "n">;
def __builtin_mips_cmpgu_lt_qb: Builtin<"iV4ScV4Sc", "n">;
def __builtin_mips_cmpgu_le_qb: Builtin<"iV4ScV4Sc", "n">;
def __builtin_mips_cmp_eq_ph: Builtin<"vV2sV2s", "n">;
def __builtin_mips_cmp_lt_ph: Builtin<"vV2sV2s", "n">;
def __builtin_mips_cmp_le_ph: Builtin<"vV2sV2s", "n">;

def __builtin_mips_extr_s_h: Builtin<"iLLii", "n">;
def __builtin_mips_extr_w: Builtin<"iLLii", "n">;
def __builtin_mips_extr_rs_w: Builtin<"iLLii", "n">;
def __builtin_mips_extr_r_w: Builtin<"iLLii", "n">;
def __builtin_mips_extp: Builtin<"iLLii", "n">;
def __builtin_mips_extpdp: Builtin<"iLLii", "n">;

def __builtin_mips_wrdsp: Builtin<"viIi", "n">;
def __builtin_mips_rddsp: Builtin<"iIi", "n">;
def __builtin_mips_insv: Builtin<"iii", "n">;
def __builtin_mips_bitrev: Builtin<"ii", "nc">;
def __builtin_mips_packrl_ph: Builtin<"V2sV2sV2s", "nc">;
def __builtin_mips_repl_qb: Builtin<"V4Sci", "nc">;
def __builtin_mips_repl_ph: Builtin<"V2si", "nc">;
def __builtin_mips_pick_qb: Builtin<"V4ScV4ScV4Sc", "n">;
def __builtin_mips_pick_ph: Builtin<"V2sV2sV2s", "n">;
def __builtin_mips_mthlip: Builtin<"LLiLLii", "n">;
def __builtin_mips_bposge32: Builtin<"i", "n">;
def __builtin_mips_lbux: Builtin<"iv*i", "n">;
def __builtin_mips_lhx: Builtin<"iv*i", "n">;
def __builtin_mips_lwx: Builtin<"iv*i", "n">;

// MIPS DSP Rev 2

def __builtin_mips_absq_s_qb: Builtin<"V4ScV4Sc", "n">;

def __builtin_mips_addqh_ph: Builtin<"V2sV2sV2s", "nc">;
def __builtin_mips_addqh_r_ph: Builtin<"V2sV2sV2s", "nc">;
def __builtin_mips_addqh_w: Builtin<"iii", "nc">;
def __builtin_mips_addqh_r_w: Builtin<"iii", "nc">;

def __builtin_mips_addu_ph: Builtin<"V2sV2sV2s", "n">;
def __builtin_mips_addu_s_ph: Builtin<"V2sV2sV2s", "n">;

def __builtin_mips_adduh_qb: Builtin<"V4ScV4ScV4Sc", "nc">;
def __builtin_mips_adduh_r_qb: Builtin<"V4ScV4ScV4Sc", "nc">;

def __builtin_mips_append: Builtin<"iiiIi", "nc">;
def __builtin_mips_balign: Builtin<"iiiIi", "nc">;

def __builtin_mips_cmpgdu_eq_qb: Builtin<"iV4ScV4Sc", "n">;
def __builtin_mips_cmpgdu_lt_qb: Builtin<"iV4ScV4Sc", "n">;
def __builtin_mips_cmpgdu_le_qb: Builtin<"iV4ScV4Sc", "n">;

def __builtin_mips_dpa_w_ph: Builtin<"LLiLLiV2sV2s", "nc">;
def __builtin_mips_dps_w_ph: Builtin<"LLiLLiV2sV2s", "nc">;

def __builtin_mips_dpaqx_s_w_ph: Builtin<"LLiLLiV2sV2s", "n">;
def __builtin_mips_dpaqx_sa_w_ph: Builtin<"LLiLLiV2sV2s", "n">;
def __builtin_mips_dpax_w_ph: Builtin<"LLiLLiV2sV2s", "nc">;
def __builtin_mips_dpsx_w_ph: Builtin<"LLiLLiV2sV2s", "nc">;
def __builtin_mips_dpsqx_s_w_ph: Builtin<"LLiLLiV2sV2s", "n">;
def __builtin_mips_dpsqx_sa_w_ph: Builtin<"LLiLLiV2sV2s", "n">;

def __builtin_mips_mul_ph: Builtin<"V2sV2sV2s", "n">;
def __builtin_mips_mul_s_ph: Builtin<"V2sV2sV2s", "n">;

def __builtin_mips_mulq_rs_w: Builtin<"iii", "n">;
def __builtin_mips_mulq_s_ph: Builtin<"V2sV2sV2s", "n">;
def __builtin_mips_mulq_s_w: Builtin<"iii", "n">;
def __builtin_mips_mulsa_w_ph: Builtin<"LLiLLiV2sV2s", "nc">;

def __builtin_mips_precr_qb_ph: Builtin<"V4ScV2sV2s", "n">;
def __builtin_mips_precr_sra_ph_w: Builtin<"V2siiIi", "nc">;
def __builtin_mips_precr_sra_r_ph_w: Builtin<"V2siiIi", "nc">;

def __builtin_mips_prepend: Builtin<"iiiIi", "nc">;

def __builtin_mips_shra_qb: Builtin<"V4ScV4Sci", "nc">;
def __builtin_mips_shra_r_qb: Builtin<"V4ScV4Sci", "nc">;
def __builtin_mips_shrl_ph: Builtin<"V2sV2si", "nc">;

def __builtin_mips_subqh_ph: Builtin<"V2sV2sV2s", "nc">;
def __builtin_mips_subqh_r_ph: Builtin<"V2sV2sV2s", "nc">;
def __builtin_mips_subqh_w: Builtin<"iii", "nc">;
def __builtin_mips_subqh_r_w: Builtin<"iii", "nc">;

def __builtin_mips_subu_ph: Builtin<"V2sV2sV2s", "n">;
def __builtin_mips_subu_s_ph: Builtin<"V2sV2sV2s", "n">;

def __builtin_mips_subuh_qb: Builtin<"V4ScV4ScV4Sc", "nc">;
def __builtin_mips_subuh_r_qb: Builtin<"V4ScV4ScV4Sc", "nc">;

// MIPS MSA

def __builtin_msa_add_a_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_add_a_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_add_a_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_add_a_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_adds_a_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_adds_a_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_adds_a_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_adds_a_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_adds_s_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_adds_s_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_adds_s_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_adds_s_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_adds_u_b: Builtin<"V16UcV16UcV16Uc", "nc">;
def __builtin_msa_adds_u_h: Builtin<"V8UsV8UsV8Us", "nc">;
def __builtin_msa_adds_u_w: Builtin<"V4UiV4UiV4Ui", "nc">;
def __builtin_msa_adds_u_d: Builtin<"V2ULLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_addv_b: Builtin<"V16cV16cV16c", "nc">;
def __builtin_msa_addv_h: Builtin<"V8sV8sV8s", "nc">;
def __builtin_msa_addv_w: Builtin<"V4iV4iV4i", "nc">;
def __builtin_msa_addv_d: Builtin<"V2LLiV2LLiV2LLi", "nc">;

def __builtin_msa_addvi_b: Builtin<"V16cV16cIUi", "nc">;
def __builtin_msa_addvi_h: Builtin<"V8sV8sIUi", "nc">;
def __builtin_msa_addvi_w: Builtin<"V4iV4iIUi", "nc">;
def __builtin_msa_addvi_d: Builtin<"V2LLiV2LLiIUi", "nc">;

def __builtin_msa_and_v: Builtin<"V16UcV16UcV16Uc", "nc">;

def __builtin_msa_andi_b: Builtin<"V16UcV16UcIUi", "nc">;

def __builtin_msa_asub_s_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_asub_s_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_asub_s_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_asub_s_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_asub_u_b: Builtin<"V16UcV16UcV16Uc", "nc">;
def __builtin_msa_asub_u_h: Builtin<"V8UsV8UsV8Us", "nc">;
def __builtin_msa_asub_u_w: Builtin<"V4UiV4UiV4Ui", "nc">;
def __builtin_msa_asub_u_d: Builtin<"V2ULLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_ave_s_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_ave_s_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_ave_s_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_ave_s_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_ave_u_b: Builtin<"V16UcV16UcV16Uc", "nc">;
def __builtin_msa_ave_u_h: Builtin<"V8UsV8UsV8Us", "nc">;
def __builtin_msa_ave_u_w: Builtin<"V4UiV4UiV4Ui", "nc">;
def __builtin_msa_ave_u_d: Builtin<"V2ULLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_aver_s_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_aver_s_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_aver_s_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_aver_s_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_aver_u_b: Builtin<"V16UcV16UcV16Uc", "nc">;
def __builtin_msa_aver_u_h: Builtin<"V8UsV8UsV8Us", "nc">;
def __builtin_msa_aver_u_w: Builtin<"V4UiV4UiV4Ui", "nc">;
def __builtin_msa_aver_u_d: Builtin<"V2ULLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_bclr_b: Builtin<"V16UcV16UcV16Uc", "nc">;
def __builtin_msa_bclr_h: Builtin<"V8UsV8UsV8Us", "nc">;
def __builtin_msa_bclr_w: Builtin<"V4UiV4UiV4Ui", "nc">;
def __builtin_msa_bclr_d: Builtin<"V2ULLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_bclri_b: Builtin<"V16UcV16UcIUi", "nc">;
def __builtin_msa_bclri_h: Builtin<"V8UsV8UsIUi", "nc">;
def __builtin_msa_bclri_w: Builtin<"V4UiV4UiIUi", "nc">;
def __builtin_msa_bclri_d: Builtin<"V2ULLiV2ULLiIUi", "nc">;

def __builtin_msa_binsl_b: Builtin<"V16UcV16UcV16UcV16Uc", "nc">;
def __builtin_msa_binsl_h: Builtin<"V8UsV8UsV8UsV8Us", "nc">;
def __builtin_msa_binsl_w: Builtin<"V4UiV4UiV4UiV4Ui", "nc">;
def __builtin_msa_binsl_d: Builtin<"V2ULLiV2ULLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_binsli_b: Builtin<"V16UcV16UcV16UcIUi", "nc">;
def __builtin_msa_binsli_h: Builtin<"V8UsV8UsV8UsIUi", "nc">;
def __builtin_msa_binsli_w: Builtin<"V4UiV4UiV4UiIUi", "nc">;
def __builtin_msa_binsli_d: Builtin<"V2ULLiV2ULLiV2ULLiIUi", "nc">;

def __builtin_msa_binsr_b: Builtin<"V16UcV16UcV16UcV16Uc", "nc">;
def __builtin_msa_binsr_h: Builtin<"V8UsV8UsV8UsV8Us", "nc">;
def __builtin_msa_binsr_w: Builtin<"V4UiV4UiV4UiV4Ui", "nc">;
def __builtin_msa_binsr_d: Builtin<"V2ULLiV2ULLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_binsri_b: Builtin<"V16UcV16UcV16UcIUi", "nc">;
def __builtin_msa_binsri_h: Builtin<"V8UsV8UsV8UsIUi", "nc">;
def __builtin_msa_binsri_w: Builtin<"V4UiV4UiV4UiIUi", "nc">;
def __builtin_msa_binsri_d: Builtin<"V2ULLiV2ULLiV2ULLiIUi", "nc">;

def __builtin_msa_bmnz_v: Builtin<"V16UcV16UcV16UcV16Uc", "nc">;

def __builtin_msa_bmnzi_b: Builtin<"V16UcV16UcV16UcIUi", "nc">;

def __builtin_msa_bmz_v: Builtin<"V16UcV16UcV16UcV16Uc", "nc">;

def __builtin_msa_bmzi_b: Builtin<"V16UcV16UcV16UcIUi", "nc">;

def __builtin_msa_bneg_b: Builtin<"V16UcV16UcV16Uc", "nc">;
def __builtin_msa_bneg_h: Builtin<"V8UsV8UsV8Us", "nc">;
def __builtin_msa_bneg_w: Builtin<"V4UiV4UiV4Ui", "nc">;
def __builtin_msa_bneg_d: Builtin<"V2ULLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_bnegi_b: Builtin<"V16UcV16UcIUi", "nc">;
def __builtin_msa_bnegi_h: Builtin<"V8UsV8UsIUi", "nc">;
def __builtin_msa_bnegi_w: Builtin<"V4UiV4UiIUi", "nc">;
def __builtin_msa_bnegi_d: Builtin<"V2ULLiV2ULLiIUi", "nc">;

def __builtin_msa_bnz_b: Builtin<"iV16Uc", "nc">;
def __builtin_msa_bnz_h: Builtin<"iV8Us", "nc">;
def __builtin_msa_bnz_w: Builtin<"iV4Ui", "nc">;
def __builtin_msa_bnz_d: Builtin<"iV2ULLi", "nc">;

def __builtin_msa_bnz_v: Builtin<"iV16Uc", "nc">;

def __builtin_msa_bsel_v: Builtin<"V16UcV16UcV16UcV16Uc", "nc">;

def __builtin_msa_bseli_b: Builtin<"V16UcV16UcV16UcIUi", "nc">;

def __builtin_msa_bset_b: Builtin<"V16UcV16UcV16Uc", "nc">;
def __builtin_msa_bset_h: Builtin<"V8UsV8UsV8Us", "nc">;
def __builtin_msa_bset_w: Builtin<"V4UiV4UiV4Ui", "nc">;
def __builtin_msa_bset_d: Builtin<"V2ULLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_bseti_b: Builtin<"V16UcV16UcIUi", "nc">;
def __builtin_msa_bseti_h: Builtin<"V8UsV8UsIUi", "nc">;
def __builtin_msa_bseti_w: Builtin<"V4UiV4UiIUi", "nc">;
def __builtin_msa_bseti_d: Builtin<"V2ULLiV2ULLiIUi", "nc">;

def __builtin_msa_bz_b: Builtin<"iV16Uc", "nc">;
def __builtin_msa_bz_h: Builtin<"iV8Us", "nc">;
def __builtin_msa_bz_w: Builtin<"iV4Ui", "nc">;
def __builtin_msa_bz_d: Builtin<"iV2ULLi", "nc">;

def __builtin_msa_bz_v: Builtin<"iV16Uc", "nc">;

def __builtin_msa_ceq_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_ceq_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_ceq_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_ceq_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_ceqi_b: Builtin<"V16ScV16ScISi", "nc">;
def __builtin_msa_ceqi_h: Builtin<"V8SsV8SsISi", "nc">;
def __builtin_msa_ceqi_w: Builtin<"V4SiV4SiISi", "nc">;
def __builtin_msa_ceqi_d: Builtin<"V2SLLiV2SLLiISi", "nc">;

def __builtin_msa_cfcmsa: Builtin<"iIi", "n">;

def __builtin_msa_cle_s_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_cle_s_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_cle_s_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_cle_s_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_cle_u_b: Builtin<"V16ScV16UcV16Uc", "nc">;
def __builtin_msa_cle_u_h: Builtin<"V8SsV8UsV8Us", "nc">;
def __builtin_msa_cle_u_w: Builtin<"V4SiV4UiV4Ui", "nc">;
def __builtin_msa_cle_u_d: Builtin<"V2SLLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_clei_s_b: Builtin<"V16ScV16ScISi", "nc">;
def __builtin_msa_clei_s_h: Builtin<"V8SsV8SsISi", "nc">;
def __builtin_msa_clei_s_w: Builtin<"V4SiV4SiISi", "nc">;
def __builtin_msa_clei_s_d: Builtin<"V2SLLiV2SLLiISi", "nc">;

def __builtin_msa_clei_u_b: Builtin<"V16ScV16UcIUi", "nc">;
def __builtin_msa_clei_u_h: Builtin<"V8SsV8UsIUi", "nc">;
def __builtin_msa_clei_u_w: Builtin<"V4SiV4UiIUi", "nc">;
def __builtin_msa_clei_u_d: Builtin<"V2SLLiV2ULLiIUi", "nc">;

def __builtin_msa_clt_s_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_clt_s_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_clt_s_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_clt_s_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_clt_u_b: Builtin<"V16ScV16UcV16Uc", "nc">;
def __builtin_msa_clt_u_h: Builtin<"V8SsV8UsV8Us", "nc">;
def __builtin_msa_clt_u_w: Builtin<"V4SiV4UiV4Ui", "nc">;
def __builtin_msa_clt_u_d: Builtin<"V2SLLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_clti_s_b: Builtin<"V16ScV16ScISi", "nc">;
def __builtin_msa_clti_s_h: Builtin<"V8SsV8SsISi", "nc">;
def __builtin_msa_clti_s_w: Builtin<"V4SiV4SiISi", "nc">;
def __builtin_msa_clti_s_d: Builtin<"V2SLLiV2SLLiISi", "nc">;

def __builtin_msa_clti_u_b: Builtin<"V16ScV16UcIUi", "nc">;
def __builtin_msa_clti_u_h: Builtin<"V8SsV8UsIUi", "nc">;
def __builtin_msa_clti_u_w: Builtin<"V4SiV4UiIUi", "nc">;
def __builtin_msa_clti_u_d: Builtin<"V2SLLiV2ULLiIUi", "nc">;

def __builtin_msa_copy_s_b: Builtin<"iV16ScIUi", "nc">;
def __builtin_msa_copy_s_h: Builtin<"iV8SsIUi", "nc">;
def __builtin_msa_copy_s_w: Builtin<"iV4SiIUi", "nc">;
def __builtin_msa_copy_s_d: Builtin<"LLiV2SLLiIUi", "nc">;

def __builtin_msa_copy_u_b: Builtin<"iV16UcIUi", "nc">;
def __builtin_msa_copy_u_h: Builtin<"iV8UsIUi", "nc">;
def __builtin_msa_copy_u_w: Builtin<"iV4UiIUi", "nc">;
def __builtin_msa_copy_u_d: Builtin<"LLiV2ULLiIUi", "nc">;

def __builtin_msa_ctcmsa: Builtin<"vIii", "n">;

def __builtin_msa_div_s_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_div_s_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_div_s_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_div_s_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_div_u_b: Builtin<"V16UcV16UcV16Uc", "nc">;
def __builtin_msa_div_u_h: Builtin<"V8UsV8UsV8Us", "nc">;
def __builtin_msa_div_u_w: Builtin<"V4UiV4UiV4Ui", "nc">;
def __builtin_msa_div_u_d: Builtin<"V2ULLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_dotp_s_h: Builtin<"V8SsV16ScV16Sc", "nc">;
def __builtin_msa_dotp_s_w: Builtin<"V4SiV8SsV8Ss", "nc">;
def __builtin_msa_dotp_s_d: Builtin<"V2SLLiV4SiV4Si", "nc">;

def __builtin_msa_dotp_u_h: Builtin<"V8UsV16UcV16Uc", "nc">;
def __builtin_msa_dotp_u_w: Builtin<"V4UiV8UsV8Us", "nc">;
def __builtin_msa_dotp_u_d: Builtin<"V2ULLiV4UiV4Ui", "nc">;

def __builtin_msa_dpadd_s_h: Builtin<"V8SsV8SsV16ScV16Sc", "nc">;
def __builtin_msa_dpadd_s_w: Builtin<"V4SiV4SiV8SsV8Ss", "nc">;
def __builtin_msa_dpadd_s_d: Builtin<"V2SLLiV2SLLiV4SiV4Si", "nc">;

def __builtin_msa_dpadd_u_h: Builtin<"V8UsV8UsV16UcV16Uc", "nc">;
def __builtin_msa_dpadd_u_w: Builtin<"V4UiV4UiV8UsV8Us", "nc">;
def __builtin_msa_dpadd_u_d: Builtin<"V2ULLiV2ULLiV4UiV4Ui", "nc">;

def __builtin_msa_dpsub_s_h: Builtin<"V8SsV8SsV16ScV16Sc", "nc">;
def __builtin_msa_dpsub_s_w: Builtin<"V4SiV4SiV8SsV8Ss", "nc">;
def __builtin_msa_dpsub_s_d: Builtin<"V2SLLiV2SLLiV4SiV4Si", "nc">;

def __builtin_msa_dpsub_u_h: Builtin<"V8UsV8UsV16UcV16Uc", "nc">;
def __builtin_msa_dpsub_u_w: Builtin<"V4UiV4UiV8UsV8Us", "nc">;
def __builtin_msa_dpsub_u_d: Builtin<"V2ULLiV2ULLiV4UiV4Ui", "nc">;

def __builtin_msa_fadd_w: Builtin<"V4fV4fV4f", "nc">;
def __builtin_msa_fadd_d: Builtin<"V2dV2dV2d", "nc">;

def __builtin_msa_fcaf_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fcaf_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fceq_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fceq_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fclass_w: Builtin<"V4iV4f", "nc">;
def __builtin_msa_fclass_d: Builtin<"V2LLiV2d", "nc">;

def __builtin_msa_fcle_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fcle_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fclt_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fclt_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fcne_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fcne_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fcor_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fcor_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fcueq_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fcueq_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fcule_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fcule_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fcult_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fcult_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fcun_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fcun_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fcune_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fcune_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fdiv_w: Builtin<"V4fV4fV4f", "nc">;
def __builtin_msa_fdiv_d: Builtin<"V2dV2dV2d", "nc">;

def __builtin_msa_fexdo_h: Builtin<"V8hV4fV4f", "nc">;
def __builtin_msa_fexdo_w: Builtin<"V4fV2dV2d", "nc">;

def __builtin_msa_fexp2_w: Builtin<"V4fV4fV4i", "nc">;
def __builtin_msa_fexp2_d: Builtin<"V2dV2dV2LLi", "nc">;

def __builtin_msa_fexupl_w: Builtin<"V4fV8h", "nc">;
def __builtin_msa_fexupl_d: Builtin<"V2dV4f", "nc">;

def __builtin_msa_fexupr_w: Builtin<"V4fV8h", "nc">;
def __builtin_msa_fexupr_d: Builtin<"V2dV4f", "nc">;

def __builtin_msa_ffint_s_w: Builtin<"V4fV4Si", "nc">;
def __builtin_msa_ffint_s_d: Builtin<"V2dV2SLLi", "nc">;

def __builtin_msa_ffint_u_w: Builtin<"V4fV4Ui", "nc">;
def __builtin_msa_ffint_u_d: Builtin<"V2dV2ULLi", "nc">;

// ffql uses integers since long _Fract is not implemented
def __builtin_msa_ffql_w: Builtin<"V4fV8Ss", "nc">;
def __builtin_msa_ffql_d: Builtin<"V2dV4Si", "nc">;

// ffqr uses integers since long _Fract is not implemented
def __builtin_msa_ffqr_w: Builtin<"V4fV8Ss", "nc">;
def __builtin_msa_ffqr_d: Builtin<"V2dV4Si", "nc">;

def __builtin_msa_fill_b: Builtin<"V16Sci", "nc">;
def __builtin_msa_fill_h: Builtin<"V8Ssi", "nc">;
def __builtin_msa_fill_w: Builtin<"V4Sii", "nc">;
def __builtin_msa_fill_d: Builtin<"V2SLLiLLi", "nc">;

def __builtin_msa_flog2_w: Builtin<"V4fV4f", "nc">;
def __builtin_msa_flog2_d: Builtin<"V2dV2d", "nc">;

def __builtin_msa_fmadd_w: Builtin<"V4fV4fV4fV4f", "nc">;
def __builtin_msa_fmadd_d: Builtin<"V2dV2dV2dV2d", "nc">;

def __builtin_msa_fmax_w: Builtin<"V4fV4fV4f", "nc">;
def __builtin_msa_fmax_d: Builtin<"V2dV2dV2d", "nc">;

def __builtin_msa_fmax_a_w: Builtin<"V4fV4fV4f", "nc">;
def __builtin_msa_fmax_a_d: Builtin<"V2dV2dV2d", "nc">;

def __builtin_msa_fmin_w: Builtin<"V4fV4fV4f", "nc">;
def __builtin_msa_fmin_d: Builtin<"V2dV2dV2d", "nc">;

def __builtin_msa_fmin_a_w: Builtin<"V4fV4fV4f", "nc">;
def __builtin_msa_fmin_a_d: Builtin<"V2dV2dV2d", "nc">;

def __builtin_msa_fmsub_w: Builtin<"V4fV4fV4fV4f", "nc">;
def __builtin_msa_fmsub_d: Builtin<"V2dV2dV2dV2d", "nc">;

def __builtin_msa_fmul_w: Builtin<"V4fV4fV4f", "nc">;
def __builtin_msa_fmul_d: Builtin<"V2dV2dV2d", "nc">;

def __builtin_msa_frint_w: Builtin<"V4fV4f", "nc">;
def __builtin_msa_frint_d: Builtin<"V2dV2d", "nc">;

def __builtin_msa_frcp_w: Builtin<"V4fV4f", "nc">;
def __builtin_msa_frcp_d: Builtin<"V2dV2d", "nc">;

def __builtin_msa_frsqrt_w: Builtin<"V4fV4f", "nc">;
def __builtin_msa_frsqrt_d: Builtin<"V2dV2d", "nc">;

def __builtin_msa_fsaf_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fsaf_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fseq_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fseq_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fsle_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fsle_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fslt_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fslt_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fsne_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fsne_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fsor_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fsor_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fsqrt_w: Builtin<"V4fV4f", "nc">;
def __builtin_msa_fsqrt_d: Builtin<"V2dV2d", "nc">;

def __builtin_msa_fsub_w: Builtin<"V4fV4fV4f", "nc">;
def __builtin_msa_fsub_d: Builtin<"V2dV2dV2d", "nc">;

def __builtin_msa_fsueq_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fsueq_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fsule_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fsule_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fsult_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fsult_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fsun_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fsun_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_fsune_w: Builtin<"V4iV4fV4f", "nc">;
def __builtin_msa_fsune_d: Builtin<"V2LLiV2dV2d", "nc">;

def __builtin_msa_ftint_s_w: Builtin<"V4SiV4f", "nc">;
def __builtin_msa_ftint_s_d: Builtin<"V2SLLiV2d", "nc">;

def __builtin_msa_ftint_u_w: Builtin<"V4UiV4f", "nc">;
def __builtin_msa_ftint_u_d: Builtin<"V2ULLiV2d", "nc">;

def __builtin_msa_ftq_h: Builtin<"V4UiV4fV4f", "nc">;
def __builtin_msa_ftq_w: Builtin<"V2ULLiV2dV2d", "nc">;

def __builtin_msa_ftrunc_s_w: Builtin<"V4SiV4f", "nc">;
def __builtin_msa_ftrunc_s_d: Builtin<"V2SLLiV2d", "nc">;

def __builtin_msa_ftrunc_u_w: Builtin<"V4UiV4f", "nc">;
def __builtin_msa_ftrunc_u_d: Builtin<"V2ULLiV2d", "nc">;

def __builtin_msa_hadd_s_h: Builtin<"V8SsV16ScV16Sc", "nc">;
def __builtin_msa_hadd_s_w: Builtin<"V4SiV8SsV8Ss", "nc">;
def __builtin_msa_hadd_s_d: Builtin<"V2SLLiV4SiV4Si", "nc">;

def __builtin_msa_hadd_u_h: Builtin<"V8UsV16UcV16Uc", "nc">;
def __builtin_msa_hadd_u_w: Builtin<"V4UiV8UsV8Us", "nc">;
def __builtin_msa_hadd_u_d: Builtin<"V2ULLiV4UiV4Ui", "nc">;

def __builtin_msa_hsub_s_h: Builtin<"V8SsV16ScV16Sc", "nc">;
def __builtin_msa_hsub_s_w: Builtin<"V4SiV8SsV8Ss", "nc">;
def __builtin_msa_hsub_s_d: Builtin<"V2SLLiV4SiV4Si", "nc">;

def __builtin_msa_hsub_u_h: Builtin<"V8UsV16UcV16Uc", "nc">;
def __builtin_msa_hsub_u_w: Builtin<"V4UiV8UsV8Us", "nc">;
def __builtin_msa_hsub_u_d: Builtin<"V2ULLiV4UiV4Ui", "nc">;

def __builtin_msa_ilvev_b: Builtin<"V16cV16cV16c", "nc">;
def __builtin_msa_ilvev_h: Builtin<"V8sV8sV8s", "nc">;
def __builtin_msa_ilvev_w: Builtin<"V4iV4iV4i", "nc">;
def __builtin_msa_ilvev_d: Builtin<"V2LLiV2LLiV2LLi", "nc">;

def __builtin_msa_ilvl_b: Builtin<"V16cV16cV16c", "nc">;
def __builtin_msa_ilvl_h: Builtin<"V8sV8sV8s", "nc">;
def __builtin_msa_ilvl_w: Builtin<"V4iV4iV4i", "nc">;
def __builtin_msa_ilvl_d: Builtin<"V2LLiV2LLiV2LLi", "nc">;

def __builtin_msa_ilvod_b: Builtin<"V16cV16cV16c", "nc">;
def __builtin_msa_ilvod_h: Builtin<"V8sV8sV8s", "nc">;
def __builtin_msa_ilvod_w: Builtin<"V4iV4iV4i", "nc">;
def __builtin_msa_ilvod_d: Builtin<"V2LLiV2LLiV2LLi", "nc">;

def __builtin_msa_ilvr_b: Builtin<"V16cV16cV16c", "nc">;
def __builtin_msa_ilvr_h: Builtin<"V8sV8sV8s", "nc">;
def __builtin_msa_ilvr_w: Builtin<"V4iV4iV4i", "nc">;
def __builtin_msa_ilvr_d: Builtin<"V2LLiV2LLiV2LLi", "nc">;

def __builtin_msa_insert_b: Builtin<"V16ScV16ScIUii", "nc">;
def __builtin_msa_insert_h: Builtin<"V8SsV8SsIUii", "nc">;
def __builtin_msa_insert_w: Builtin<"V4SiV4SiIUii", "nc">;
def __builtin_msa_insert_d: Builtin<"V2SLLiV2SLLiIUiLLi", "nc">;

def __builtin_msa_insve_b: Builtin<"V16ScV16ScIUiV16Sc", "nc">;
def __builtin_msa_insve_h: Builtin<"V8SsV8SsIUiV8Ss", "nc">;
def __builtin_msa_insve_w: Builtin<"V4SiV4SiIUiV4Si", "nc">;
def __builtin_msa_insve_d: Builtin<"V2SLLiV2SLLiIUiV2SLLi", "nc">;

def __builtin_msa_ld_b: Builtin<"V16Scv*Ii", "nc">;
def __builtin_msa_ld_h: Builtin<"V8Ssv*Ii", "nc">;
def __builtin_msa_ld_w: Builtin<"V4Siv*Ii", "nc">;
def __builtin_msa_ld_d: Builtin<"V2SLLiv*Ii", "nc">;

def __builtin_msa_ldr_d: Builtin<"V2SLLiv*Ii", "nc">;
def __builtin_msa_ldr_w: Builtin<"V4Siv*Ii", "nc">;

def __builtin_msa_ldi_b: Builtin<"V16cIi", "nc">;
def __builtin_msa_ldi_h: Builtin<"V8sIi", "nc">;
def __builtin_msa_ldi_w: Builtin<"V4iIi", "nc">;
def __builtin_msa_ldi_d: Builtin<"V2LLiIi", "nc">;

def __builtin_msa_madd_q_h: Builtin<"V8SsV8SsV8SsV8Ss", "nc">;
def __builtin_msa_madd_q_w: Builtin<"V4SiV4SiV4SiV4Si", "nc">;

def __builtin_msa_maddr_q_h: Builtin<"V8SsV8SsV8SsV8Ss", "nc">;
def __builtin_msa_maddr_q_w: Builtin<"V4SiV4SiV4SiV4Si", "nc">;

def __builtin_msa_maddv_b: Builtin<"V16ScV16ScV16ScV16Sc", "nc">;
def __builtin_msa_maddv_h: Builtin<"V8SsV8SsV8SsV8Ss", "nc">;
def __builtin_msa_maddv_w: Builtin<"V4SiV4SiV4SiV4Si", "nc">;
def __builtin_msa_maddv_d: Builtin<"V2SLLiV2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_max_a_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_max_a_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_max_a_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_max_a_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_max_s_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_max_s_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_max_s_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_max_s_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_max_u_b: Builtin<"V16UcV16UcV16Uc", "nc">;
def __builtin_msa_max_u_h: Builtin<"V8UsV8UsV8Us", "nc">;
def __builtin_msa_max_u_w: Builtin<"V4UiV4UiV4Ui", "nc">;
def __builtin_msa_max_u_d: Builtin<"V2ULLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_maxi_s_b: Builtin<"V16ScV16ScIi", "nc">;
def __builtin_msa_maxi_s_h: Builtin<"V8SsV8SsIi", "nc">;
def __builtin_msa_maxi_s_w: Builtin<"V4SiV4SiIi", "nc">;
def __builtin_msa_maxi_s_d: Builtin<"V2SLLiV2SLLiIi", "nc">;

def __builtin_msa_maxi_u_b: Builtin<"V16UcV16UcIi", "nc">;
def __builtin_msa_maxi_u_h: Builtin<"V8UsV8UsIi", "nc">;
def __builtin_msa_maxi_u_w: Builtin<"V4UiV4UiIi", "nc">;
def __builtin_msa_maxi_u_d: Builtin<"V2ULLiV2ULLiIi", "nc">;

def __builtin_msa_min_a_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_min_a_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_min_a_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_min_a_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_min_s_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_min_s_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_min_s_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_min_s_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_min_u_b: Builtin<"V16UcV16UcV16Uc", "nc">;
def __builtin_msa_min_u_h: Builtin<"V8UsV8UsV8Us", "nc">;
def __builtin_msa_min_u_w: Builtin<"V4UiV4UiV4Ui", "nc">;
def __builtin_msa_min_u_d: Builtin<"V2ULLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_mini_s_b: Builtin<"V16ScV16ScIi", "nc">;
def __builtin_msa_mini_s_h: Builtin<"V8SsV8SsIi", "nc">;
def __builtin_msa_mini_s_w: Builtin<"V4SiV4SiIi", "nc">;
def __builtin_msa_mini_s_d: Builtin<"V2SLLiV2SLLiIi", "nc">;

def __builtin_msa_mini_u_b: Builtin<"V16UcV16UcIi", "nc">;
def __builtin_msa_mini_u_h: Builtin<"V8UsV8UsIi", "nc">;
def __builtin_msa_mini_u_w: Builtin<"V4UiV4UiIi", "nc">;
def __builtin_msa_mini_u_d: Builtin<"V2ULLiV2ULLiIi", "nc">;

def __builtin_msa_mod_s_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_mod_s_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_mod_s_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_mod_s_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_mod_u_b: Builtin<"V16UcV16UcV16Uc", "nc">;
def __builtin_msa_mod_u_h: Builtin<"V8UsV8UsV8Us", "nc">;
def __builtin_msa_mod_u_w: Builtin<"V4UiV4UiV4Ui", "nc">;
def __builtin_msa_mod_u_d: Builtin<"V2ULLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_move_v: Builtin<"V16ScV16Sc", "nc">;

def __builtin_msa_msub_q_h: Builtin<"V8SsV8SsV8SsV8Ss", "nc">;
def __builtin_msa_msub_q_w: Builtin<"V4SiV4SiV4SiV4Si", "nc">;

def __builtin_msa_msubr_q_h: Builtin<"V8SsV8SsV8SsV8Ss", "nc">;
def __builtin_msa_msubr_q_w: Builtin<"V4SiV4SiV4SiV4Si", "nc">;

def __builtin_msa_msubv_b: Builtin<"V16ScV16ScV16ScV16Sc", "nc">;
def __builtin_msa_msubv_h: Builtin<"V8SsV8SsV8SsV8Ss", "nc">;
def __builtin_msa_msubv_w: Builtin<"V4SiV4SiV4SiV4Si", "nc">;
def __builtin_msa_msubv_d: Builtin<"V2SLLiV2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_mul_q_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_mul_q_w: Builtin<"V4SiV4SiV4Si", "nc">;

def __builtin_msa_mulr_q_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_mulr_q_w: Builtin<"V4SiV4SiV4Si", "nc">;

def __builtin_msa_mulv_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_mulv_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_mulv_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_mulv_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_nloc_b: Builtin<"V16ScV16Sc", "nc">;
def __builtin_msa_nloc_h: Builtin<"V8SsV8Ss", "nc">;
def __builtin_msa_nloc_w: Builtin<"V4SiV4Si", "nc">;
def __builtin_msa_nloc_d: Builtin<"V2SLLiV2SLLi", "nc">;

def __builtin_msa_nlzc_b: Builtin<"V16ScV16Sc", "nc">;
def __builtin_msa_nlzc_h: Builtin<"V8SsV8Ss", "nc">;
def __builtin_msa_nlzc_w: Builtin<"V4SiV4Si", "nc">;
def __builtin_msa_nlzc_d: Builtin<"V2SLLiV2SLLi", "nc">;

def __builtin_msa_nor_v: Builtin<"V16UcV16UcV16Uc", "nc">;

def __builtin_msa_nori_b: Builtin<"V16UcV16cIUi", "nc">;

def __builtin_msa_or_v: Builtin<"V16UcV16UcV16Uc", "nc">;

def __builtin_msa_ori_b: Builtin<"V16UcV16UcIUi", "nc">;

def __builtin_msa_pckev_b: Builtin<"V16cV16cV16c", "nc">;
def __builtin_msa_pckev_h: Builtin<"V8sV8sV8s", "nc">;
def __builtin_msa_pckev_w: Builtin<"V4iV4iV4i", "nc">;
def __builtin_msa_pckev_d: Builtin<"V2LLiV2LLiV2LLi", "nc">;

def __builtin_msa_pckod_b: Builtin<"V16cV16cV16c", "nc">;
def __builtin_msa_pckod_h: Builtin<"V8sV8sV8s", "nc">;
def __builtin_msa_pckod_w: Builtin<"V4iV4iV4i", "nc">;
def __builtin_msa_pckod_d: Builtin<"V2LLiV2LLiV2LLi", "nc">;

def __builtin_msa_pcnt_b: Builtin<"V16ScV16Sc", "nc">;
def __builtin_msa_pcnt_h: Builtin<"V8SsV8Ss", "nc">;
def __builtin_msa_pcnt_w: Builtin<"V4SiV4Si", "nc">;
def __builtin_msa_pcnt_d: Builtin<"V2SLLiV2SLLi", "nc">;

def __builtin_msa_sat_s_b: Builtin<"V16ScV16ScIUi", "nc">;
def __builtin_msa_sat_s_h: Builtin<"V8SsV8SsIUi", "nc">;
def __builtin_msa_sat_s_w: Builtin<"V4SiV4SiIUi", "nc">;
def __builtin_msa_sat_s_d: Builtin<"V2SLLiV2SLLiIUi", "nc">;

def __builtin_msa_sat_u_b: Builtin<"V16UcV16UcIUi", "nc">;
def __builtin_msa_sat_u_h: Builtin<"V8UsV8UsIUi", "nc">;
def __builtin_msa_sat_u_w: Builtin<"V4UiV4UiIUi", "nc">;
def __builtin_msa_sat_u_d: Builtin<"V2ULLiV2ULLiIUi", "nc">;

def __builtin_msa_shf_b: Builtin<"V16cV16cIUi", "nc">;
def __builtin_msa_shf_h: Builtin<"V8sV8sIUi", "nc">;
def __builtin_msa_shf_w: Builtin<"V4iV4iIUi", "nc">;

def __builtin_msa_sld_b: Builtin<"V16cV16cV16cUi", "nc">;
def __builtin_msa_sld_h: Builtin<"V8sV8sV8sUi", "nc">;
def __builtin_msa_sld_w: Builtin<"V4iV4iV4iUi", "nc">;
def __builtin_msa_sld_d: Builtin<"V2LLiV2LLiV2LLiUi", "nc">;

def __builtin_msa_sldi_b: Builtin<"V16cV16cV16cIUi", "nc">;
def __builtin_msa_sldi_h: Builtin<"V8sV8sV8sIUi", "nc">;
def __builtin_msa_sldi_w: Builtin<"V4iV4iV4iIUi", "nc">;
def __builtin_msa_sldi_d: Builtin<"V2LLiV2LLiV2LLiIUi", "nc">;

def __builtin_msa_sll_b: Builtin<"V16cV16cV16c", "nc">;
def __builtin_msa_sll_h: Builtin<"V8sV8sV8s", "nc">;
def __builtin_msa_sll_w: Builtin<"V4iV4iV4i", "nc">;
def __builtin_msa_sll_d: Builtin<"V2LLiV2LLiV2LLi", "nc">;

def __builtin_msa_slli_b: Builtin<"V16cV16cIUi", "nc">;
def __builtin_msa_slli_h: Builtin<"V8sV8sIUi", "nc">;
def __builtin_msa_slli_w: Builtin<"V4iV4iIUi", "nc">;
def __builtin_msa_slli_d: Builtin<"V2LLiV2LLiIUi", "nc">;

def __builtin_msa_splat_b: Builtin<"V16cV16cUi", "nc">;
def __builtin_msa_splat_h: Builtin<"V8sV8sUi", "nc">;
def __builtin_msa_splat_w: Builtin<"V4iV4iUi", "nc">;
def __builtin_msa_splat_d: Builtin<"V2LLiV2LLiUi", "nc">;

def __builtin_msa_splati_b: Builtin<"V16cV16cIUi", "nc">;
def __builtin_msa_splati_h: Builtin<"V8sV8sIUi", "nc">;
def __builtin_msa_splati_w: Builtin<"V4iV4iIUi", "nc">;
def __builtin_msa_splati_d: Builtin<"V2LLiV2LLiIUi", "nc">;

def __builtin_msa_sra_b: Builtin<"V16cV16cV16c", "nc">;
def __builtin_msa_sra_h: Builtin<"V8sV8sV8s", "nc">;
def __builtin_msa_sra_w: Builtin<"V4iV4iV4i", "nc">;
def __builtin_msa_sra_d: Builtin<"V2LLiV2LLiV2LLi", "nc">;

def __builtin_msa_srai_b: Builtin<"V16cV16cIUi", "nc">;
def __builtin_msa_srai_h: Builtin<"V8sV8sIUi", "nc">;
def __builtin_msa_srai_w: Builtin<"V4iV4iIUi", "nc">;
def __builtin_msa_srai_d: Builtin<"V2LLiV2LLiIUi", "nc">;

def __builtin_msa_srar_b: Builtin<"V16cV16cV16c", "nc">;
def __builtin_msa_srar_h: Builtin<"V8sV8sV8s", "nc">;
def __builtin_msa_srar_w: Builtin<"V4iV4iV4i", "nc">;
def __builtin_msa_srar_d: Builtin<"V2LLiV2LLiV2LLi", "nc">;

def __builtin_msa_srari_b: Builtin<"V16cV16cIUi", "nc">;
def __builtin_msa_srari_h: Builtin<"V8sV8sIUi", "nc">;
def __builtin_msa_srari_w: Builtin<"V4iV4iIUi", "nc">;
def __builtin_msa_srari_d: Builtin<"V2LLiV2LLiIUi", "nc">;

def __builtin_msa_srl_b: Builtin<"V16cV16cV16c", "nc">;
def __builtin_msa_srl_h: Builtin<"V8sV8sV8s", "nc">;
def __builtin_msa_srl_w: Builtin<"V4iV4iV4i", "nc">;
def __builtin_msa_srl_d: Builtin<"V2LLiV2LLiV2LLi", "nc">;

def __builtin_msa_srli_b: Builtin<"V16cV16cIUi", "nc">;
def __builtin_msa_srli_h: Builtin<"V8sV8sIUi", "nc">;
def __builtin_msa_srli_w: Builtin<"V4iV4iIUi", "nc">;
def __builtin_msa_srli_d: Builtin<"V2LLiV2LLiIUi", "nc">;

def __builtin_msa_srlr_b: Builtin<"V16cV16cV16c", "nc">;
def __builtin_msa_srlr_h: Builtin<"V8sV8sV8s", "nc">;
def __builtin_msa_srlr_w: Builtin<"V4iV4iV4i", "nc">;
def __builtin_msa_srlr_d: Builtin<"V2LLiV2LLiV2LLi", "nc">;

def __builtin_msa_srlri_b: Builtin<"V16cV16cIUi", "nc">;
def __builtin_msa_srlri_h: Builtin<"V8sV8sIUi", "nc">;
def __builtin_msa_srlri_w: Builtin<"V4iV4iIUi", "nc">;
def __builtin_msa_srlri_d: Builtin<"V2LLiV2LLiIUi", "nc">;

def __builtin_msa_st_b: Builtin<"vV16Scv*Ii", "nc">;
def __builtin_msa_st_h: Builtin<"vV8Ssv*Ii", "nc">;
def __builtin_msa_st_w: Builtin<"vV4Siv*Ii", "nc">;
def __builtin_msa_st_d: Builtin<"vV2SLLiv*Ii", "nc">;

def __builtin_msa_str_d: Builtin<"vV2SLLiv*Ii", "nc">;
def __builtin_msa_str_w: Builtin<"vV4Siv*Ii", "nc">;

def __builtin_msa_subs_s_b: Builtin<"V16ScV16ScV16Sc", "nc">;
def __builtin_msa_subs_s_h: Builtin<"V8SsV8SsV8Ss", "nc">;
def __builtin_msa_subs_s_w: Builtin<"V4SiV4SiV4Si", "nc">;
def __builtin_msa_subs_s_d: Builtin<"V2SLLiV2SLLiV2SLLi", "nc">;

def __builtin_msa_subs_u_b: Builtin<"V16UcV16UcV16Uc", "nc">;
def __builtin_msa_subs_u_h: Builtin<"V8UsV8UsV8Us", "nc">;
def __builtin_msa_subs_u_w: Builtin<"V4UiV4UiV4Ui", "nc">;
def __builtin_msa_subs_u_d: Builtin<"V2ULLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_subsus_u_b: Builtin<"V16UcV16UcV16Sc", "nc">;
def __builtin_msa_subsus_u_h: Builtin<"V8UsV8UsV8Ss", "nc">;
def __builtin_msa_subsus_u_w: Builtin<"V4UiV4UiV4Si", "nc">;
def __builtin_msa_subsus_u_d: Builtin<"V2ULLiV2ULLiV2SLLi", "nc">;

def __builtin_msa_subsuu_s_b: Builtin<"V16ScV16UcV16Uc", "nc">;
def __builtin_msa_subsuu_s_h: Builtin<"V8SsV8UsV8Us", "nc">;
def __builtin_msa_subsuu_s_w: Builtin<"V4SiV4UiV4Ui", "nc">;
def __builtin_msa_subsuu_s_d: Builtin<"V2SLLiV2ULLiV2ULLi", "nc">;

def __builtin_msa_subv_b: Builtin<"V16cV16cV16c", "nc">;
def __builtin_msa_subv_h: Builtin<"V8sV8sV8s", "nc">;
def __builtin_msa_subv_w: Builtin<"V4iV4iV4i", "nc">;
def __builtin_msa_subv_d: Builtin<"V2LLiV2LLiV2LLi", "nc">;

def __builtin_msa_subvi_b: Builtin<"V16cV16cIUi", "nc">;
def __builtin_msa_subvi_h: Builtin<"V8sV8sIUi", "nc">;
def __builtin_msa_subvi_w: Builtin<"V4iV4iIUi", "nc">;
def __builtin_msa_subvi_d: Builtin<"V2LLiV2LLiIUi", "nc">;

def __builtin_msa_vshf_b: Builtin<"V16cV16cV16cV16c", "nc">;
def __builtin_msa_vshf_h: Builtin<"V8sV8sV8sV8s", "nc">;
def __builtin_msa_vshf_w: Builtin<"V4iV4iV4iV4i", "nc">;
def __builtin_msa_vshf_d: Builtin<"V2LLiV2LLiV2LLiV2LLi", "nc">;

def __builtin_msa_xor_v: Builtin<"V16cV16cV16c", "nc">;

def __builtin_msa_xori_b: Builtin<"V16cV16cIUi", "nc">;

}
