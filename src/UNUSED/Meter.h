#ifndef METER_DOT_H
#define METER_DOT_H

#include "Component.h"
#include "Load.h"
#include <string>
#include <vector>

namespace SmartGridToolbox
{
   class Meter : public Component, public Load
   {
      // Overridden functions: from Component.
      public:
         virtual Time validUntil() const override {return time() + dt_;}

      private:
         virtual void initializeState() override 
         {
            P_ = Complex(0.0, 0.0);
         }

         virtual void updateState(Time t0, Time t1) override;

      // Overridden functions: from Load.
      public:
         virtual Complex power() const override {return P_;}

      public:
         Meter(const std::string & name) :
            Component(name),
            dt_(posix_time::minutes(5)),
            P_(Complex(0.0, 0.0)) 
         {
            // Empty.
         }

         void addLoadComponent(Component & comp)
         {
            comps_.push_back(&comp);
         }

      private:
         Time dt_;
         Complex P_;
         std::vector<Component *> comps_;
   };
}

#endif // METER_DOT_H