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

#ifndef WEATHER_DOT_H
#define WEATHER_DOT_H

#include <SgtSim/Heartbeat.h>
#include <SgtSim/SolarGeom.h>

#include <SgtCore/Common.h>
#include <SgtSim/TimeSeries.h>

namespace Sgt
{
    struct WeatherData
    {
        LatLong latLong{greenwich};
        double elevation{0.0};

        std::function<double (const Time&)> temperature{[](const Time&){return 20.0;}}; // Centigrade.

        std::function<Irradiance (const Time&)> irradiance{[](const Time&)->Irradiance{
            return {{{0.0, 0.0, 0.0}}, 0.0, 0.0};}};

        std::function<Array<double, 3> (const Time&)> windVector{[](const Time&)->Array<double, 3>{
            return {{0.0, 0.0, 0.0}};}};

        // Utility functions:
        template<typename T> void setTemperature(const T& f)
        {
            temperature = [f](const Time& t){return f(t);};
        }
        void setTemperature(std::shared_ptr<TimeSeries<Time, double>> series)
        {
            temperature = [series](const Time& t){return series->value(t);};
        }
        void setTemperature(double val)
        {
            temperature = [val](const Time& t){return val;};
        }

        template<typename T> void setIrradiance(const T& f)
        {
            irradiance = [f](const Time& t){return f(t);};
        }
        void setIrradiance(std::shared_ptr<TimeSeries<Time, arma::Col<double>>> series)
        {
            irradiance = [series](const Time& t)->Irradiance{
                auto val = series->value(t); return {{{val(0), val(1), val(2)}}, val(3), val(4)};};
        }
        void setIrradiance(const Irradiance& val)
        {
            irradiance = [val](const Time& t){return val;};
        }

        template<typename T> void setWindVector(const T& f)
        {
            windVector = [f](const Time& t){return f(t);};
        }
        void setWindVector(std::shared_ptr<TimeSeries<Time, arma::Col<double>>> series)
        {
            windVector = [series](const Time& t)->Array<double, 3>{
                auto val = series->value(t); return {{val(0), val(1), val(2)}};};
        }
        void setWindVector(const Array<double, 3>& val)
        {
            windVector = [val](const Time& t){return val;};
        }
    };

    class Weather : public Heartbeat
    {
        public:
        
            WeatherData data;

        /// @name Static member functions:
        /// @{

            static const std::string& sComponentType()
            {
                static std::string result("weather");
                return result;
            }

        /// @}

        /// @name Lifecycle:
        /// @{

            Weather(const std::string& id) :
                Component(id),
                Heartbeat(id, posix_time::minutes(5))
            {
                // Empty.
            }

            virtual ~Weather() = default;

        /// @name Component virtual overridden member functions.
        /// @{

            virtual const std::string& componentType() const override
            {
                return sComponentType();
            }

        /// @}

        /// @name Weather specific member functions.
        /// @{
            
            double temperature()
            {
                return data.temperature(lastUpdated());
            }
            
            Irradiance irradiance()
            {
                return data.irradiance(lastUpdated());
            }
            
            Array<double, 3> windVector()
            {
                return data.windVector(lastUpdated());
            }

        /// @}
    };
}

#endif // WEATHER_DOT_H
