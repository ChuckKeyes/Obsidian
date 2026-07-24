
Once an AWS Lambda function can access a VPC, VM, database, or the internet, it becomes a **small event-driven worker** that runs code when something happens.

Think of Lambda as:

> "Run this code for 5 seconds, 30 seconds, or a few minutes when an event occurs."

### Common Uses

#### 1. Process S3 Uploads

Someone uploads a file:

```
S3 Upload    ↓Lambda    ↓Resize image    ↓Save result
```

Used by:

- Photo sites
- Document processing
- PDF conversion

---

#### 2. Database Automation

```
API Request    ↓Lambda    ↓Read/Write RDS    ↓Return result
```

Example:

- Customer lookup
- Inventory check
- Order status

---

#### 3. Kubernetes Automation

A Cloud/DevOps engineer might use Lambda to:

```
CloudWatch Alarm    ↓Lambda    ↓Call Kubernetes API    ↓Scale application
```

or

```
New deployment    ↓Lambda    ↓Notify Slack/Teams
```

---

#### 4. Network Engineering Tasks

```
EventBridge Schedule    ↓Lambda    ↓Check VPNCheck Route TablesCheck Security GroupsGenerate Report
```

---

#### 5. Security Automation

Very common.

```
New IAM User    ↓Lambda    ↓Verify permissions    ↓Alert security team
```

or

```
Public S3 Bucket Detected    ↓Lambda    ↓Remove public access
```

---

#### 6. API Backend

```
API Gateway    ↓Lambda    ↓Python Code    ↓Database
```

This is one of the most common AWS architectures.

---

### In Your Tool Box

Given your interests:

```
AWSTerraformNetworkingKubernetesSecurity
```

You would most likely use Lambda for:

- Infrastructure automation
- Security automation
- Monitoring
- Reporting
- Scheduled maintenance
- API integrations

rather than building large business applications.

### Real Example for Keyes Cloud Solutions

Imagine your Kubernetes cluster:

```
CloudWatch AlarmCPU > 80%    ↓Lambda    ↓Creates ticketSends emailPosts to TeamsStores event in S3
```

No server required.

### One-Sentence Obsidian Definition

> **AWS Lambda is a serverless compute service that runs code automatically in response to events, allowing cloud engineers to automate infrastructure, security, monitoring, and application workflows without managing servers.**