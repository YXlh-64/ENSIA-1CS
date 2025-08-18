* What is the next hop? It is the exit interface through which data packets travel through the network to reach their destinations
* Default route is the entry in the routing table that is used there are no matching routes
* Routing is the process of deciding the next hop, the process of determining which exit interface should a packet take to reach the destination in the fastest way possible
* Setting up and filling the routing table is the initial step of a routing protocol
* In the routing table, if the subnet can be accessed directly from the router, then the next hop can either be represened as direct, or --, or even the interface that is connected to the subnect
*  There are two types of routing:
    * Source based routing: there is no routing table, you decide at the source, it assumes you know the exact IP@ of the routers the packet must traverse, specify the IP addresses of the router the packet must go through 
    * static: manually buidling the routing table, it does not change unless the admin does not remove it (today's lab)
    * dynamic: there will be a protocol that do the routing:
        * Vector based: RIP(determine the interfaces that it is immediately connected to, share it with the next hops so that the hops know they can reach those interfaces in one hop), EIGRP
        * Link State: they look at the link quality, the one with the best bandwidth will be the one chosen, it might also be measured in terms of reliability. It is adaptive, they automatically broadcast 


bauds is the number of symbols per second, 72000 bauds means 72000 bytes per second (if for example a symbol is represented as 1 Byte) or 72000 symbols per second
baud = sps (signal per second)


DCE dictates the speed (datarate) at which 
DCE and DTE have the master slave architecture


* Forwarding refers to the router-local action of transferring a packet from an input link interface to the appropriate output link interface, it is time critical and thus implemented in hardware -> routing table
* Routing is the network-wide process to determine the end-to-end paths that packets take from take from source to destination, not time critical, and thus implemented in the sorftware -> forwarding table




## NAT:
* The router is what assigns private IP addresses to the nodes in the same LAN
* 