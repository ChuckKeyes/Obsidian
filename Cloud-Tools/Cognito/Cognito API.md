
[Cloud Computing 20260505 class 7 Professional Strategy, Cognito API, CLI Authentication May 6 2026](https://www.youtube.com/watch?v=s6CPDt_Ic1A&list=PL9Tm5WqkVHXAQJyL09Qyw4BSZtO2pPSEB&index=8)


[Cloud Computing 20260509 class 7 Interview Prep PSA, Cognito Lab MFA, CLI, Troubleshooting May 9 2](https://www.youtube.com/watch?v=bZcX5btBtrg&list=PL9Tm5WqkVHXAQJyL09Qyw4BSZtO2pPSEB&index=7)

[Cloud Computing 20260512 class 7 AI Market and Curriculum, Cognito Lab Troubleshooting May 10 2026](https://www.youtube.com/watch?v=ep38Bm1i-Sk&list=PL9Tm5WqkVHXAQJyL09Qyw4BSZtO2pPSEB&index=6)

### ID Token-Access Token

[Cloud Computing 20260512 class 7 401 Error, ID Token vs Access Token May 13 2026](https://www.youtube.com/watch?v=NjVaB9jXEfI&list=PL9Tm5WqkVHXAQJyL09Qyw4BSZtO2pPSEB&index=5)


### # User Pool Misconfiguration

[Cloud Computing 20260516 class 7 User Pool Misconfiguration, CLI Syntax Troubleshooting, MFA Challen](https://www.youtube.com/watch?v=va9sgO6MRr0&list=PL9Tm5WqkVHXAQJyL09Qyw4BSZtO2pPSEB&index=4)

### # Cognito Token Generation, API Gateway Authorization

[Cloud Computing 20260519 class 7 Cognito Token Generation, API Gateway Authorization, Career Strateg](https://www.youtube.com/watch?v=vCxA7ChYdqw&list=PL9Tm5WqkVHXAQJyL09Qyw4BSZtO2pPSEB&index=2)




---

# Where the API Fits

The Cognito API allows applications to communicate with Cognito programmatically.

Example:

```
Mobile App → Cognito API → Login Success → JWT Token
```

Then:

```
JWT Token → API Gateway → Backend Services
```

---

# Real Architecture

```
User ↓Frontend App ↓Cognito ↓JWT Token ↓API Gateway ↓Lambda / Kubernetes / EC2 ↓Database
```

Cognito authenticates the user before the API is accessed.

---

# What Cognito Can Do

## 1. User Sign-Up

Users create accounts.

Example:

```
POST /signup
```

---

## 2. User Login

Authenticate username/password.

Example:

```
POST /login
```

---

## 3. Generate JWT Tokens

Cognito returns tokens like:

- ID Token
- Access Token
- Refresh Token

These tokens prove identity.

---

# JWT Tokens

JWT = JSON Web Token

Contains:

```
- username- email- permissions- expiration time
```

Used by APIs to verify users.

---

# API Gateway + Cognito

Very common AWS architecture:

```
User → Cognito Login        ↓JWT Token        ↓API Gateway        ↓Backend API
```

API Gateway validates the Cognito token automatically.

---

# Example Flow

## Step 1 — Login

User logs in:

```
username: charlespassword: ********
```

---

## Step 2 — Cognito Returns Token

```
{  "access_token": "eyJhbGc...",  "expires_in": 3600}
```

---

## Step 3 — API Request

App sends token:

```
Authorization: Bearer eyJhbGc...
```

---

## Step 4 — API Gateway Verifies Token

If valid:

```
Access Allowed
```

If invalid:

```
403 Unauthorized
```

---

# User Pools vs Identity Pools

## User Pool

Handles:

- users
- passwords
- authentication

Think:

```
"Login system"
```

---

## Identity Pool

Handles:

- AWS temporary credentials
- Access to AWS resources

Think:

```
"Permission broker"
```

---

# Common Integrations

Cognito works with:

|Service|Purpose|
|---|---|
|Amazon API Gateway|Secure APIs|
|AWS Lambda|Backend logic|
|Amazon EKS|Secure apps|
|Amazon CloudFront|Secure frontend delivery|
|AWS WAF|Filter attacks|
|Amazon S3|Secure uploads|

---

# Terraform Example

Creating a Cognito User Pool:

```
resource "aws_cognito_user_pool" "main" {  name = "company-users"}
```

API Gateway authorizer:

```
resource "aws_api_gateway_authorizer" "cognito" {  name          = "cognito-auth"  type          = "COGNITO_USER_POOLS"}
```

---

# In Kubernetes

For Kubernetes apps:

```
User ↓Cognito ↓Ingress / API Gateway ↓Pods
```

Cognito handles identity.

Kubernetes handles applications.

---

# Enterprise Example

Hospital system:

```
Doctor logs in ↓Cognito authenticates ↓API Gateway verifies token ↓Kubernetes medical application ↓Patient database
```

Only authenticated users can access patient records.

---

# Security Benefits

Cognito provides:

- MFA support
- Password policies
- OAuth2/OpenID Connect
- SAML federation
- Google/Facebook login
- Token expiration
- Session management

---

# Important Cloud Engineer Understanding

## Cognito

Handles:

```
Identity + Authentication
```

## API Gateway

Handles:

```
API traffic + authorization enforcement
```

## WAF

Handles:

```
Attack filtering
```

Together:

```
Identity + API Management + Security
```

---

# Easy Memory Trick

```
Cognito = Security ID Card OfficeAPI Gateway = Front DoorWAF = Security Guard
```

- Cognito checks WHO you are
- API Gateway controls WHERE you go
- WAF blocks dangerous traffic