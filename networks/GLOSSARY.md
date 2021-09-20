# Glossary

<!-- Actual glossary -->

- [Autonomous System (AS)](#autonomous-system-as)
- [Border Gateway Protocol (BGP)](#border-gateway-protocol-bgp)
- [Bridging](#bridging)
- [Gateway](#gateway)
- [Internet Backbone](#internet-backbone)
- [Internet Exchange Point (IXP)](#internet-exchange-point-ixp)
- [Internet Service Provider (ISP)](#internet-service-provider-isp)
- [Peering](#peering)
- [Point of Presence (POP)](#point-of-presence-pop)
- [Router](#router)
- [Routing](#routing)
- [Switch](#switch)
- [Transit](#transit)

<!-- End actual glossary -->

<!-- Glossary definitions -->

## Autonomous System (AS)

An AS is a group of [gateways](#gateway) (routers) that are under the same administrative control,
that is, belong to the same organization.
An AS represents a connected group of one or more blocks of IP addresses, called **IP prefixes**,
that have been assigned to that organization

## Border Gateway Protocol (BGP)

BGP is the routing protocol of the Internet: it has to find all of the routes
that the Internet has and carry them around the world.
BGP looks at routing as big picture: it doesn't have the time to really look
at individual routers, it rather looks at [Autonomous Systems](#autonomous-system-as)
(hundreds of routers inside each AS).
The peering agreements between all of AS is an explicit relationship:
peers have to be defined between [Edge Routers](#router).

## Bridging

A network bridge is a computer networking device that creates a single aggregate network
from multiple communication networks or network segments. This function is called network bridging.
Bridging is distinct from routing. Routing allows multiple networks to communicate independently
and yet remain separate, whereas bridging connects two separate networks as if they were a single network.
In the OSI model, bridging is performed in the data link layer (layer 2).

## Gateway

A gateway is a piece of networking hardware used in telecommunications for telecommunications
networks that allows data to flow from one discrete network to another.
Gateways are distinct from [routers](#router) or [switches](#switch) in that they communicate using more
than one protocol to connect a bunch of networks and can operate at any of
the seven layers of the open systems interconnection model (OSI).

## Internet Backbone

The Internet backbone may be defined by the principal data routes between large,
strategically interconnected computer networks and core routers of the Internet.
These data routes are hosted by commercial, government, academic and other
high-capacity network centers, the Internet exchange points and network access
points, that exchange Internet traffic between the countries, continents, and
across the oceans. Internet service providers, often Tier 1 networks,
participate in Internet backbone traffic by privately negotiated interconnection
agreements, primarily governed by the principle of settlement-free peering.

The Internet, and consequently its backbone networks, do not rely on central
control or coordinating facilities, nor do they implement any global network
policies. The resilience of the Internet results from its principal architectural
features, most notably the idea of placing as few network state and control
functions as possible in the network elements and instead relying on the
endpoints of communication to handle most of the processing to ensure data
integrity, reliability, and authentication. In addition, the high degree of
redundancy of today's network links and sophisticated real-time routing protocols
provide alternate paths of communications for load balancing and congestion avoidance.
The largest providers, known as Tier 1 providers, have such comprehensive networks
that they do not purchase transit agreements from other providers.
As of 2019, there are six Tier 1 providers in the telecommunications industry:
CenturyLink (Level 3), Telia Carrier, NTT, GTT, Tata Communications, and Telecom Italia.

## Internet Exchange Point (IXP)

An IXP is the physical infrastructure through which [Internet service providers](#internet-service-provider-isp)
exchange Internet traffic between their networks ([autonomous systems](#autonomous-system-as)).

Imagine the following scenario (POP stands for [Point of Presence](#point-of-presence-pop)):

- there is a POP in Los Angeles, held by ISP X, which connects all of its computers in Los Angeles;

- there is a POP in Chicago, held by the *same* ISP X, which connects all of its computers in Chicago.

If Los Angeles POP wants to communicate to Chicago POP, both POPs must be connected
to each other with fiber optic cables.
ISP X is going to use these cables to connect its POPs all across the country.
What if a computer in Los Angeles (whose POP belongs to ISP X) wants to communicate with another
computer in Chicago whose POP belongs to *another* ISP (say ISP Y)?
In an IXP, fiber optic cables belonging to ISP X come together with fiber optic cables
belonging to ISP Y: without IXP, you could always access computers across all country,
but these computers would be connected only to your *same* ISP.
Now, with IXPs established all over the country, *any* ISP in all country can contact *any other*
ISP

## Internet Service Provider (ISP)

An ISP is an organization that provides services for accessing, using, or participating in the Internet.
Internet service providers can be organized in various forms, such as commercial, community-owned,
non-profit, or otherwise privately owned.
Internet services typically provided by ISPs include Internet access, Internet transit,
domain name registration, web hosting, ..., .

## Peering

Peering is an exchange of traffic which is mutually beneficial: since the
benefit is roughly equal to both parties, there's no exchange of money.
Peering is performed in [Internet Exchange Point](#internet-exchange-point-ixp).

## Point of Presence (POP)

A POP is an Access Point provided by your ISP that connects to the rest of the Internet.
When you type in where you'd like to go on the Internet, your router sends out a signal
to the POP which then routes it to where it needs to go: this signal is then going to
bounce around to other routers until it finally reaches its destination.
Then the destination router sends it back through to your router.

## Router

A router is a networking device that forwards data packets between computer networks.
Routers perform the traffic directing functions on the Internet. [...]
A router is connected to two or more data lines from different IP networks
(as opposed to a network [switch](#switch), which connects data lines from one single network).
When a data packet comes in on one of the lines, the router reads the network address
information in the packet header to determine the ultimate destination.
Then, using information in its routing table or routing policy, it directs the packet
to the next network on its journey.

A Core Router (CR) is placed at the edge of an ISP network: CR uses Exterior
Border Gateway Protocol to router at other ISPs or large enterprise Autonomous
Systems.

## Routing

Routing is the process of selecting a path for traffic in a network or between
or across multiple networks

## Switch

A network switch is networking hardware that connects devices on a computer network
by using packet switching to receive and forward data to the destination device.
A network switch is a multiport network [bridge](#bridging) that uses MAC addresses to forward data
at the data link layer (layer 2) of the OSI model.
Switch is designed to connect computers within the *same* network.

## Transit

Transit is a service where a network allows traffic to pass through their network
to the rest of the Internet (this is a chargeable service).
A transit customer pays the network for this service, and the network *may* in
turn need to buy transit from another large network to have connectivity to the
whole Internet: the end users of an ISP are transit customers.
Transit is a supplier/consumer relationship.
Large backbone providers sell transit to smaller ISPs and these smaller ISPs sell
transit to their own customers.
If two ISPs have a reasonable amount of traffic from ISP X customers to ISP Y
network and viceversa, then the two ISPs can decide to [peer](#peering) with
each other, as a local [Internet Exchange Point](#internet-exchange-point-ixp):
this means that the traffic between ISP X and ISP Y flows directly saving them
both money on their respective transit links.
It's very important that the agreement between ISP X and ISP Y is enforced: eg,
ISP X should *not* be able to route traffic through ISP Y to the rest of the
Internet because ISP X would effectively be stealing ISP Y upstream bandwidth.
[Border Gateway Protocol](#border-gateway-protocol-bgp) is used to implement
the agreed policy, which says that traffic from ISP X can reach ISP Y network,
by the IXP, but cannot transit through ISP Y to reach anything else; same from
ISP Y to ISP X.
Larger backbone providers may peer with each others too: if these backbone
providers are of similar size and so it's of equal benefit to them, they
*may* peer with each other traffic, exchanging traffic between all their
customers networks at no cost.
While most backbone providers have to buy some transit to guarantee that
they can reach all of the Internet, there is a very small number of large
networks at the top, known as [Tier 1], who peer with each other and can
reach the whole Internet *without buying transit from anyone else*.

## TUN/TAP

They are kernel virtual network devices. They are entirely supported in software.
They can't be used together because they send and receive packets at different
layers of network stacks.
TUN simulates a network layer device and carries IP packets;
TAP simulates a link layer device and carries Ethernet frames.
TUN is used with routing;
TAP can be used to create user space network device.
They are both used for tunneling purposes.

<!-- End glossary definitions -->
