//===-- Implementation of roundf function ---------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "src/__support/common.h"
#include "utils/FPUtil/FloatOperations.h"

namespace __llvm_libc {

float LLVM_LIBC_ENTRYPOINT(roundf)(float x) { return fputil::round(x); }

} // namespace __llvm_libc
