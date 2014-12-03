#include "SinglePhaseTransformerParserPlugin.h"

#include "SinglePhaseTransformer.h"
#include "Network.h"
#include "YamlSupport.h"

namespace SmartGridToolbox
{
   void SinglePhaseTransformerParserPlugin::parse(const YAML::Node& nd, Network& netw, const ParserBase& parser) const
   {
      auto trans = parseSinglePhaseTransformer(nd, parser);

      assertFieldPresent(nd, "bus_0_id");
      assertFieldPresent(nd, "bus_1_id");

      std::string bus0Id = parser.expand<std::string>(nd["bus_0_id"]);
      std::string bus1Id = parser.expand<std::string>(nd["bus_1_id"]);

      netw.addArc(std::move(trans), bus0Id, bus1Id);
   }

   std::unique_ptr<SinglePhaseTransformer> SinglePhaseTransformerParserPlugin::parseSinglePhaseTransformer(
         const YAML::Node& nd, const ParserBase& parser) const
   {
      assertFieldPresent(nd, "id");
      assertFieldPresent(nd, "complex_turns_ratio_01");
      assertFieldPresent(nd, "leakage_impedance");

      const std::string id = parser.expand<std::string>(nd["id"]);
      Complex a = parser.expand<Complex>(nd["complex_turns_ratio_01"]);
      Complex ZL = parser.expand<Complex>(nd["leakage_impedance"]);

      std::unique_ptr<SinglePhaseTransformer> trans(new SinglePhaseTransformer(id, a, ZL));

      return trans;
   }
}