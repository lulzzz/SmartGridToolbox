#include "Gen.h"

#include <ostream>

namespace LibPowerFlow
{
   std::ostream& Gen::print(std::ostream& os) const
   {
      IndentingOStreamBuf ind(os, "");
      os << "gen:" << std::endl;
      ind.setInd("    ");
      os << "id: " << id_ << std::endl;
      os << "phases: " << phases_ << std::endl;
      os << "S: " << S_ << std::endl;
      os << "PMin: " << PMin_ << std::endl;
      os << "PMax: " << PMax_ << std::endl;
      os << "QMin: " << QMin_ << std::endl;
      os << "QMax: " << QMax_ << std::endl;
      os << "cStartup : " << cStartup_ << std::endl;
      os << "cShutdown: " << cShutdown_ << std::endl;
      os << "c0: " << c0_ << std::endl;
      os << "c1: " << c1_ << std::endl;
      os << "c2: " << c2_ << std::endl;
      return os;
   }
}
