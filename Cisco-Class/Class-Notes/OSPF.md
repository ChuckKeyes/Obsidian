[Tom G CCIE Blog: Image](https://ccie4all.wordpress.com/wp-content/uploads/2013/01/ospf-lsas-and-area-types.jpg)

[Why do we need OSPF? | NetworkAcademy.IO](https://www.networkacademy.io/ccna/ospf/why-do-we-need-ospf)


[OSPF LSA Types Explained](https://networklessons.com/ospf/ospf-lsa-types-explained)

OSPF uses eight different **LSA types** (Link State Advertisements) to build its **LSDB** (Link State Database) and share routing information between routers. Each LSA type has a specific purpose and flooding scope where it is flooded only within or between areas. In this lesson, we’ll take a look at the different LSA types and I’ll show you how to identify them on Cisco IOS routers.

## LSA Types Overview

Let’s start with an overview of all LSA types:

|   |   |
|---|---|
|LSA Type 1:|Router LSA|
|LSA Type 2:|Network LSA|
|LSA Type 3:|Summary LSA|
|LSA Type 4:|Summary ASBR LSA|
|LSA Type 5:|Autonomous system external LSA|
|LSA Type 6:|Multicast OSPF LSA|
|LSA Type 7:|Not-so-stubby area LSA|
|LSA Type 8:|External attribute LSA for BGP|

For many students, visualizing helps them understand and remember. I like to visualize OSPF LSAs as jigsaw puzzle pieces. One jigsaw means nothing, but all of them together give us the total picture…for OSPF, this is the LSDB.