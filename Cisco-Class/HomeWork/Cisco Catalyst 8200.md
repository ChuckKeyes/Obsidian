
## 1️⃣ Base System Setup (Required First)

`enable 
configure terminal 
hostname CAT8200-EDGE 
no ip domain-lookup  

ip domain-name lab.local 
crypto key generate rsa modulus 2048  

username admin privilege 15 secret Cisco123! 
enable secret Cisco123!  

line vty 0 4  
	login local  
	transport input ssh`

---

## 2️⃣ Interface & IP Addressing

### WAN Interface

`interface GigabitEthernet0/0/0  
description WAN-to-ISP  
ip address 203.0.113.2 255.255.255.252  
no shutdown`

### LAN Interface (Routed)

`interface GigabitEthernet0/0/1  
description LAN-Routed  
ip address 10.10.10.1 255.255.255.0  
no shutdown`

---

## 3️⃣ OSPF Configuration (IGP #1)

`router ospf 10  
	router-id 1.1.1.1  
	network 10.10.10.0 0.0.0.255 area 0  
	network 203.0.113.0 0.0.0.3 area 0`

✅ Used for:

- Campus routing    
- Fast convergence    
- Multi-area designs
    

---

## 4️⃣ EIGRP Configuration (IGP #2)

`router eigrp 100  
	network 10.10.10.0 0.0.0.255  
	network 203.0.113.0 0.0.0.3  
	no auto-summary`

✅ Used for:

- Cisco-heavy environments    
- Simple metric tuning
    

⚠️ **In production, don’t run OSPF and EIGRP together unless redistributing** (we’ll cover that later if you want).

---

## 5️⃣ BGP Configuration (Edge / Cloud / ISP)

### Basic eBGP

`router bgp 65001  
	bgp log-neighbor-changes  
	neighbor 203.0.113.1 remote-as 65000
	   
	network 10.10.10.0 mask 255.255.255.0`

### Typical Cloud Use Cases

- AWS VGW / TGW    
- Azure VPN Gateway    
- GCP Cloud Router    
- MPLS provider edge    

The **C8200 supports BGP at massive scale** (up to millions of routes with memory upgrades)

cat8200-series

.

---

## 6️⃣ IPsec VPN with BGP (Classic Site-to-Site)

### IKE Phase 1

`crypto isakmp policy 10  
	encr aes 256  
	hash sha256  
	authentication pre-share  
	group 14  
	lifetime 86400
	  
	crypto isakmp key CiscoVPN123 address 203.0.113.1`

### IPsec Phase 2

`crypto ipsec transform-set TS esp-aes 256 esp-sha-hmac`

### Tunnel Interface (Recommended)

`interface Tunnel0  
	ip address 169.254.100.1 255.255.255.252  
	tunnel source GigabitEthernet0/0/0  
	tunnel destination 203.0.113.1  
	tunnel mode ipsec ipv4  
	tunnel protection ipsec profile IPSEC-PROFILE`

### Run BGP Over Tunnel

`router bgp 65001  
	neighbor 169.254.100.2 remote-as 65002`

This is **exactly how cloud VPNs work** (AWS, Azure, GCP).

---

## 7️⃣ Layer-2 Switching + STP (Via NIM)

If you install a **LAN switch NIM**, the C8200 supports **full STP**

cat8200-series

.

### Enable VLANs

`vlan 10  
	name USERS 
vlan 20  
	name SERVERS`

### Access Ports

`interface GigabitEthernet1/0/1  
	switchport mode access  
	switchport access vlan 10`

### Trunk Port

`interface GigabitEthernet1/0/8  
	switchport mode trunk`

### STP Configuration

`spanning-tree mode rapid-pvst 
	spanning-tree vlan 10,20 priority 4096`

✅ STP protects you from:

- Loops    
- Broadcast storms    
- Accidental switch miswiring    

---

## 8️⃣ Verification Commands (EXAM & REAL LIFE)

`show ip route 
show ip ospf neighbor 
show ip eigrp neighbors 
show ip bgp summary 
show crypto isakmp sa 
show crypto ipsec sa 
show spanning-tree

`
1️⃣ Physical / Edge Topology (Cisco Canonical)
                     ┌─────────────────────────┐
                     │        Internet / ISP    │
                     │        (eBGP ASN 65000)  │
                     └───────────┬─────────────┘
                                │
                        203.0.113.0/30
                                │
                   Gi0/0/0 ┌──────┴──────┐
                           │  CATALYST   │
                           │   8200      │
                           │ EDGE ROUTER │
                           └──────┬──────┘
                                │
                        Gi0/0/1    │ 10.10.10.1/24
                                |
                   ┌──────────────┴──────────────┐
                   │          LAN / CAMPUS                  │
                   │   Users • Servers • Access            │
                   └─────────────────────────────┘

2️⃣ Routing + VPN + Cloud (Exam-Grade Diagram)
              ┌────────────────────────────────────┐
              │            CLOUD / DC                                  │
              │   AWS / GCP / Azure / Remote Site          │
              │   BGP ASN 65002                                      │
              └──────────────┬─────────────────────┘
                             │
                   IPsec VPN │  Tunnel0
                   169.254.100.0/30
                             │
                ┌────────────┴────────────┐
                │     CATALYST 8200                │
                │                                              │
                │  • BGP (65001)                      │
                │  • OSPF (Process 10)             │
                │  • EIGRP (AS 100)                  │
                │  • IPsec VPN                          │
                │                                              │
                └────────────┬────────────┘
                             │
                       Internal Routing
                             │
                 ┌───────────┴───────────┐
                 │      LAN NETWORKS         │
                 │ 10.10.10.0/24                   │
                 │ 10.20.20.0/24                   │
                 └───────────────────────┘

4️⃣ Combined “Full Credit” Cisco Diagram
                 ┌──────────────┐
                 │   Internet          │
                 │   ISP BGP          │
                 └──────┬───────┘
                        │
                ┌───────┴────────┐
                │  CATALYST 8200   │
                │----------------      │
                │ BGP 65001           │◄───► Cloud / DC (BGP 65002)
                │ IPsec VPN            │
                │ OSPF / EIGRP       │
                │ STP Root              │
                └───────┬────────┘
                        │
                ┌───────┴────────┐
                │   LAN / VLANs     │
                │  Users Servers      │
                └────────────────┘
