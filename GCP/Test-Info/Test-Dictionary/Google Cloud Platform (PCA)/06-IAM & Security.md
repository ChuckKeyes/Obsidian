
## Firebase Authentication

**Definition:**

Firebase Authentication is an identity service for mobile and web applications. It supports sign-in using email and password, phone numbers, and identity providers such as Google, Apple, Facebook, and GitHub.

**PCA Exam Tip:**

If the question says **authenticate customers of a mobile or web application**, think **Firebase Authentication** or **Identity Platform**, depending on the scale and enterprise requirements.
## IAM (Identity and Access Management)

**Definition:** Controls who (users, groups, and service accounts) can access Google Cloud resources and what actions they are allowed to perform using IAM roles and permissions.

---
## Sensitive Data Loss Protection (Cloud DLP)

**Definition:** Discovers, classifies, masks, and protects sensitive information such as credit card numbers, Social Security numbers, and personal data.

---
## Customer-Managed Encryption Keys (CMEK)

**Definition:** Allows customers to control and manage the encryption keys used to protect their cloud data through Cloud KMS.

---
## Cloud Key Management Service (Cloud KMS)

**Definition:** A managed service for creating, storing, rotating, and controlling encryption keys used to encrypt Google Cloud resources and applications.

---
## Security Command Center Premium (SCC Premium)

**Definition:** Google's enterprise security platform that detects vulnerabilities, threats, misconfigurations, malware, and compliance issues across Google Cloud resources.

---
## Workload Identity Federation

**Definition:** Allows applications, Kubernetes workloads, or external identity providers to securely access Google Cloud resources without storing long-lived service account keys.

---
## Identity-Aware Proxy (IAP)

**Definition:** Protects web applications and administrative services by requiring user authentication and IAM authorization before access is granted.

---
## VPC Service Controls

**Definition:** Creates a security perimeter around Google Cloud services to help prevent sensitive data from leaving trusted environments.

---
## Firewall Policies

**Definition:** Centrally managed firewall rules that can be applied across organizations, folders, or projects to consistently control network traffic.

---
## Cloud Armor

**Definition:** Google's web application firewall (WAF) and DDoS protection service that protects internet-facing applications from attacks and malicious traffic.

---
## Secret Manager

**Definition:** Securely stores, manages, rotates, and controls access to sensitive information such as passwords, API keys, certificates, and database credentials.

---
## Policy Tags

**Definition:** Data Catalog labels used to classify sensitive data and enforce fine-grained access control for datasets, especially in BigQuery.

---
## Integrity Policy Baseline

**Definition:** A set of approved system integrity rules used to verify that virtual machines or workloads remain in a trusted and uncompromised state. It helps detect unauthorized changes to boot components, operating systems, or critical software.

> **PCA Note:** Integrity Monitoring and integrity policy baselines are commonly associated with Google Cloud's Shielded VM features.



## Active Directory Domain Controller

**Active Directory Domain Controller Sync** is the process of keeping user accounts, groups, passwords, and authentication information synchronized between an on-premises **Active Directory (AD) Domain Controller** and a cloud identity service, such as **Google Cloud Cloud Identity** or **Microsoft Microsoft Entra ID (formerly Azure Active Directory)**. This allows users to sign in with the same corporate credentials both on-premises and in the cloud.

### Purpose

- Provides a **single identity** for users.
- Eliminates duplicate user account management.
- Enables **Single Sign-On (SSO)** across cloud and on-premises resources.
- Keeps users, groups, and passwords consistent.
- Supports centralized identity and access management.
---
## Tokenizer Service

**Definition:** Replaces sensitive information, such as credit card or personal identification numbers, with non-sensitive tokens so applications can process data without exposing the original values.

---
# PCA Memory Table

|Service|Remember It As|
|---|---|
|**IAM**|Who can do what|
|**Cloud DLP**|Find and protect sensitive data|
|**CMEK**|Customer owns encryption keys|
|**Cloud KMS**|Creates and manages encryption keys|
|**Security Command Center Premium**|Security dashboard and threat detection|
|**Workload Identity Federation**|No service account keys|
|**Identity-Aware Proxy (IAP)**|Authenticate users before application access|
|**VPC Service Controls**|Prevent data exfiltration|
|**Firewall Policies**|Centralized firewall management|
|**Cloud Armor**|WAF and DDoS protection|
|**Secret Manager**|Store passwords, API keys, and secrets|
|**Policy Tags**|Protect sensitive BigQuery data|
|**Integrity Policy Baseline**|Verify trusted VM integrity|
|**Tokenizer Service**|Replace sensitive data with tokens|

---

## PCA Exam Tip

Many scenario questions combine several of these services. For example, a payment application handling credit cards might use:

- **IAM** → Least-privilege access
- **IAP** → Secure administrator access
- **Cloud Armor** → Protect the public application
- **VPC Service Controls** → Prevent data exfiltration
- **Secret Manager** → Store database passwords
- **Cloud KMS + CMEK** → Encrypt sensitive data with customer-controlled keys
- **Cloud DLP** → Discover and mask credit card numbers
- **Policy Tags** → Restrict access to sensitive BigQuery columns
- **Security Command Center Premium** → Monitor for vulnerabilities and compliance issues
- **Tokenizer Service** → Replace credit card numbers with tokens for safer application processing
