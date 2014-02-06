#include "RegisterParserPlugins.h"

#include "BranchParser.h"
#include "BusParser.h"
#include "CdfParser.h"
#include "DGYTransformerParser.h"
#include "MatpowerParser.h"
#include "NetworkParser.h"
#include "OverheadLineParser.h"
#include "SimpleBatteryParser.h"
#include "SimpleBuildingParser.h"
#include "SimpleDcPowerSourceParser.h"
#include "SimpleInverterParser.h"
#include "SinglePhaseTransformerParser.h"
#include "SolarPvParser.h"
#include "WeatherParser.h"
#include "YYTransformerParser.h"
#include "ZipToGroundParser.h"

namespace SmartGridToolbox
{
   void registerParserPlugins(Parser & p)
   {
      p.registerParserPlugin<BranchParser>();
      p.registerParserPlugin<BusParser>();
      p.registerParserPlugin<CdfParser>();
      p.registerParserPlugin<DGYTransformerParser>();
      p.registerParserPlugin<MatpowerParser>();
      p.registerParserPlugin<NetworkParser>();
      p.registerParserPlugin<OverheadLineParser>();
      p.registerParserPlugin<SimpleBatteryParser>();
      p.registerParserPlugin<SimpleBuildingParser>();
      p.registerParserPlugin<SimpleDcPowerSourceParser>();
      p.registerParserPlugin<SimpleInverterParser>();
      p.registerParserPlugin<SinglePhaseTransformerParser>();
      p.registerParserPlugin<SolarPvParser>();
      p.registerParserPlugin<WeatherParser>();
      p.registerParserPlugin<YYTransformerParser>();
      p.registerParserPlugin<ZipToGroundParser>();
   }
}
