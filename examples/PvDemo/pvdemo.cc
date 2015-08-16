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

#include "PvDemoSolver.h"
#include "PvInverter.h"

#include <SgtSim/Simulation.h>
#include <SgtSim/SimNetwork.h>

void setFlatStart(Sgt::Network& netw)
{
    for (auto bus : netw.busses())
    {
        bus->setV(bus->VNom());
    }
}

int main(int argc, const char ** argv)
{
    using namespace Sgt;

    // Log::messageLogLevel = LogLevel::VERBOSE;
    // Log::warningLogLevel = LogLevel::VERBOSE;
    // Log::debugLogLevel = LogLevel::VERBOSE;

    const char * configName = argv[1];
    const char * outputName = argv[2];
    double vlb = atof(argv[3]);
    double vub = atof(argv[4]);
    bool usePvSolver = argv[5][0] == 'T';

    std::cout << "Configuration filename = " << configName << std::endl;
    std::cout << "Output filename        = " << outputName << std::endl;
    std::cout << "Voltage lower bound    = " << vlb << std::endl;
    std::cout << "Voltage upper bound    = " << vub << std::endl;
    std::cout << "Use PV solver          = " << usePvSolver << std::endl;

    std::ofstream outFile(outputName);

    Simulation sim;
    Parser<Simulation> p;
    p.registerParserPlugin<PvInverterParserPlugin>();
    p.parse(configName, sim);
    SimNetwork& simNetwork = *sim.simComponent<SimNetwork>("network");
    Network& network = *simNetwork.network();
    if (usePvSolver)
    {
        network.setSolver(std::unique_ptr<Sgt::PowerFlowSolverInterface>(new PvDemoSolver));
    }
    sim.initialize();

    for (auto bus : network.busses())
    {
        if (bus->type() != BusType::SL)
        {
            if (vlb > 0)
            {
                bus->setVMagMin(vlb * bus->VBase());
            }
            if (vub > 0)
            {
                bus->setVMagMax(vub * bus->VBase());
            }
        }
        else
        {
            bus->setVMagMin(bus->VBase());
            bus->setVMagMax(bus->VBase());
        }
    }

    std::vector<PvInverter*> invs;
    std::vector<GenAbc*> otherGens;
    for (auto gen : network.gens())
    {
        auto inv = std::dynamic_pointer_cast<PvInverter>(gen);
        if (inv != nullptr)
        {
            invs.push_back(inv.get());
        }
        else
        {
            otherGens.push_back(gen.get());
        }
    }

    auto sumLoad = [&] () {Complex x = 0; for (auto bus : network.busses()) x -= bus->SZip()(0); return x;};
    auto sumGen = [&] () {Complex x = 0; for (auto gen : otherGens) x += gen->S()(0); return x;};
    auto sumInv = [&] () {Complex x = 0; for (auto inv : invs) x += inv->gen()->S()(0); return x;};
    auto minV = [&] () {
        double minV = 100;
        for (auto bus : network.busses())
        {
            double V = network.V2Pu(std::abs(bus->V()(0)), bus->VBase());
            if (V < minV)
            {
                minV = V;
            }
        }
        return minV;
    };
    auto maxV = [&] () {
        double maxV = 0;
        for (auto bus : network.busses())
        {
            double V = network.V2Pu(std::abs(bus->V()(0)), bus->VBase());
            if (V > maxV)
            {
                maxV = V;
            }
        }
        return maxV;
    };

    auto print = [&] () {
        double h = dSeconds(sim.currentTime() - sim.startTime()) / 3600.0;
        Complex SLoad = sumLoad();
        Complex SNormalGen = sumGen();
        Complex SInvGen = sumInv();
        Complex STotGen = SNormalGen + SInvGen;
        Complex VMin = minV();
        Complex VMax = maxV();
        outFile << h << " " << SLoad << " " << STotGen << " " << SNormalGen << " " << SInvGen << " " 
                << VMin << " " << VMax << std::endl;
    };

    while (!sim.isFinished())
    {
        // Flat start:
        for (auto bus : network.busses())
        {
            bus->setV(bus->VNom());
        }

        sim.doTimestep();
        print();
    }
    print();
}
