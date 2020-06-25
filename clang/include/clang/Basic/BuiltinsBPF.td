//===--- BuiltinsBPF.def - BPF Builtin function database --------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the BPF-specific builtin function database.  Users of
// this file must define the BUILTIN macro to make use of this information.
//
//===----------------------------------------------------------------------===//

// Type and attribute strings are as defined in Builtins.td.


// Get record field information.
include "BuiltinTableGenDefs.inc"

let TargetArch = "BPF" in {
def __builtin_preserve_field_info: TargetBuiltin<"Ui.", "t", "">;

// Get BTF type id.
def __builtin_btf_type_id: TargetBuiltin<"Ui.", "t", "">;

}
