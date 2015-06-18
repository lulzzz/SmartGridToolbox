// Copyright 2015 National ICT Australia Limited (NICTA)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "WeatherParserPlugin.h"

#include "Simulation.h"
#include "Weather.h"

namespace Sgt
{
    void WeatherParserPlugin::parse(const YAML::Node& nd, Simulation& sim, const ParserBase& parser) const
    {
        assertFieldPresent(nd, "id");

        string id = parser.expand<std::string>(nd["id"]);
        auto weather = sim.newSimComponent<Weather>(id);

        weather->setLatLong(sim.latLong());

        const auto& temperatureNd = nd["temperature"];
        if (temperatureNd)
        {
            std::string id = parser.expand<std::string>(temperatureNd);
            auto series = sim.timeSeries<TimeSeries<Time, double>>(id);
            sgtAssert(series != nullptr, "Parsing weather: couldn't find time series " << id << ".");
            weather->setTemperatureSeries(series);
        }

        const auto& cloudNd = nd["cloud_cover"];
        if (cloudNd)
        {
            std::string id = parser.expand<std::string>(cloudNd);
            auto series = sim.timeSeries<TimeSeries<Time, double>>(id);
            sgtAssert(series != nullptr, "Parsing weather: couldn't find time series " << id << ".");
            weather->setCloudCoverSeries(series);
        }

        if (nd["dt"])
        {
            weather->setDt(parser.expand<Time>(nd["dt"]));
        }
        else
        {
            weather->setDt(posix_time::minutes(5.0));
        }
    }
}
