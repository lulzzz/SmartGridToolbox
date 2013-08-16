#include "Network1P.h"
#include "Bus1P.h"
#include "Branch1P.h"
#include "Model.h"
#include <iostream>

namespace SmartGridToolbox
{
   void Network1PParser::parse(const YAML::Node & nd, Model & mod) const
   {
      SGT_DEBUG(debug() << "Network1P : parse." << std::endl);
      const std::string nameStr = nd["name"].as<std::string>();
      Network1P & comp = mod.newComponent<Network1P>(nameStr);
   }

   void Network1P::updateState(ptime t0, ptime t1)
   {
      rebuildNetwork(); // TODO: inefficient to rebuild even if not needed.
      SGT_DEBUG(debug() << "Network1P : update state." << std::endl);
      bool ok = solver_.solve();
      if (ok)
      {
         for (const Bus1PNR * busNR : solver_.getBusses())
         {
            Bus1P * bus = findBus(busNR->id_);
            bus->setV(busNR->V_); // Push the state back onto bus. We don't want to trigger any events.    
         }
      }
   }

   void Network1P::rebuildNetwork()
   {
      SGT_DEBUG(debug() << "Network1P : rebuilding network." << std::endl);
      solver_.reset();
      for (const Bus1P * bus : busVec_)
      {
         solver_.addBus(bus->getName(), bus->getType(), bus->getV(), bus->getY(), bus->getI(), bus->getS());
      }
      for (const Branch1P * branch : branchVec_)
      {
         solver_.addBranch(branch->getBusi().getName(), branch->getBusk().getName(), branch->getY());
      }
      solver_.validate();
   }
}