

### API Versioning

**Definition:**

API versioning is the practice of creating a **new version of an API** whenever a **backward-incompatible change** is introduced, allowing existing applications to continue using the previous version without interruption.

**PCA Exam Tip:**

If the question says **"public REST API,"** **"don't break existing clients,"** **"backward-incompatible changes,"** or **"API lifecycle,"** think **API Versioning**.

---
## API Gateway

**Definition:**

A fully managed Google Cloud service that provides a secure entry point for REST APIs. It handles authentication, authorization, API keys, rate limiting, monitoring, and routing requests to backend services such as Cloud Run, Cloud Functions, App Engine, and GKE.

**PCA Exam Tip:**

If the question says **"publish a REST API with minimal management,"** **"secure an API,"** or **"manage API traffic,"** think **API Gateway**.

---
## Apigee

**Definition:**

Google Cloud's enterprise API management platform used to design, secure, publish, monitor, analyze, and monetize APIs. It provides advanced capabilities such as developer portals, analytics, rate limiting, API versioning, and lifecycle management.

**PCA Exam Tip:**

If the question mentions **enterprise API management**, **API analytics**, **developer portals**, or **API monetization**, the answer is usually **Apigee**.

---
## Cloud Endpoints

**Definition:**

Google Cloud's API management and gateway service that helps developers **publish, secure, monitor, and manage REST and gRPC APIs**. It provides authentication, authorization, API key validation, logging, monitoring, and quota management for backend services.

**PCA Exam Tip:**

If the question says **"secure an API,"** **"manage REST APIs,"** **"API keys,"** or **"monitor API usage,"** think **Cloud Endpoints**.

---
## Eventarc

**Definition:**

A fully managed event routing service that delivers events from Google Cloud services, custom applications, and third-party sources to Cloud Run, Cloud Functions, GKE, and other event consumers.

**PCA Exam Tip:**

If the question says **"trigger an application when an event occurs,"** or **"event-driven architecture,"** think **Eventarc**.

---
## JWT — JSON Web Token

**Definition:**

A JWT is a signed token containing identity information and claims about a user or service. It is commonly sent in the HTTP authorization header so an API can verify the caller’s identity and permissions.

Example:

```
Authorization: Bearer eyJhbGciOi...
```

**PCA Exam Tip:**

If the question says **signed token**, **claims**, **stateless authentication**, or **API authentication**, think **JWT**.

---
## OAuth 2.0

**Definition:**

OAuth 2.0 is an authorization framework that lets an application obtain limited access to a user’s account or protected API without receiving the user’s password. It normally uses short-lived access tokens.

Example:

```
Application
    ↓
User approves access
    ↓
OAuth server issues access token
    ↓
Application calls API
```

**PCA Exam Tip:**

If the question says **allow an application to access user data without sharing the password**, think **OAuth 2.0**.

### OAuth 2.0 versus JWT

- **OAuth 2.0** defines how authorization and token issuance work.
- **JWT** is a token format that OAuth 2.0 may use.

---

## Recommender Command

**Definition:**

The `gcloud recommender` command group retrieves and manages Google Cloud recommendations related to cost, security, reliability, performance, and resource optimization.

A common command is:

```
gcloud recommender recommendations list \
  --project=PROJECT_ID \
  --location=LOCATION \
  --recommender=RECOMMENDER_ID
```

**PCA Exam Tip:**

The Recommender service identifies recommended actions, but applying the actual infrastructure change normally requires the relevant service command or API.

---
## Pub/Sub

**Definition:**

Google Cloud's fully managed messaging service that enables asynchronous communication between applications using publishers and subscribers. It decouples services for scalable and reliable event processing.

**PCA Exam Tip:**

If the question says **"decouple applications,"** **"asynchronous messaging,"** or **"publish and subscribe,"** the answer is usually **Pub/Sub**.

---
### REST API

**Definition:**

A REST API (Representational State Transfer Application Programming Interface) is a standard web interface that allows applications to communicate using **HTTP/HTTPS** requests and responses, typically exchanging data in **JSON** format.

**PCA Exam Tip:**

If the question says **"HTTP requests,"** **"JSON,"** **"web service,"** **"application integration,"** or **"stateless API,"** think **REST API**.

---
## Service Directory

**Definition:**

A managed service registry that allows applications to discover available services across Google Cloud, hybrid, and multi-cloud environments.

**PCA Exam Tip:**

If the question says **"service discovery,"** **"find available services,"** or **"hybrid service registry,"** think **Service Directory**.

---
# PCA Memory Table

|Service|Remember It As|
|---|---|
|**API Gateway**|Managed REST API gateway|
|**Apigee**|Enterprise API management platform|
|**Cloud Endpoints**|API management and security|
|**Eventarc**|Event routing service|
|**Pub/Sub**|Asynchronous messaging|
|**Service Directory**|Service discovery|

---
## ⭐ PCA API Decision Guide

|If the question says...|Think...|
|---|---|
|Secure and publish a REST API|**API Gateway**|
|Enterprise API platform with analytics and developer portal|**Apigee**|
|API keys, JWT, REST/gRPC API management|**Cloud Endpoints**|
|Publish/subscribe messaging|**Pub/Sub**|
|Trigger code from cloud events|**Eventarc**|
|Discover services across cloud environments|**Service Directory**|