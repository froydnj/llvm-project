//===-- BuiltinsSystemZ.def - SystemZ Builtin function database -*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the SystemZ-specific builtin function database.  Users of
// this file must define the BUILTIN macro to make use of this information.
//
//===----------------------------------------------------------------------===//

// Type and attribute strings are as defined in Builtins.td.


// Transactional-memory intrinsics
include "BuiltinTableGenDefs.inc"

let TargetArch = "SystemZ" in {
def __builtin_tbegin: TargetBuiltin<"iv*", "j", "transactional-execution">;
def __builtin_tbegin_nofloat: TargetBuiltin<"iv*", "j", "transactional-execution">;
def __builtin_tbeginc: TargetBuiltin<"v", "nj", "transactional-execution">;
def __builtin_tabort: TargetBuiltin<"vi", "r", "transactional-execution">;
def __builtin_tend: TargetBuiltin<"i", "n", "transactional-execution">;
def __builtin_tx_nesting_depth: TargetBuiltin<"i", "nc", "transactional-execution">;
def __builtin_tx_assist: TargetBuiltin<"vi", "n", "transactional-execution">;
def __builtin_non_tx_store: TargetBuiltin<"vULi*ULi", "", "transactional-execution">;

// Vector intrinsics.
// These all map directly to z instructions, except that some variants ending
// in "s" have a final "int *" that receives the post-instruction CC value.

// Vector support instructions (chapter 21 of the PoP)
def __builtin_s390_lcbb: TargetBuiltin<"UivC*Ii", "nc", "vector">;
def __builtin_s390_vlbb: TargetBuiltin<"V16ScvC*Ii", "", "vector">;
def __builtin_s390_vll: TargetBuiltin<"V16ScUivC*", "", "vector">;
def __builtin_s390_vstl: TargetBuiltin<"vV16ScUiv*", "", "vector">;
def __builtin_s390_vperm: TargetBuiltin<"V16UcV16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vpdi: TargetBuiltin<"V2ULLiV2ULLiV2ULLiIi", "nc", "vector">;
def __builtin_s390_vpksh: TargetBuiltin<"V16ScV8SsV8Ss", "nc", "vector">;
def __builtin_s390_vpkshs: TargetBuiltin<"V16ScV8SsV8Ssi*", "nc", "vector">;
def __builtin_s390_vpksf: TargetBuiltin<"V8SsV4SiV4Si", "nc", "vector">;
def __builtin_s390_vpksfs: TargetBuiltin<"V8SsV4SiV4Sii*", "nc", "vector">;
def __builtin_s390_vpksg: TargetBuiltin<"V4SiV2SLLiV2SLLi", "nc", "vector">;
def __builtin_s390_vpksgs: TargetBuiltin<"V4SiV2SLLiV2SLLii*", "nc", "vector">;
def __builtin_s390_vpklsh: TargetBuiltin<"V16UcV8UsV8Us", "nc", "vector">;
def __builtin_s390_vpklshs: TargetBuiltin<"V16UcV8UsV8Usi*", "nc", "vector">;
def __builtin_s390_vpklsf: TargetBuiltin<"V8UsV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vpklsfs: TargetBuiltin<"V8UsV4UiV4Uii*", "nc", "vector">;
def __builtin_s390_vpklsg: TargetBuiltin<"V4UiV2ULLiV2ULLi", "nc", "vector">;
def __builtin_s390_vpklsgs: TargetBuiltin<"V4UiV2ULLiV2ULLii*", "nc", "vector">;
def __builtin_s390_vuphb: TargetBuiltin<"V8SsV16Sc", "nc", "vector">;
def __builtin_s390_vuphh: TargetBuiltin<"V4SiV8Ss", "nc", "vector">;
def __builtin_s390_vuphf: TargetBuiltin<"V2SLLiV4Si", "nc", "vector">;
def __builtin_s390_vuplb: TargetBuiltin<"V8SsV16Sc", "nc", "vector">;
def __builtin_s390_vuplhw: TargetBuiltin<"V4SiV8Ss", "nc", "vector">;
def __builtin_s390_vuplf: TargetBuiltin<"V2SLLiV4Si", "nc", "vector">;
def __builtin_s390_vuplhb: TargetBuiltin<"V8UsV16Uc", "nc", "vector">;
def __builtin_s390_vuplhh: TargetBuiltin<"V4UiV8Us", "nc", "vector">;
def __builtin_s390_vuplhf: TargetBuiltin<"V2ULLiV4Ui", "nc", "vector">;
def __builtin_s390_vupllb: TargetBuiltin<"V8UsV16Uc", "nc", "vector">;
def __builtin_s390_vupllh: TargetBuiltin<"V4UiV8Us", "nc", "vector">;
def __builtin_s390_vupllf: TargetBuiltin<"V2ULLiV4Ui", "nc", "vector">;

// Vector integer instructions (chapter 22 of the PoP)
def __builtin_s390_vaq: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vacq: TargetBuiltin<"V16UcV16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vaccb: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vacch: TargetBuiltin<"V8UsV8UsV8Us", "nc", "vector">;
def __builtin_s390_vaccf: TargetBuiltin<"V4UiV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vaccg: TargetBuiltin<"V2ULLiV2ULLiV2ULLi", "nc", "vector">;
def __builtin_s390_vaccq: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vacccq: TargetBuiltin<"V16UcV16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vavgb: TargetBuiltin<"V16ScV16ScV16Sc", "nc", "vector">;
def __builtin_s390_vavgh: TargetBuiltin<"V8SsV8SsV8Ss", "nc", "vector">;
def __builtin_s390_vavgf: TargetBuiltin<"V4SiV4SiV4Si", "nc", "vector">;
def __builtin_s390_vavgg: TargetBuiltin<"V2SLLiV2SLLiV2SLLi", "nc", "vector">;
def __builtin_s390_vavglb: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vavglh: TargetBuiltin<"V8UsV8UsV8Us", "nc", "vector">;
def __builtin_s390_vavglf: TargetBuiltin<"V4UiV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vavglg: TargetBuiltin<"V2ULLiV2ULLiV2ULLi", "nc", "vector">;
def __builtin_s390_vceqbs: TargetBuiltin<"V16ScV16ScV16Sci*", "nc", "vector">;
def __builtin_s390_vceqhs: TargetBuiltin<"V8SsV8SsV8Ssi*", "nc", "vector">;
def __builtin_s390_vceqfs: TargetBuiltin<"V4SiV4SiV4Sii*", "nc", "vector">;
def __builtin_s390_vceqgs: TargetBuiltin<"V2SLLiV2SLLiV2SLLii*", "nc", "vector">;
def __builtin_s390_vchbs: TargetBuiltin<"V16ScV16ScV16Sci*", "nc", "vector">;
def __builtin_s390_vchhs: TargetBuiltin<"V8SsV8SsV8Ssi*", "nc", "vector">;
def __builtin_s390_vchfs: TargetBuiltin<"V4SiV4SiV4Sii*", "nc", "vector">;
def __builtin_s390_vchgs: TargetBuiltin<"V2SLLiV2SLLiV2SLLii*", "nc", "vector">;
def __builtin_s390_vchlbs: TargetBuiltin<"V16ScV16UcV16Uci*", "nc", "vector">;
def __builtin_s390_vchlhs: TargetBuiltin<"V8SsV8UsV8Usi*", "nc", "vector">;
def __builtin_s390_vchlfs: TargetBuiltin<"V4SiV4UiV4Uii*", "nc", "vector">;
def __builtin_s390_vchlgs: TargetBuiltin<"V2SLLiV2ULLiV2ULLii*", "nc", "vector">;
def __builtin_s390_vcksm: TargetBuiltin<"V4UiV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vclzb: TargetBuiltin<"V16UcV16Uc", "nc", "vector">;
def __builtin_s390_vclzh: TargetBuiltin<"V8UsV8Us", "nc", "vector">;
def __builtin_s390_vclzf: TargetBuiltin<"V4UiV4Ui", "nc", "vector">;
def __builtin_s390_vclzg: TargetBuiltin<"V2ULLiV2ULLi", "nc", "vector">;
def __builtin_s390_vctzb: TargetBuiltin<"V16UcV16Uc", "nc", "vector">;
def __builtin_s390_vctzh: TargetBuiltin<"V8UsV8Us", "nc", "vector">;
def __builtin_s390_vctzf: TargetBuiltin<"V4UiV4Ui", "nc", "vector">;
def __builtin_s390_vctzg: TargetBuiltin<"V2ULLiV2ULLi", "nc", "vector">;
def __builtin_s390_verimb: TargetBuiltin<"V16UcV16UcV16UcV16UcIi", "nc", "vector">;
def __builtin_s390_verimh: TargetBuiltin<"V8UsV8UsV8UsV8UsIi", "nc", "vector">;
def __builtin_s390_verimf: TargetBuiltin<"V4UiV4UiV4UiV4UiIi", "nc", "vector">;
def __builtin_s390_verimg: TargetBuiltin<"V2ULLiV2ULLiV2ULLiV2ULLiIi", "nc", "vector">;
def __builtin_s390_verllb: TargetBuiltin<"V16UcV16UcUi", "nc", "vector">;
def __builtin_s390_verllh: TargetBuiltin<"V8UsV8UsUi", "nc", "vector">;
def __builtin_s390_verllf: TargetBuiltin<"V4UiV4UiUi", "nc", "vector">;
def __builtin_s390_verllg: TargetBuiltin<"V2ULLiV2ULLiUi", "nc", "vector">;
def __builtin_s390_verllvb: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_verllvh: TargetBuiltin<"V8UsV8UsV8Us", "nc", "vector">;
def __builtin_s390_verllvf: TargetBuiltin<"V4UiV4UiV4Ui", "nc", "vector">;
def __builtin_s390_verllvg: TargetBuiltin<"V2ULLiV2ULLiV2ULLi", "nc", "vector">;
def __builtin_s390_vgfmb: TargetBuiltin<"V8UsV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vgfmh: TargetBuiltin<"V4UiV8UsV8Us", "nc", "vector">;
def __builtin_s390_vgfmf: TargetBuiltin<"V2ULLiV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vgfmg: TargetBuiltin<"V16UcV2ULLiV2ULLi", "nc", "vector">;
def __builtin_s390_vgfmab: TargetBuiltin<"V8UsV16UcV16UcV8Us", "nc", "vector">;
def __builtin_s390_vgfmah: TargetBuiltin<"V4UiV8UsV8UsV4Ui", "nc", "vector">;
def __builtin_s390_vgfmaf: TargetBuiltin<"V2ULLiV4UiV4UiV2ULLi", "nc", "vector">;
def __builtin_s390_vgfmag: TargetBuiltin<"V16UcV2ULLiV2ULLiV16Uc", "nc", "vector">;
def __builtin_s390_vmahb: TargetBuiltin<"V16ScV16ScV16ScV16Sc", "nc", "vector">;
def __builtin_s390_vmahh: TargetBuiltin<"V8SsV8SsV8SsV8Ss", "nc", "vector">;
def __builtin_s390_vmahf: TargetBuiltin<"V4SiV4SiV4SiV4Si", "nc", "vector">;
def __builtin_s390_vmalhb: TargetBuiltin<"V16UcV16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vmalhh: TargetBuiltin<"V8UsV8UsV8UsV8Us", "nc", "vector">;
def __builtin_s390_vmalhf: TargetBuiltin<"V4UiV4UiV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vmaeb: TargetBuiltin<"V8SsV16ScV16ScV8Ss", "nc", "vector">;
def __builtin_s390_vmaeh: TargetBuiltin<"V4SiV8SsV8SsV4Si", "nc", "vector">;
def __builtin_s390_vmaef: TargetBuiltin<"V2SLLiV4SiV4SiV2SLLi", "nc", "vector">;
def __builtin_s390_vmaleb: TargetBuiltin<"V8UsV16UcV16UcV8Us", "nc", "vector">;
def __builtin_s390_vmaleh: TargetBuiltin<"V4UiV8UsV8UsV4Ui", "nc", "vector">;
def __builtin_s390_vmalef: TargetBuiltin<"V2ULLiV4UiV4UiV2ULLi", "nc", "vector">;
def __builtin_s390_vmaob: TargetBuiltin<"V8SsV16ScV16ScV8Ss", "nc", "vector">;
def __builtin_s390_vmaoh: TargetBuiltin<"V4SiV8SsV8SsV4Si", "nc", "vector">;
def __builtin_s390_vmaof: TargetBuiltin<"V2SLLiV4SiV4SiV2SLLi", "nc", "vector">;
def __builtin_s390_vmalob: TargetBuiltin<"V8UsV16UcV16UcV8Us", "nc", "vector">;
def __builtin_s390_vmaloh: TargetBuiltin<"V4UiV8UsV8UsV4Ui", "nc", "vector">;
def __builtin_s390_vmalof: TargetBuiltin<"V2ULLiV4UiV4UiV2ULLi", "nc", "vector">;
def __builtin_s390_vmhb: TargetBuiltin<"V16ScV16ScV16Sc", "nc", "vector">;
def __builtin_s390_vmhh: TargetBuiltin<"V8SsV8SsV8Ss", "nc", "vector">;
def __builtin_s390_vmhf: TargetBuiltin<"V4SiV4SiV4Si", "nc", "vector">;
def __builtin_s390_vmlhb: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vmlhh: TargetBuiltin<"V8UsV8UsV8Us", "nc", "vector">;
def __builtin_s390_vmlhf: TargetBuiltin<"V4UiV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vmeb: TargetBuiltin<"V8SsV16ScV16Sc", "nc", "vector">;
def __builtin_s390_vmeh: TargetBuiltin<"V4SiV8SsV8Ss", "nc", "vector">;
def __builtin_s390_vmef: TargetBuiltin<"V2SLLiV4SiV4Si", "nc", "vector">;
def __builtin_s390_vmleb: TargetBuiltin<"V8UsV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vmleh: TargetBuiltin<"V4UiV8UsV8Us", "nc", "vector">;
def __builtin_s390_vmlef: TargetBuiltin<"V2ULLiV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vmob: TargetBuiltin<"V8SsV16ScV16Sc", "nc", "vector">;
def __builtin_s390_vmoh: TargetBuiltin<"V4SiV8SsV8Ss", "nc", "vector">;
def __builtin_s390_vmof: TargetBuiltin<"V2SLLiV4SiV4Si", "nc", "vector">;
def __builtin_s390_vmlob: TargetBuiltin<"V8UsV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vmloh: TargetBuiltin<"V4UiV8UsV8Us", "nc", "vector">;
def __builtin_s390_vmlof: TargetBuiltin<"V2ULLiV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vpopctb: TargetBuiltin<"V16UcV16Uc", "nc", "vector">;
def __builtin_s390_vpopcth: TargetBuiltin<"V8UsV8Us", "nc", "vector">;
def __builtin_s390_vpopctf: TargetBuiltin<"V4UiV4Ui", "nc", "vector">;
def __builtin_s390_vpopctg: TargetBuiltin<"V2ULLiV2ULLi", "nc", "vector">;
def __builtin_s390_vsq: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vsbcbiq: TargetBuiltin<"V16UcV16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vsbiq: TargetBuiltin<"V16UcV16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vscbib: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vscbih: TargetBuiltin<"V8UsV8UsV8Us", "nc", "vector">;
def __builtin_s390_vscbif: TargetBuiltin<"V4UiV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vscbig: TargetBuiltin<"V2ULLiV2ULLiV2ULLi", "nc", "vector">;
def __builtin_s390_vscbiq: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vsl: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vslb: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vsldb: TargetBuiltin<"V16UcV16UcV16UcIi", "nc", "vector">;
def __builtin_s390_vsra: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vsrab: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vsrl: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vsrlb: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vsumb: TargetBuiltin<"V4UiV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vsumh: TargetBuiltin<"V4UiV8UsV8Us", "nc", "vector">;
def __builtin_s390_vsumgh: TargetBuiltin<"V2ULLiV8UsV8Us", "nc", "vector">;
def __builtin_s390_vsumgf: TargetBuiltin<"V2ULLiV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vsumqf: TargetBuiltin<"V16UcV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vsumqg: TargetBuiltin<"V16UcV2ULLiV2ULLi", "nc", "vector">;
def __builtin_s390_vtm: TargetBuiltin<"iV16UcV16Uc", "nc", "vector">;

// Vector string instructions (chapter 23 of the PoP)
def __builtin_s390_vfaeb: TargetBuiltin<"V16UcV16UcV16UcIi", "nc", "vector">;
def __builtin_s390_vfaebs: TargetBuiltin<"V16UcV16UcV16UcIii*", "nc", "vector">;
def __builtin_s390_vfaeh: TargetBuiltin<"V8UsV8UsV8UsIi", "nc", "vector">;
def __builtin_s390_vfaehs: TargetBuiltin<"V8UsV8UsV8UsIii*", "nc", "vector">;
def __builtin_s390_vfaef: TargetBuiltin<"V4UiV4UiV4UiIi", "nc", "vector">;
def __builtin_s390_vfaefs: TargetBuiltin<"V4UiV4UiV4UiIii*", "nc", "vector">;
def __builtin_s390_vfaezb: TargetBuiltin<"V16UcV16UcV16UcIi", "nc", "vector">;
def __builtin_s390_vfaezbs: TargetBuiltin<"V16UcV16UcV16UcIii*", "nc", "vector">;
def __builtin_s390_vfaezh: TargetBuiltin<"V8UsV8UsV8UsIi", "nc", "vector">;
def __builtin_s390_vfaezhs: TargetBuiltin<"V8UsV8UsV8UsIii*", "nc", "vector">;
def __builtin_s390_vfaezf: TargetBuiltin<"V4UiV4UiV4UiIi", "nc", "vector">;
def __builtin_s390_vfaezfs: TargetBuiltin<"V4UiV4UiV4UiIii*", "nc", "vector">;
def __builtin_s390_vfeeb: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vfeebs: TargetBuiltin<"V16UcV16UcV16Uci*", "nc", "vector">;
def __builtin_s390_vfeeh: TargetBuiltin<"V8UsV8UsV8Us", "nc", "vector">;
def __builtin_s390_vfeehs: TargetBuiltin<"V8UsV8UsV8Usi*", "nc", "vector">;
def __builtin_s390_vfeef: TargetBuiltin<"V4UiV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vfeefs: TargetBuiltin<"V4UiV4UiV4Uii*", "nc", "vector">;
def __builtin_s390_vfeezb: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vfeezbs: TargetBuiltin<"V16UcV16UcV16Uci*", "nc", "vector">;
def __builtin_s390_vfeezh: TargetBuiltin<"V8UsV8UsV8Us", "nc", "vector">;
def __builtin_s390_vfeezhs: TargetBuiltin<"V8UsV8UsV8Usi*", "nc", "vector">;
def __builtin_s390_vfeezf: TargetBuiltin<"V4UiV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vfeezfs: TargetBuiltin<"V4UiV4UiV4Uii*", "nc", "vector">;
def __builtin_s390_vfeneb: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vfenebs: TargetBuiltin<"V16UcV16UcV16Uci*", "nc", "vector">;
def __builtin_s390_vfeneh: TargetBuiltin<"V8UsV8UsV8Us", "nc", "vector">;
def __builtin_s390_vfenehs: TargetBuiltin<"V8UsV8UsV8Usi*", "nc", "vector">;
def __builtin_s390_vfenef: TargetBuiltin<"V4UiV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vfenefs: TargetBuiltin<"V4UiV4UiV4Uii*", "nc", "vector">;
def __builtin_s390_vfenezb: TargetBuiltin<"V16UcV16UcV16Uc", "nc", "vector">;
def __builtin_s390_vfenezbs: TargetBuiltin<"V16UcV16UcV16Uci*", "nc", "vector">;
def __builtin_s390_vfenezh: TargetBuiltin<"V8UsV8UsV8Us", "nc", "vector">;
def __builtin_s390_vfenezhs: TargetBuiltin<"V8UsV8UsV8Usi*", "nc", "vector">;
def __builtin_s390_vfenezf: TargetBuiltin<"V4UiV4UiV4Ui", "nc", "vector">;
def __builtin_s390_vfenezfs: TargetBuiltin<"V4UiV4UiV4Uii*", "nc", "vector">;
def __builtin_s390_vistrb: TargetBuiltin<"V16UcV16Uc", "nc", "vector">;
def __builtin_s390_vistrbs: TargetBuiltin<"V16UcV16Uci*", "nc", "vector">;
def __builtin_s390_vistrh: TargetBuiltin<"V8UsV8Us", "nc", "vector">;
def __builtin_s390_vistrhs: TargetBuiltin<"V8UsV8Usi*", "nc", "vector">;
def __builtin_s390_vistrf: TargetBuiltin<"V4UiV4Ui", "nc", "vector">;
def __builtin_s390_vistrfs: TargetBuiltin<"V4UiV4Uii*", "nc", "vector">;
def __builtin_s390_vstrcb: TargetBuiltin<"V16UcV16UcV16UcV16UcIi", "nc", "vector">;
def __builtin_s390_vstrcbs: TargetBuiltin<"V16UcV16UcV16UcV16UcIii*", "nc", "vector">;
def __builtin_s390_vstrch: TargetBuiltin<"V8UsV8UsV8UsV8UsIi", "nc", "vector">;
def __builtin_s390_vstrchs: TargetBuiltin<"V8UsV8UsV8UsV8UsIii*", "nc", "vector">;
def __builtin_s390_vstrcf: TargetBuiltin<"V4UiV4UiV4UiV4UiIi", "nc", "vector">;
def __builtin_s390_vstrcfs: TargetBuiltin<"V4UiV4UiV4UiV4UiIii*", "nc", "vector">;
def __builtin_s390_vstrczb: TargetBuiltin<"V16UcV16UcV16UcV16UcIi", "nc", "vector">;
def __builtin_s390_vstrczbs: TargetBuiltin<"V16UcV16UcV16UcV16UcIii*", "nc", "vector">;
def __builtin_s390_vstrczh: TargetBuiltin<"V8UsV8UsV8UsV8UsIi", "nc", "vector">;
def __builtin_s390_vstrczhs: TargetBuiltin<"V8UsV8UsV8UsV8UsIii*", "nc", "vector">;
def __builtin_s390_vstrczf: TargetBuiltin<"V4UiV4UiV4UiV4UiIi", "nc", "vector">;
def __builtin_s390_vstrczfs: TargetBuiltin<"V4UiV4UiV4UiV4UiIii*", "nc", "vector">;

// Vector floating-point instructions (chapter 24 of the PoP)
def __builtin_s390_vfcedbs: TargetBuiltin<"V2SLLiV2dV2di*", "nc", "vector">;
def __builtin_s390_vfchdbs: TargetBuiltin<"V2SLLiV2dV2di*", "nc", "vector">;
def __builtin_s390_vfchedbs: TargetBuiltin<"V2SLLiV2dV2di*", "nc", "vector">;
def __builtin_s390_vfidb: TargetBuiltin<"V2dV2dIiIi", "nc", "vector">;
def __builtin_s390_vflndb: TargetBuiltin<"V2dV2d", "nc", "vector">;
def __builtin_s390_vflpdb: TargetBuiltin<"V2dV2d", "nc", "vector">;
def __builtin_s390_vfmadb: TargetBuiltin<"V2dV2dV2dV2d", "nc", "vector">;
def __builtin_s390_vfmsdb: TargetBuiltin<"V2dV2dV2dV2d", "nc", "vector">;
def __builtin_s390_vfsqdb: TargetBuiltin<"V2dV2d", "nc", "vector">;
def __builtin_s390_vftcidb: TargetBuiltin<"V2SLLiV2dIii*", "nc", "vector">;

// Vector-enhancements facility 1 intrinsics.
def __builtin_s390_vlrl: TargetBuiltin<"V16ScUivC*", "", "vector-enhancements-1">;
def __builtin_s390_vstrl: TargetBuiltin<"vV16ScUiv*", "", "vector-enhancements-1">;
def __builtin_s390_vbperm: TargetBuiltin<"V2ULLiV16UcV16Uc", "nc", "vector-enhancements-1">;
def __builtin_s390_vmslg: TargetBuiltin<"V16UcV2ULLiV2ULLiV16UcIi", "nc", "vector-enhancements-1">;
def __builtin_s390_vfmaxdb: TargetBuiltin<"V2dV2dV2dIi", "nc", "vector-enhancements-1">;
def __builtin_s390_vfmindb: TargetBuiltin<"V2dV2dV2dIi", "nc", "vector-enhancements-1">;
def __builtin_s390_vfnmadb: TargetBuiltin<"V2dV2dV2dV2d", "nc", "vector-enhancements-1">;
def __builtin_s390_vfnmsdb: TargetBuiltin<"V2dV2dV2dV2d", "nc", "vector-enhancements-1">;
def __builtin_s390_vfcesbs: TargetBuiltin<"V4SiV4fV4fi*", "nc", "vector-enhancements-1">;
def __builtin_s390_vfchsbs: TargetBuiltin<"V4SiV4fV4fi*", "nc", "vector-enhancements-1">;
def __builtin_s390_vfchesbs: TargetBuiltin<"V4SiV4fV4fi*", "nc", "vector-enhancements-1">;
def __builtin_s390_vfisb: TargetBuiltin<"V4fV4fIiIi", "nc", "vector-enhancements-1">;
def __builtin_s390_vfmaxsb: TargetBuiltin<"V4fV4fV4fIi", "nc", "vector-enhancements-1">;
def __builtin_s390_vfminsb: TargetBuiltin<"V4fV4fV4fIi", "nc", "vector-enhancements-1">;
def __builtin_s390_vflnsb: TargetBuiltin<"V4fV4f", "nc", "vector-enhancements-1">;
def __builtin_s390_vflpsb: TargetBuiltin<"V4fV4f", "nc", "vector-enhancements-1">;
def __builtin_s390_vfmasb: TargetBuiltin<"V4fV4fV4fV4f", "nc", "vector-enhancements-1">;
def __builtin_s390_vfmssb: TargetBuiltin<"V4fV4fV4fV4f", "nc", "vector-enhancements-1">;
def __builtin_s390_vfnmasb: TargetBuiltin<"V4fV4fV4fV4f", "nc", "vector-enhancements-1">;
def __builtin_s390_vfnmssb: TargetBuiltin<"V4fV4fV4fV4f", "nc", "vector-enhancements-1">;
def __builtin_s390_vfsqsb: TargetBuiltin<"V4fV4f", "nc", "vector-enhancements-1">;
def __builtin_s390_vftcisb: TargetBuiltin<"V4SiV4fIii*", "nc", "vector-enhancements-1">;

// Vector-enhancements facility 2 intrinsics.
def __builtin_s390_vsld: TargetBuiltin<"V16UcV16UcV16UcIi", "nc", "vector-enhancements-2">;
def __builtin_s390_vsrd: TargetBuiltin<"V16UcV16UcV16UcIi", "nc", "vector-enhancements-2">;
def __builtin_s390_vstrsb: TargetBuiltin<"V16UcV16UcV16UcV16Uci*", "nc", "vector-enhancements-2">;
def __builtin_s390_vstrsh: TargetBuiltin<"V16UcV8UsV8UsV16Uci*", "nc", "vector-enhancements-2">;
def __builtin_s390_vstrsf: TargetBuiltin<"V16UcV4UiV4UiV16Uci*", "nc", "vector-enhancements-2">;
def __builtin_s390_vstrszb: TargetBuiltin<"V16UcV16UcV16UcV16Uci*", "nc", "vector-enhancements-2">;
def __builtin_s390_vstrszh: TargetBuiltin<"V16UcV8UsV8UsV16Uci*", "nc", "vector-enhancements-2">;
def __builtin_s390_vstrszf: TargetBuiltin<"V16UcV4UiV4UiV16Uci*", "nc", "vector-enhancements-2">;

// Helpers to implement vec_revb.
def __builtin_s390_vlbrh: TargetBuiltin<"V8UsV8Us", "nc", "vector">;
def __builtin_s390_vlbrf: TargetBuiltin<"V4UiV4Ui", "nc", "vector">;
def __builtin_s390_vlbrg: TargetBuiltin<"V2ULLiV2ULLi", "nc", "vector">;

}
