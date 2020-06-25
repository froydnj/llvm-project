//===--- BuiltinsXCore.def - XCore Builtin function database ----*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the XCore-specific builtin function database.  Users of
// this file must define the BUILTIN macro to make use of this information.
//
//===----------------------------------------------------------------------===//

// Type and attribute strings are as defined in Builtins.td.

include "BuiltinTableGenDefs.inc"

let TargetArch = "XCore" in {
def __builtin_bitrev: Builtin<"UiUi", "nc">;
def __builtin_getid: Builtin<"Si", "nc">;
def __builtin_getps: Builtin<"UiUi", "n">;
def __builtin_setps: Builtin<"vUiUi", "n">;

}
