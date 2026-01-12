
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

##########################################################################
##########################################################################
##########################################################################
1)  (inventory.yml)
		all:
		  children:
		    c8200:
		      hosts:
		        cat8200-edge:
		          ansible_host: 10.10.10.10   # management IP of the router
		          ansible_user: admin
		          ansible_password: "{{ vault_router_password }}"
		          ansible_network_os: cisco.ios.ios
		          ansible_connection: ansible.netcommon.network_cli
		          ansible_become: true
		          ansible_become_method: enable
		          ansible_become_password: "{{ vault_enable_password }}"

2) **Variables (group_vars/c8200.yml)**
		
		
hostname: CAT8200-EDGE
domain_name: lab.local

# Interfaces
wan_intf: GigabitEthernet0/0/0
wan_desc: WAN-to-ISP
wan_ip: 203.0.113.2
wan_mask: 255.255.255.252

lan_intf: GigabitEthernet0/0/1
lan_desc: LAN-Routed
lan_ip: 10.10.10.1
lan_mask: 255.255.255.0

# Routing
ospf_process: 10
ospf_router_id: 1.1.1.1
ospf_networks:
  - { prefix: "10.10.10.0", wildcard: "0.0.0.255", area: 0 }
  - { prefix: "203.0.113.0", wildcard: "0.0.0.3", area: 0 }

eigrp_as: 100
eigrp_networks:
  - { prefix: "10.10.10.0", wildcard: "0.0.0.255" }
  - { prefix: "203.0.113.0", wildcard: "0.0.0.3" }

bgp_asn: 65001
bgp_isp_neighbor: 203.0.113.1
bgp_isp_asn: 65000
bgp_advertise: "10.10.10.0"
bgp_advertise_mask: "255.255.255.0"

# VPN / Tunnel
tunnel_intf: Tunnel0
tunnel_ip: 169.254.100.1
tunnel_mask: 255.255.255.252
tunnel_dest: 203.0.113.1
bgp_tunnel_neighbor: 169.254.100.2
bgp_tunnel_neighbor_asn: 65002

# L2 / STP (if you have a switch NIM)
vlan_users: 10
vlan_servers: 20
access_intf: GigabitEthernet1/0/1
trunk_intf: GigabitEthernet1/0/8

3) **Vault variables (group_vars/all/vault.yml)**
	vault_router_password: "REPLACE_ME"
	vault_enable_password: "REPLACE_ME"
	vault_local_user_secret: "REPLACE_ME"
	vault_vpn_psk: "REPLACE_ME"

4) **Main playbook (playbook.yml)**
###### yaml

- name: Configure Cisco Catalyst 8200 (BGP, OSPF, EIGRP, IPsec, STP)
  hosts: c8200
  gather_facts: no
  collections:
    - cisco.ios

  tasks:
    # -----------------------------
    # 1) Base System Setup
    # -----------------------------
    - name: Set hostname + domain name + disable DNS lookup
      ios_config:
        lines:
          - "hostname {{ hostname }}"
          - "no ip domain-lookup"
          - "ip domain-name {{ domain_name }}"

    - name: Create local admin user (best practice: use vault secret)
      ios_config:
        lines:
          - "username admin privilege 15 secret {{ vault_local_user_secret }}"

    - name: Set enable secret (best practice: use vault secret)
      ios_config:
        lines:
          - "enable secret {{ vault_enable_password }}"

    - name: Configure VTY for SSH login local
      ios_config:
        parents: ["line vty 0 4"]
        lines:
          - "login local"
          - "transport input ssh"

    - name: Generate RSA keys (runs if keys missing)
      ios_command:
        commands:
          - "show crypto key mypubkey rsa"
      register: rsa_keys

    - name: Create RSA keys if not present
      ios_config:
        lines:
          - "crypto key generate rsa modulus 2048"
      when: "'% Key pair was generated' not in (rsa_keys.stdout[0] | default('')) and 'key' not in (rsa_keys.stdout[0] | lower)"

    # -----------------------------
    # 2) Interfaces (WAN + LAN)
    # -----------------------------
    - name: Configure WAN/LAN interface descriptions + admin up
      ios_interfaces:
        config:
          - name: "{{ wan_intf }}"
            description: "{{ wan_desc }}"
            enabled: true
          - name: "{{ lan_intf }}"
            description: "{{ lan_desc }}"
            enabled: true
        state: merged

    - name: Configure WAN/LAN IPv4 addresses
      ios_l3_interfaces:
        config:
          - name: "{{ wan_intf }}"
            ipv4:
              - address: "{{ wan_ip }}/30"
          - name: "{{ lan_intf }}"
            ipv4:
              - address: "{{ lan_ip }}/24"
        state: merged

    # -----------------------------
    # 3) OSPF
    # -----------------------------
    - name: Configure OSPF v2 (classic IOS config style)
      ios_config:
        parents: ["router ospf {{ ospf_process }}"]
        lines:
          - "router-id {{ ospf_router_id }}"
          - "network 10.10.10.0 0.0.0.255 area 0"
          - "network 203.0.113.0 0.0.0.3 area 0"

    # -----------------------------
    # 4) EIGRP
    # -----------------------------
    - name: Configure EIGRP (classic)
      ios_config:
        parents: ["router eigrp {{ eigrp_as }}"]
        lines:
          - "network 10.10.10.0 0.0.0.255"
          - "network 203.0.113.0 0.0.0.3"
          - "no auto-summary"

    # -----------------------------
    # 5) BGP (ISP + advertise LAN)
    # -----------------------------
    - name: Configure BGP (classic)
      ios_config:
        parents: ["router bgp {{ bgp_asn }}"]
        lines:
          - "bgp log-neighbor-changes"
          - "neighbor {{ bgp_isp_neighbor }} remote-as {{ bgp_isp_asn }}"
          - "network {{ bgp_advertise }} mask {{ bgp_advertise_mask }}"

    # -----------------------------
    # 6) IPsec + Tunnel + BGP over Tunnel
    # -----------------------------
    - name: Configure IKEv1 policy + PSK (classic)
      ios_config:
        lines:
          - "crypto isakmp policy 10"
          - " encr aes 256"
          - " hash sha256"
          - " authentication pre-share"
          - " group 14"
          - " lifetime 86400"
          - "crypto isakmp key {{ vault_vpn_psk }} address {{ tunnel_dest }}"

    - name: Configure IPsec transform-set (classic)
      ios_config:
        lines:
          - "crypto ipsec transform-set TS esp-aes 256 esp-sha-hmac"

    - name: Configure IPsec profile (minimal example)
      ios_config:
        lines:
          - "crypto ipsec profile IPSEC-PROFILE"
          - " set transform-set TS"

    - name: Configure Tunnel0 interface (IPsec VTI)
      ios_config:
        parents: ["interface {{ tunnel_intf }}"]
        lines:
          - "ip address {{ tunnel_ip }} {{ tunnel_mask }}"
          - "tunnel source {{ wan_intf }}"
          - "tunnel destination {{ tunnel_dest }}"
          - "tunnel mode ipsec ipv4"
          - "tunnel protection ipsec profile IPSEC-PROFILE"

    - name: Add BGP neighbor over Tunnel
      ios_config:
        parents: ["router bgp {{ bgp_asn }}"]
        lines:
          - "neighbor {{ bgp_tunnel_neighbor }} remote-as {{ bgp_tunnel_neighbor_asn }}"

    # -----------------------------
    # 7) VLANs + L2 ports + STP (only if switch ports exist)
    # -----------------------------
    - name: Create VLANs 10 and 20
      ios_vlans:
        config:
          - vlan_id: "{{ vlan_users }}"
            name: USERS
          - vlan_id: "{{ vlan_servers }}"
            name: SERVERS
        state: merged

    - name: Configure access port (VLAN 10)
      ios_l2_interfaces:
        config:
          - name: "{{ access_intf }}"
            mode: access
            access:
              vlan: "{{ vlan_users }}"
        state: merged

    - name: Configure trunk port
      ios_l2_interfaces:
        config:
          - name: "{{ trunk_intf }}"
            mode: trunk
        state: merged

    - name: Configure STP (Rapid-PVST + root priority)
      ios_config:
        lines:
          - "spanning-tree mode rapid-pvst"
          - "spanning-tree vlan {{ vlan_users }},{{ vlan_servers }} priority 4096"

    # -----------------------------
    # 8) Verification (show commands)
    # -----------------------------
    - name: Verification show commands
      ios_command:
        commands:
          - "show ip route"
          - "show ip ospf neighbor"
          - "show ip eigrp neighbors"
          - "show ip bgp summary"
          - "show crypto isakmp sa"
          - "show crypto ipsec sa"
          - "show spanning-tree"
      register: verify

    - name: Print verification output
      debug:
        var: verify.stdout


![[Ansible-Architecture.gif]]
![[Cisco-8200.jpg]]


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
