# 06 – IAM & Security

---

## Active Directory Domain Controller

**Definition:**

Active Directory Domain Controller Sync is the process of keeping user accounts, groups, passwords, and authentication information synchronized between an on-premises **Active Directory (AD) Domain Controller** and a cloud identity service such as **Google Cloud Cloud Identity** or **Microsoft Entra ID**.

This allows users to use the same corporate identities across on-premises and cloud environments.

### Purpose

- Provides a single identity for users.
    
- Reduces duplicate account management.
    
- Enables Single Sign-On (SSO).
    
- Keeps users and groups synchronized.
    
- Supports centralized identity and access management.
    

**PCA Exam Tip:**

If employees must use their existing corporate identities to access Google Cloud, think **identity federation, Cloud Identity, or Workforce Identity Federation**.

---

## Cloud Armor

**Definition:**

Google Cloud's **Web Application Firewall (WAF)** and DDoS protection service. Cloud Armor protects internet-facing applications from malicious traffic and application-layer attacks.

**PCA Exam Tip:**

If the question mentions **WAF, DDoS protection, SQL injection, XSS, or protecting an internet-facing load balancer**, think **Cloud Armor**.

---

## Cloud HSM

**Definition:**

Cloud HSM is a managed **Hardware Security Module (HSM)** service that allows organizations to create and use hardware-protected cryptographic keys.

Cloud HSM integrates with **Cloud KMS**, allowing organizations to use HSM-backed keys while Google manages the underlying HSM infrastructure.

**Key Features:**

- Hardware-protected encryption keys
    
- Managed HSM infrastructure
    
- Integration with Cloud KMS
    
- FIPS-certified hardware
    
- Centralized cryptographic key management
    

**PCA Exam Tip:**

If a security or compliance requirement specifically requires encryption keys to be protected by a **Hardware Security Module**, think **Cloud HSM**.

---

## Cloud Key Management Service (Cloud KMS)

**Definition:**

A managed Google Cloud service for creating, storing, rotating, and controlling encryption keys used to protect cloud resources and applications.

**PCA Exam Tip:**

If the question asks where to **create, manage, rotate, or control encryption keys**, think **Cloud KMS**.

---

## Customer-Managed Encryption Keys (CMEK)

**Definition:**

Allows customers to control and manage the encryption keys used to protect supported Google Cloud resources.

The keys are normally managed through **Cloud KMS**.

**PCA Exam Tip:**

If the organization requires **control over its encryption keys**, including rotation and access policies, think **CMEK + Cloud KMS**.

---

# Federated Authentication (SAML 2.0)

## Definition

**Federated authentication** allows users to log in to one system using identities managed by another trusted Identity Provider (IdP).

Instead of creating separate cloud accounts and passwords, organizations can authenticate users against their existing corporate identity system.

**SAML 2.0 (Security Assertion Markup Language 2.0)** is an open standard used to exchange authentication and authorization information between an **Identity Provider (IdP)** and a **Service Provider (SP)**.

### Why Companies Use It

Organizations may already have identity providers such as:

- Microsoft Active Directory
    
- Microsoft Entra ID
    
- Okta
    
- Ping Identity
    
- OneLogin
    

Employees can continue using their existing corporate identities rather than maintaining separate passwords for cloud resources.

### Authentication Flow

```text
User
   │
   ▼
Corporate Identity Provider
(Okta, Entra ID, AD FS)
   │
   │ SAML 2.0 Assertion
   ▼
Google Cloud
   │
   ▼
Google Cloud Resources
```

### Components

**Identity Provider (IdP)**

Authenticates the user.

Examples:

- Okta
    
- Microsoft Entra ID
    
- AD FS
    
- Ping Identity
    

**Service Provider (SP)**

The application or cloud service that trusts the Identity Provider.

Example:

- Google Cloud
    

### Advantages

- Single Sign-On (SSO)
    
- Centralized identity management
    
- Fewer passwords
    
- Improved security
    
- Easier employee onboarding
    
- Easier employee offboarding
    
- Integration with existing corporate identity systems
    

### PCA Exam Tip

If a question says:

- "Use the company's existing identity provider."
    
- "Employees should use corporate credentials."
    
- "Avoid creating separate cloud passwords."
    
- "Integrate an existing corporate identity system."
    

Think:

**Identity Federation / SAML / Cloud Identity / Workforce Identity Federation**

### Related Services

- Cloud Identity
    
- Google Cloud IAM
    
- Workforce Identity Federation
    
- Identity-Aware Proxy (IAP)
    
- Active Directory
    
- Microsoft Entra ID
    
- Okta
    

### Official Documentation

Google Cloud Workforce Identity Federation:

[https://cloud.google.com/iam/docs/workforce-identity-federation](https://cloud.google.com/iam/docs/workforce-identity-federation)

---

## Firebase Authentication

**Definition:**

Firebase Authentication is an identity service for mobile and web applications.

It supports authentication using:

- Email and password
    
- Phone numbers
    
- Google
    
- Apple
    
- Facebook
    
- GitHub
    
- Other identity providers
    

**PCA Exam Tip:**

If the question says **authenticate customers of a mobile or web application**, think **Firebase Authentication** or **Identity Platform**, depending on enterprise requirements.

---

## Firewall Policies

**Definition:**

Centrally managed firewall rules that can be applied across organizations, folders, networks, or projects to consistently control network traffic.

**PCA Exam Tip:**

If an organization needs **centralized firewall management across many projects or VPC networks**, think **Firewall Policies**.

---

## IAM (Identity and Access Management)

**Definition:**

Controls **who can do what on which Google Cloud resources**.

IAM uses:

- Principals
    
- Roles
    
- Permissions
    
- Policies
    
- Service accounts
    

A role contains permissions, and the role is granted to a principal through an IAM policy.

### Memory Rule

```text
Principal → Role → Permissions → Resource
```

**PCA Exam Tip:**

Think:

**IAM = Who can do what**

Use the **principle of least privilege** and grant the smallest appropriate role needed to perform the job.

---

## Identity-Aware Proxy (IAP)

**Definition:**

Protects web applications and administrative services by requiring user authentication and IAM authorization before access is granted.

IAP provides an identity-aware access layer in front of applications.

**PCA Exam Tip:**

If administrators or employees need secure application access **without exposing the application directly to the internet or relying only on a traditional VPN**, think **IAP**.

---

## Integrity Policy Baseline

**Definition:**

A trusted baseline used to verify whether VM boot components or system integrity measurements have changed unexpectedly.

It helps identify unauthorized modifications to critical system components.

Integrity monitoring is associated with **Shielded VM**.

**PCA Exam Tip:**

Think:

**Shielded VM + Integrity Monitoring → detect unexpected VM boot integrity changes**

---

## Model Armor

**Definition:**

Google Cloud **Model Armor** provides a security layer for generative AI and LLM applications.

It can inspect prompts entering an AI model and responses leaving the model for security and safety threats.

Model Armor can help detect:

- Prompt injection
    
- Jailbreak attempts
    
- Harmful content
    
- Malicious URLs
    
- Malicious files
    
- Sensitive-data exposure
    

### Model Armor + Sensitive Data Protection

Model Armor can work with **Sensitive Data Protection** to identify sensitive information in AI prompts and responses.

Examples include:

- Personally identifiable information (PII)
    
- Credit card numbers
    
- Social Security numbers
    
- Credentials
    
- API keys
    
- Financial information
    

### Architecture

```text
User
  │
  ▼
Prompt
  │
  ▼
Model Armor
  │
  ├── Prompt Injection Detection
  ├── Jailbreak Detection
  ├── Harmful Content Detection
  └── Sensitive Data Protection
  │
  ▼
Gemini / LLM
  │
  ▼
Model Armor
  │
  ▼
User
```

**PCA Exam Tip:**

If the question asks how to **protect generative AI prompts and responses**, think **Model Armor**.

If the AI application must detect or protect **PII or other sensitive information**, think:

**Model Armor + Sensitive Data Protection**

---

## Policy Tags

**Definition:**

Classification labels used to categorize sensitive data and enforce fine-grained access control, particularly for columns in **BigQuery**.

**PCA Exam Tip:**

If users should be allowed to query a BigQuery table but **certain users must not see sensitive columns**, think **Policy Tags / column-level security**.

---

## Secret Manager

**Definition:**

Securely stores, manages, versions, and controls access to sensitive application information.

Examples:

- Passwords
    
- API keys
    
- Database credentials
    
- Certificates
    
- Tokens
    

**PCA Exam Tip:**

If an application needs to securely retrieve a **password, API key, token, or database credential**, think **Secret Manager**.

Do not hard-code secrets into source code.

---

## Security Command Center Premium (SCC Premium)

**Definition:**

Google Cloud's centralized security platform for detecting and managing security risks across Google Cloud environments.

It can surface findings related to:

- Vulnerabilities
    
- Threats
    
- Misconfigurations
    
- Malware
    
- Exposed resources
    
- Compliance
    
- Security posture
    

**PCA Exam Tip:**

Think:

**Security Command Center = centralized cloud security visibility and findings**

---

## Sensitive Data Protection

**Formerly:** Cloud Data Loss Prevention (Cloud DLP)

**Definition:**

Google Cloud service used to discover, inspect, classify, de-identify, mask, and help protect sensitive information.

Examples include:

- Credit card numbers
    
- Social Security numbers
    
- Personally identifiable information (PII)
    
- Financial information
    
- Credentials
    
- Other regulated information
    

### Common Operations

- Discover
    
- Inspect
    
- Classify
    
- Mask
    
- Redact
    
- Tokenize
    
- De-identify
    

**PCA Exam Tip:**

If the question asks to **find, classify, mask, redact, tokenize, or de-identify sensitive information**, think **Sensitive Data Protection**.

### Model Armor Connection

For generative AI applications:

```text
Model Armor
      +
Sensitive Data Protection
      =
AI Security + Sensitive Data Protection
```

---

## Tokenizer Service

**Definition:**

Replaces sensitive information, such as credit card numbers or personal identifiers, with non-sensitive tokens.

Applications can process the token without exposing the original sensitive value.

**PCA Exam Tip:**

If a payment or financial application must use data without exposing the actual **credit card number or sensitive identifier**, think **tokenization**.

---

## VPC Service Controls

**Definition:**

Creates security perimeters around supported Google Cloud services to reduce the risk of sensitive data leaving trusted environments.

**Primary Purpose:**

Prevent **data exfiltration**.

**PCA Exam Tip:**

If IAM correctly controls users but the organization also needs to prevent sensitive data from being moved outside an approved security boundary, think **VPC Service Controls**.

### Memory Rule

**IAM = Who can access**

**VPC Service Controls = Where data can go**

---

## Workload Identity Federation

**Definition:**

Allows external workloads to access Google Cloud resources using federated identities instead of storing long-lived Google Cloud service account keys.

It is useful for workloads running in environments such as:

- AWS
    
- Azure
    
- On-premises infrastructure
    
- External CI/CD systems
    

**Primary Security Benefit:**

Eliminates the need to distribute and maintain long-lived service account keys.

**PCA Exam Tip:**

If an application running **outside Google Cloud** needs Google Cloud access and the question says **avoid service account keys**, think **Workload Identity Federation**.

---

# PCA Memory Table

|Service|Remember It As|
|---|---|
|**Cloud Armor**|WAF + DDoS protection|
|**Cloud HSM**|Hardware-protected encryption keys|
|**Cloud KMS**|Create and manage encryption keys|
|**CMEK**|Customer controls encryption keys|
|**Federated Authentication**|Existing corporate identities|
|**Firebase Authentication**|Authenticate mobile/web users|
|**Firewall Policies**|Centralized firewall management|
|**IAM**|Who can do what|
|**IAP**|Authenticate before application access|
|**Integrity Policy Baseline**|Verify trusted VM integrity|
|**Model Armor**|Protect AI prompts and responses|
|**Policy Tags**|Protect sensitive BigQuery columns|
|**Secret Manager**|Store passwords, API keys, and secrets|
|**Security Command Center**|Security findings and posture|
|**Sensitive Data Protection**|Find and protect sensitive data|
|**Tokenizer Service**|Replace sensitive data with tokens|
|**VPC Service Controls**|Prevent data exfiltration|
|**Workload Identity Federation**|External workloads without SA keys|

---

# PCA Security Scenario

A company operates a payment application containing sensitive customer and credit-card information.

A complete Google Cloud security architecture could use:

- **IAM** → Least-privilege access
    
- **IAP** → Secure administrator/application access
    
- **Cloud Armor** → WAF and DDoS protection
    
- **VPC Service Controls** → Reduce data-exfiltration risk
    
- **Secret Manager** → Store database passwords and API credentials
    
- **Cloud KMS + CMEK** → Customer-controlled encryption
    
- **Sensitive Data Protection** → Discover, classify, mask, and de-identify sensitive data
    
- **Policy Tags** → Restrict sensitive BigQuery columns
    
- **Security Command Center** → Centralized security findings and posture
    
- **Tokenizer Service** → Replace sensitive values with tokens
    
- **Model Armor** → Protect AI prompts and responses if generative AI is part of the application
    

---

# PCA Quick Memory

```text
IAM                         = WHO can do WHAT
IAP                         = WHO can enter the application
Cloud Armor                 = Protect the WEB edge
Firewall Policies           = Control NETWORK traffic
VPC Service Controls        = Keep DATA inside the boundary
Secret Manager              = Protect SECRETS
Cloud KMS                   = Manage KEYS
CMEK                        = Customer controls KEYS
Cloud HSM                   = Hardware-protected KEYS
Sensitive Data Protection   = Find/protect SENSITIVE DATA
Policy Tags                 = Protect COLUMNS
SCC                         = Find SECURITY problems
Workload Identity Federation = Avoid SERVICE ACCOUNT KEYS
Model Armor                 = Protect AI prompts/responses
```