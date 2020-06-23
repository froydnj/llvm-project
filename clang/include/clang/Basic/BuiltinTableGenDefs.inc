//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef BUILTIN_TABLEGEN_DEFS
#define BUILTIN_TABLEGEN_DEFS

// These must be kept in sync with LanguageID in Builtins.h.
class Language<string name> {
  string Name = name;
}

def GnuLang    : Language<"GNU_LANG">;
def CLang      : Language<"C_LANG">;
def CxxLang    : Language<"CXX_LANG">;
def ObjcLang   : Language<"OBJC_LANG">;
def MsLang     : Language<"MS_LANG">;
def OCLC20Lang : Language<"OCLC20_LANG">;
def OCLC1xLang : Language<"OCLC1X_LANG">;
def OMPLang    : Language<"OMP_LANG">;
def AllLanguages     : Language<"ALL_LANGUAGES">;
def AllGnuLanguages  : Language<"ALL_GNU_LANGUAGES">;
def AllMSLanguages   : Language<"ALL_MS_LANGUAGES">;
def AllOCLCLanguages : Language<"ALL_OCLC_LANGUAGES">;

class BuiltinBase<string type, string attributes, string headerName,
      Language langs, string features> {
  string Type = type;
  string Attributes = attributes;
  string Header = headerName;
  Language Lang = langs;
  string Features = features;
  // Some of our atomics builtins are handled by AtomicExpr rather than as
  // normal builtin CallExprs.  This bit is used for such builtins.
  bit Atomic = 0;
}

class Builtin<string type, string attributes> :
    BuiltinBase<type, attributes, "", AllLanguages, ""> {
}

class LibraryBuiltin<string type, string attributes, string headerName, Language langs> :
    BuiltinBase<type, attributes, headerName, langs, ""> {
}

class LangBuiltin<string type, string attributes, Language langs> :
    BuiltinBase<type, attributes, "", langs, ""> {
}

#endif // BUILTIN_TABLEGEN_DEFS
