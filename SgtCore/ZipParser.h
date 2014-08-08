#ifndef ZIP_PARSER_DOT_H
#define ZIP_PARSER_DOT_H

#include <LibPowerFlow/Parser.h>

namespace LibPowerFlow
{
   /// @brief ParserPlugin that parses Zip objects.
   class ZipParser : public ParserPlugin
   {
      public:
         static constexpr const char* pluginKey()
         {
            return "zip";
         }

      public:
         virtual void parse(const YAML::Node& nd, Network& netw) const override;
   };
}

#endif // ZIP_PARSER_DOT_H
