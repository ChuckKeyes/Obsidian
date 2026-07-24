
## Cloud Audit Logs

**Definition:**

Automatically records administrative actions and access events for Google Cloud resources. Includes **Admin Activity**, **Data Access**, **System Event**, and **Policy Denied** logs.

**PCA Exam Tip:**

Use Cloud Audit Logs to track **who did what, when, and where** across Google Cloud services.

---
## Cloud Logging

**Definition:**

Google Cloud's centralized logging service that stores and analyzes logs from **Google Cloud services**, **Compute Engine VMs**, **GKE**, **Cloud Run**, and other resources. VM logs are collected through the **Ops Agent**, while Cloud service logs (such as **Cloud Audit Logs**) are collected automatically.

**PCA Exam Tip:**

If the question says **"collect logs from Google Cloud services and VMs in one place,"** the answer is **Cloud Logging + Ops Agent**.

---
## Cloud Monitoring

**Definition:**

Google Cloud's monitoring service that collects metrics, dashboards, uptime checks, and alerts for Google Cloud resources, applications, and hybrid environments.

**PCA Exam Tip:**

Use Cloud Monitoring to track resource health, performance, and availability.

---
## Cloud Operations Suite (Cloud Ops)

**Definition:**

Google Cloud's integrated operations platform that combines **Cloud Monitoring**, **Cloud Logging**, **Cloud Trace**, **Cloud Profiler**, **Error Reporting**, and **Debugger** for observing and managing applications.

**PCA Exam Tip:**

Cloud Ops is the complete monitoring and observability solution for Google Cloud.

---
## Cloud Profiler

**Definition:**

Continuously analyzes application CPU and memory usage to identify performance bottlenecks with minimal overhead.

**PCA Exam Tip:**

Use when improving application performance and reducing resource consumption.

---
## Cloud Trace

**Definition:**

Tracks requests as they travel through distributed applications and microservices, helping identify latency and performance bottlenecks.

**PCA Exam Tip:**

Use for troubleshooting slow requests in distributed systems.

---
## Current Google Cloud debugging and observability tools

|Tool|Status|Purpose|
|---|---|---|
|**Cloud Logging**|✅ Current|Collect and search logs|
|**Cloud Monitoring**|✅ Current|Metrics and dashboards|
|**Cloud Trace**|✅ Current|Request latency analysis|
|**Cloud Profiler**|✅ Current|CPU and memory profiling|
|**Cloud Error Reporting**|✅ Current|Aggregate application errors|
|**Cloud Debugger**|❌ Deprecated|Production debugger (shut down)|

---
## Grafana

**Definition:**

An open-source visualization platform that creates dashboards using metrics from Cloud Monitoring, Prometheus, and many other data sources.

**PCA Exam Tip:**

Grafana displays data; it does not collect metrics.

---
## Log Analytics

**Definition:**

A Cloud Logging feature that lets you analyze log data using SQL-based queries powered by BigQuery technology without exporting logs.

**PCA Exam Tip:**

Use Log Analytics for advanced log analysis and troubleshooting.

---
## Ops Agent

**Definition:**

A Google Cloud agent installed on Compute Engine VMs that collects **operating system logs, application logs, and system metrics**, sending them to **Cloud Logging** and **Cloud Monitoring**.

**PCA Exam Tip:**

If a question asks for **VM logs**, **system logs**, or **application logs** from Compute Engine, think **Ops Agent**.

---
## Prometheus

**Definition:**

An open-source monitoring system that collects and stores time-series metrics from applications, containers, and Kubernetes clusters.

**PCA Exam Tip:**

Prometheus collects metrics; Grafana visualizes them.

---
## Stackdriver

**Definition:**

The former name of Google Cloud Operations Suite. It has been renamed to **Cloud Operations Suite**, but older documentation and exam questions may still use the Stackdriver name.

**PCA Exam Tip:**

If you see Stackdriver, think **Cloud Monitoring + Cloud Logging + Cloud Ops**.

---
## VPC Flow Logs

**Definition:**

Captures information about network traffic flowing through Virtual Private Cloud (VPC) networks, including source, destination, ports, protocols, and bytes transferred.

**PCA Exam Tip:**

Use VPC Flow Logs to troubleshoot network connectivity, analyze traffic patterns, and investigate security incidents.

---
#### Error Reporting – 

Automatically groups and reports application errors and exceptions.

---
#### Uptime Checks – 

Periodically tests the availability of websites, APIs, and services and can trigger alerts when they become unavailable.

