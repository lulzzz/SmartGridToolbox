#ifndef NETWORK_COMPONENT_DOT_H
#define NETWORK_COMPONENT_DOT_H

#include "Common.h"
#include "Socket.h"
#include <vector>

namespace SmartGridToolbox
{
   /// Interface class for hooking together objects in a power network.
   class NetworkComponent
   {
      public:
         NetworkComponent(Network & network);
      private:
         std::vector<Socket *> sockets_;
   };
}

#endif // NETWORK_COMPONENT_DOT_H