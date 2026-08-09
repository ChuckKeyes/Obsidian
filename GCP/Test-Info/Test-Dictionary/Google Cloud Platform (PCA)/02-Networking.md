### Carrier Peering

**Definition:**

Carrier Peering allows Internet Service Providers (ISPs) to connect customer traffic to Google's network through a participating carrier. It improves access to **Google's public services** but does **not** provide private connectivity into a VPC.

**PCA Exam Tip:**

If the question says **"ISP," "carrier,"** or **"public Google services,"** the answer is **Carrier Peering**.

---
## Cloud CDN

**Definition:**

Cloud CDN caches website content at Google's global edge locations, reducing latency and improving performance by serving cached content closer to users around the world.

**PCA Exam Tip:**

If the question says **"cache static content globally," "reduce latency,"** or **"speed up website delivery,"** the answer is **Cloud CDN**.

---
## Cloud DNS

**Definition:**

Cloud DNS is Google's highly available and scalable Domain Name System (DNS) service for hosting **public and private DNS zones**.

**PCA Exam Tip:**

If the question says **"manage DNS records," "host DNS zones,"** or **"private DNS,"** the answer is **Cloud DNS**.

---
### Global Multi-Cluster DNS

**Definition:**

Cloud DNS points a single hostname (such as `www.company.com`) to the **Global HTTP(S) Load Balancer's Anycast IP address**. The Global Load Balancer—not DNS—selects the nearest healthy GKE cluster using Google's global network, health checks, and latency-aware routing.

**PCA Exam Tip:**

If the question says:

- **multi-region GKE**
- **lowest latency**
- **global load balancing**
- **kubemci**
- **multi-cluster ingress**

Think:

```
Cloud DNS
      ↓
One Anycast IP
      ↓
Global HTTP(S) Load Balancer
      ↓
Nearest Healthy GKE Cluster
```

---
## Cloud Interconnect

**Definition:**

Cloud Interconnect is Google's family of **private connectivity services**, including **Dedicated Interconnect** and **Partner Interconnect**, providing secure, high-performance connections between on-premises environments and Google Cloud.

**PCA Exam Tip:**

If the question generally asks for **private enterprise connectivity to Google Cloud**, the answer is **Cloud Interconnect**.

---
## Cloud Load Balancer

**Definition:**

Cloud Load Balancer distributes incoming traffic across multiple backend instances, managed instance groups, or GKE services. Google Cloud offers both **regional** and **global** load balancers for HTTP(S), TCP, UDP, and internal workloads.

**PCA Exam Tip:**

If the question says **"distribute traffic across multiple servers"** or **"high availability,"** the answer is **Cloud Load Balancer**.

---
## Cloud VPN

**Definition:**

Cloud VPN creates secure **IPsec-encrypted tunnels** between Google Cloud VPC networks and on-premises networks, branch offices, or other cloud providers over the public internet.

**PCA Exam Tip:**

If the question says **"encrypted connection over the internet,"** the answer is **Cloud VPN**.

---
## Dedicated Interconnect

**Definition:**

Dedicated Interconnect provides a **private, high-bandwidth physical connection** directly between your on-premises data center and Google's network. It supports **10 Gbps and 100 Gbps** connections with low latency and predictable performance.

**PCA Exam Tip:**

If the question says **"direct physical connection," "highest bandwidth,"** or **"low latency private connectivity,"** the answer is **Dedicated Interconnect**.

---

## Direct Peering

**Definition:**

Direct Peering allows organizations to exchange **public internet traffic** directly with Google's edge network, improving access to Google public services. It does **not** provide private VPC connectivity.

**PCA Exam Tip:**

If the question says **"public Google services"** or **"internet peering,"** the answer is **Direct Peering**.

---
## L4 Load Balancer

**Definition:**

A Layer 4 load balancer distributes traffic using network and transport information such as **IP addresses, TCP, UDP, and port numbers**. It does not normally inspect URLs or HTTP headers.

**PCA Exam Tip:**

If the question says **TCP**, **UDP**, **non-HTTP traffic**, or **very high-performance network load balancing**, think **Layer 4**.

---
## L7 Load Balancer

**Definition:**

A Layer 7 load balancer understands application-level traffic such as **HTTP and HTTPS**. It can route requests using URL paths, hostnames, headers, and cookies.

Example:

```
/store   → Store backend
/login   → Authentication backend
/api     → API backend
```

**PCA Exam Tip:**

If the question says **URL path routing**, **host-based routing**, **HTTP headers**, or **HTTPS**, think **Layer 7**.

---
## Global Dynamic Routing

**Definition:**

Global Dynamic Routing enables **Cloud Routers** to advertise and learn routes across **all Google Cloud regions**, allowing hybrid networks to use dynamically learned routes globally.

**PCA Exam Tip:**

If the question says **"share dynamic routes across multiple regions,"** the answer is **Global Dynamic Routing**.

---
## Global Load Balancer

**Definition:**

A Global Load Balancer distributes traffic across backend services in **multiple Google Cloud regions** using a **single global IP address**. It automatically directs users to the closest healthy backend.

**PCA Exam Tip:**

If the question says **"single global IP," "worldwide users,"** or **"cross-region failover,"** the answer is **Global Load Balancer**.

---
## Network Connectivity Center (NCC)

**Definition:**

Network Connectivity Center (NCC) is Google's centralized **hub-and-spoke network management service** that connects Cloud VPNs, Cloud Routers, Interconnects, and VPC networks into a single managed topology.

**PCA Exam Tip:**

If the question says **"hub-and-spoke," "centralized network management,"** or **"multiple hybrid connections,"** the answer is **Network Connectivity Center (NCC)**.

---
## Partner Interconnect

**Definition:**

Partner Interconnect provides **private connectivity** between your on-premises network and Google Cloud through a **Google-approved service provider**. It is intended for organizations that cannot use Dedicated Interconnect.

**PCA Exam Tip:**

If the question says **"service provider," "carrier partner,"** or **"private connection without direct fiber,"** the answer is **Partner Interconnect**.

---
## Private Google Access

**Definition:**

Private Google Access allows **VMs without external IP addresses** to access Google APIs and Google services using **internal IP addresses** over Google's private network.

**PCA Exam Tip:**

If the question says **"private VM accessing Cloud Storage or Google APIs without a public IP,"** the answer is **Private Google Access**.

---
## Private Service Connect (PSC)

**Definition:**

Private Service Connect (PSC) enables private access to Google-managed services and customer-hosted applications across VPC networks and organizations without exposing entire networks. Services are accessed through private endpoints.

**PCA Exam Tip:**

If the question says **"private access to a specific service," "cross-organization services,"** or **"avoid VPC peering,"** the answer is **Private Service Connect**.

---
## Service Directory

**Definition:**

Service Directory is a centralized service registry that enables applications to **register, discover, and locate services** across Google Cloud, hybrid, and multi-cloud environments.

**PCA Exam Tip:**

If the question says **"service discovery"** or **"dynamic service registration,"** the answer is **Service Directory**.

---
## Transfer Appliance

**Definition:**

Transfer Appliance is a secure physical storage device provided by Google for transferring **hundreds of terabytes or petabytes** of on-premises data into Google Cloud when network bandwidth is insufficient.

**PCA Exam Tip:**

If the question says **"ship a storage device," "massive data migration,"** or **"internet connection too slow,"** the answer is **Transfer Appliance**.

---
## VPC Network Peering

**Definition:**

VPC Network Peering privately connects two VPC networks using Google's backbone network. Both VPCs communicate using **internal IP addresses**, but **their subnet IP ranges must not overlap**.

**PCA Exam Tip:**

If the question says **"connect two VPCs privately"** and **"no overlapping IP ranges,"** the answer is **VPC Network Peering**.
