
## 1) Local value: your public app name (FQDN)

- **`local.chewbacca_fqdn = "${var.app_subdomain}.${var.domain_name}"`**
    
- Builds the exact DNS name your certificate and users will use (example: `bonus-b.keyescloudsolutions.com`).
    

---

## 2) Security controls around the Load Balancer + EC2

### A) ALB Security Group (internet-facing door)

- **`aws_security_group.chewbacca_alb_sg01`**
    
- Intended to allow:
    
    - **Inbound**: `80/443` from the internet (`0.0.0.0/0`) _(TODO in your file)_
        
    - **Outbound**: to the private EC2 app port (commonly `80`) _(TODO in your file)_
        

### B) Private EC2 only accepts traffic from the ALB

- **`aws_security_group_rule.chewbacca_ec2_ingress_from_alb01`**
    
- Adds an **ingress rule on the EC2 SG**: allow **TCP 80** only if the source is **the ALB SG**.
    
- This is the key “private instance stays private” rule: **no direct public access to EC2**.
    

---

## 3) Public Application Load Balancer (ALB)

- **`aws_lb.chewbacca_alb01`**
    
- Creates an **internet-facing ALB** (`internal = false`)
    
- Places it into **public subnets** (`aws_subnet.chewbacca_public_subnets[*].id`)
    
- Attaches the ALB security group so it can receive public web traffic.
    

---

## 4) Target Group + attach the private EC2

### A) Target Group (where the ALB forwards traffic)

- **`aws_lb_target_group.chewbacca_tg01`**
    
- Defines the backend target type/list on **HTTP port 80**
    
- Adds an ALB **health check** (path `/`, expects `200-399`)
    

### B) Attach your private EC2 into the target group

- **`aws_lb_target_group_attachment.chewbacca_tg_attach01`**
    
- Registers **`aws_instance.chewbacca_ec201_private_bonus`** as a backend target on port **80**
    
- This is what makes the ALB actually forward to your private VM.
    

---

## 5) TLS/HTTPS certificate (ACM)

### A) Request a certificate for your FQDN

- **`aws_acm_certificate.chewbacca_acm_cert01`**
    
- Requests an ACM cert for `local.chewbacca_fqdn`
    
- Uses `validation_method = var.certificate_validation_method` (often `DNS`)
    

### B) Validate the certificate

- **`aws_acm_certificate_validation.chewbacca_acm_validation01`**
    
- Completes validation **after** you add the Route53 DNS validation records _(your code notes this as TODO)_
    

**Why it matters:** ALB **HTTPS won’t work** until ACM validation completes.

---

## 6) ALB listeners (how traffic flows)

### A) HTTP listener (80) redirects to HTTPS

- **`aws_lb_listener.chewbacca_http_listener01`**
    
- Every HTTP request gets a **301 redirect** to **HTTPS:443**
    

### B) HTTPS listener (443) terminates TLS and forwards to targets

- **`aws_lb_listener.chewbacca_https_listener01`**
    
- Uses a modern TLS policy (`ELBSecurityPolicy-TLS13-1-2-2021-06`)
    
- Uses the ACM validated cert
    
- **Forwards traffic** to `chewbacca_tg01`
    

**Resulting user flow:**  
`Internet → ALB:80 → redirect → ALB:443 (TLS ends here) → Target Group → Private EC2:80`

---

## 7) Optional WAFv2 protection (managed rules)

### A) Create a Web ACL (only if enabled)

- **`aws_wafv2_web_acl.chewbacca_waf01` with `count = var.enable_waf ? 1 : 0`**
    
- Default action is **allow**
    
- Adds AWS managed rule group **CommonRuleSet**
    
- Enables CloudWatch metrics + sampled requests
    

### B) Associate WAF to the ALB

- **`aws_wafv2_web_acl_association.chewbacca_waf_assoc01`**
    
- Attaches the Web ACL to the ALB ARN
    

**Why it matters:** blocks a bunch of common web attacks/noise _before_ it hits your app.

---

## 8) Monitoring + alerting for ALB errors

### A) CloudWatch alarm: ALB 5XX spikes → SNS notify

- **`aws_cloudwatch_metric_alarm.chewbacca_alb_5xx_alarm01`**
    
- Watches `AWS/ApplicationELB` → `HTTPCode_ELB_5XX_Count`
    
- If it exceeds your threshold for enough periods → triggers:
    
    - **`alarm_actions = [aws_sns_topic.chewbacca_sns_topic01.arn]`**
        

_(SNS topic is referenced here—so it must exist in another file / earlier module.)_

### B) CloudWatch dashboard (starter HUD)

- **`aws_cloudwatch_dashboard.chewbacca_dashboard01`**
    
- Creates a dashboard with widgets for:
    
    - `RequestCount`
        
    - `HTTPCode_ELB_5XX_Count`
        
    - `TargetResponseTime`
        

---

## Bonus-B in one sentence

**Bonus-B builds a public, HTTPS-secured ALB that forwards traffic to a private EC2 instance, optionally shields it with WAF, and adds CloudWatch alarms + a dashboard so you can see traffic and get alerted on failures.**