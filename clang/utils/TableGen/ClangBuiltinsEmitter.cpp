#include "TableGenBackends.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/TableGen/Record.h"
#include "llvm/TableGen/TableGenBackend.h"

#include <algorithm>
#include <vector>

using namespace llvm;

namespace clang {

void EmitClangBuiltins(RecordKeeper &Records, raw_ostream &OS) {
  std::vector<Record *> Builtins = Records.getAllDerivedDefinitions("BuiltinBase");
  // The atomic builtins, particularly, are assumed to be assigned IDs in
  // definition order.
  std::sort(Builtins.begin(), Builtins.end(), LessRecordByID());

  OS << "#if defined(BUILTIN) && !defined(LIBBUILTIN)\n"
     << "#  define LIBBUILTIN(ID, TYPE, ATTRS, HEADER, BUILTIN_LANG) "
        "BUILTIN(ID, TYPE, ATTRS)\n"
     << "#endif\n"
     << "\n"
     << "#if defined(BUILTIN) && !defined(LANGBUILTIN)\n"
     << "#  define LANGBUILTIN(ID, TYPE, ATTRS, BUILTIN_LANG) BUILTIN(ID, "
        "TYPE, ATTRS)\n"
     << "#endif\n"
     << "\n"
     << "#if defined(BUILTIN) && !defined(TARGET_BUILTIN)\n"
     << "#   define TARGET_BUILTIN(ID, TYPE, ATTRS, FEATURE) BUILTIN(ID, TYPE, ATTRS)\n"
     << "#endif\n"
     << "\n"
     << "#if defined(BUILTIN) && !defined(TARGET_HEADER_BUILTIN)\n"
     << "#  define TARGET_HEADER_BUILTIN(ID, TYPE, ATTRS, HEADER, LANG, FEATURE) BUILTIN(ID, TYPE, ATTRS)\n"
     << "#endif\n"
     << "\n"
     << "#ifndef ATOMIC_BUILTIN\n"
     << "#  define ATOMIC_BUILTIN(ID, TYPE, ATTRS) BUILTIN(ID, TYPE, ATTRS)\n"
     << "#endif\n"
     << "\n";

  Record *LibraryBuiltinClass = Records.getClass("LibraryBuiltin");
  Record *LangBuiltinClass = Records.getClass("LangBuiltin");
  Record *TargetBuiltinClass = Records.getClass("TargetBuiltin");
  Record *TargetHeaderBuiltinClass = Records.getClass("TargetHeaderBuiltin");

  for (const auto &R : Builtins) {
    StringRef Name = R->getName();
    StringRef Type = R->getValueAsString("Type");
    StringRef Attributes = R->getValueAsString("Attributes");
    StringRef Language = R->getValueAsDef("Lang")->getValueAsString("Name");
    StringRef Header = R->getValueAsString("Header");
    StringRef Features = R->getValueAsString("Features");

    if (R->getValueAsBit("Atomic")) {
      OS << "ATOMIC_BUILTIN(" << Name << ", \"" << Type << "\", \""
         << Attributes << "\")\n";
      continue;
    }

    if (R->isSubClassOf(LibraryBuiltinClass)) {
      OS << "LIBBUILTIN(" << Name << ", \"" << Type << "\", \"" << Attributes
         << "\", \"" << Header << "\", " << Language << ")\n";
      continue;
    }

    if (R->isSubClassOf(LangBuiltinClass)) {
      OS << "LANGBUILTIN(" << Name << ", \"" << Type << "\", \"" << Attributes
         << "\", " << Language << ")\n";
      continue;
    }

    if (R->isSubClassOf(TargetBuiltinClass)) {
      OS << "TARGET_BUILTIN(" << Name << ", \"" << Type << "\", \"" << Attributes
	 << "\", \"" << Features << "\")\n";
      continue;
    }

    if (R->isSubClassOf(TargetHeaderBuiltinClass)) {
      OS << "TARGET_HEADER_BUILTIN(" << Name << ", \"" << Type << "\", \"" << Attributes
	 << "\", \"" << Header << "\", " << Language << ", \"" << Features << "\")\n";
      continue;
    }

    OS << "BUILTIN(" << Name << ", \"" << Type << "\", \"" << Attributes
       << "\")\n";
  }

  OS << "#undef BUILTIN\n"
     << "#undef ATOMIC_BUILTIN\n"
     << "#undef LANGBUILTIN\n"
     << "#undef LIBBUILTIN\n"
     << "#undef TARGET_BUILTIN\n"
     << "#undef TARGET_HEADER_BUILTIN\n";
}

} // end namespace clang
