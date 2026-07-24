# 🌐 Network Flow & BGP Routing (Lab4)

## 🔄 End-to-End Traffic Flow

---

## 🌍 User Request Flow

1. User sends request to:
   - https://www.keyescloudsolutions.com

2. DNS (Route 53) resolves to CloudFront

3. CloudFront routes request to:
   - AWS Application Load Balancer (ALB)

4. ALB forwards traffic to:
   - Private EC2 instances

5. EC2 communicates with:
   - RDS database in Tokyo

---

## 🌐 Cross-Cloud Communication Flow

### AWS → GCP

1. Traffic leaves AWS VPC
2. Routes to Transit Gateway (TGW)
3. Sent through VPN tunnel
4. Enters GCP via HA VPN
5. Routed through NCC to destination VPC

---

### GCP → AWS

1. Traffic originates in GCP VPC
2. Routed to NCC hub
3. Sent over HA VPN
4. Enters AWS via VPN gateway
5. Routed via TGW to target VPC

---

## 🔁 BGP Routing Behavior

- Dynamic route exchange between AWS and GCP
- No static routes required
- Automatic failover if tunnel drops
- Route propagation controlled via TGW and NCC

---

## 🔐 Security Flow

- All traffic encrypted over VPN (IPSec)
- No public exposure of backend systems
- Only CloudFront is publicly accessible
- Internal communication restricted via security groups and firewall rules

---

## 🧪 Validation Steps

### AWS Side
- Check TGW routes:
  ```bash
  aws ec2 search-transit-gateway-routes ...