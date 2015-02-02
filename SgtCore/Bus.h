#ifndef BUS_DOT_H
#define BUS_DOT_H

#include <SgtCore/Common.h>
#include <SgtCore/Component.h>
#include <SgtCore/Event.h>
#include <SgtCore/PowerFlow.h>

#include<iostream>
#include<map>
#include<vector>

namespace SmartGridToolbox
{
   /// @brief A Bus is a grouped set of conductors / terminals, one per phase.
   class Bus : public Component, public HasProperties<Bus>
   {
      friend class Network;

      public:

         SGT_PROPS_INIT(Bus);
         SGT_PROPS_INHERIT(Bus, Component);

      /// @name Static member functions:
      /// @{
         
         static const std::string& sComponentType()
         {
            static std::string result("bus");
            return result;
         }
      
      /// @}

      /// @name Lifecycle:
      /// @{

         Bus(const std::string& id, const Phases& phases, const arma::Col<Complex>& VNom, double VBase);

      /// @}

      /// @name ComponentInterface virtual overridden functions.
      /// @{
        
         virtual const std::string& componentType() const override
         {
            return sComponentType();
         }

         virtual void print(std::ostream& os) const override;

      /// @}

      /// @name Basic identity and type:
      /// @{

         virtual const Phases& phases() const
         {
            return phases_;
         }

         SGT_PROP_GET(phases, Bus, Phases, GetByConstRef, phases);

         virtual arma::Col<Complex> VNom() const
         {
            return VNom_;
         }

         SGT_PROP_GET(VNom, Bus, arma::Col<Complex>, GetByVal, VNom);

         virtual double VBase() const
         {
            return VBase_;
         }

         SGT_PROP_GET(VBase, Bus, double, GetByVal, VBase);

      /// @}

      /// @name Control and limits:
      /// @{

         virtual BusType type() const
         {
            return type_;
         }

         virtual void setType(const BusType type)
         {
            type_ = type;
            setpointChanged_.trigger();
         }

         SGT_PROP_GET_SET(type, Bus, BusType, GetByVal, type, setType);

         virtual arma::Col<double> VMagSetpoint() const
         {
            return VMagSetpoint_;
         }

         virtual void setVMagSetpoint(const arma::Col<double>& VMagSetpoint)
         {
            VMagSetpoint_ = VMagSetpoint;
            setpointChanged_.trigger();
         }
         
         virtual arma::Col<double> VAngSetpoint() const
         {
            return VAngSetpoint_;
         }

         virtual void setVAngSetpoint(const arma::Col<double>& VAngSetpoint)
         {
            VAngSetpoint_ = VAngSetpoint;
            setpointChanged_.trigger();
         }

         virtual void applyVSetpoints();

         virtual double VMagMin() const
         {
            return VMagMin_;
         }

         virtual void setVMagMin(double VMagMin)
         {
            VMagMin_ = VMagMin;
            setpointChanged_.trigger();
         }

         virtual double VMagMax() const
         {
            return VMagMax_;
         }

         virtual void setVMagMax(double VMagMax)
         {
            VMagMax_ = VMagMax;
            setpointChanged_.trigger();
         }

      /// @}

      /// @name State
      /// @{

         virtual bool isInService() const
         {
            return isInService_;
         }

         virtual void setIsInService(bool isInService)
         {
            isInService_ = isInService;
            isInServiceChanged_.trigger();
         }

         SGT_PROP_GET_SET(isInService, Bus, bool, GetByVal, isInService, setIsInService);

         virtual const arma::Col<Complex>& V() const
         {
            return V_;
         }

         virtual void setV(const arma::Col<Complex>& V)
         {
            V_ = V;
            voltageUpdated_.trigger();
         }

      /// @}
      
      /// @name Events.
      /// @{
         
         /// @brief Event triggered when I go in or out of service.
         virtual Event& isInServiceChanged()
         {
            return isInServiceChanged_;
         }

         /// @brief Event triggered when bus setpoint has changed.
         virtual Event& setpointChanged()
         {
            return setpointChanged_;
         }
         
         /// @brief Event triggered when bus state (e.g. voltage) has been updated.
         virtual Event& voltageUpdated()
         {
            return voltageUpdated_;
         }
      
      /// @}
     
      private:

         Phases phases_{Phase::BAL};
         arma::Col<Complex> VNom_;
         double VBase_{1.0};

         BusType type_{BusType::NA};
         arma::Col<double> VMagSetpoint_;
         arma::Col<double> VAngSetpoint_;
         double VMagMin_{-infinity};
         double VMagMax_{infinity};

         bool isInService_{true};
         arma::Col<Complex> V_;

         Event isInServiceChanged_{std::string(sComponentType()) + " : Is in service changed"};
         Event setpointChanged_{std::string(sComponentType()) + " : Setpoint changed"};
         Event voltageUpdated_{std::string(sComponentType()) + " : Voltage updated"};
   };
}

#endif // BUS_DOT_H
