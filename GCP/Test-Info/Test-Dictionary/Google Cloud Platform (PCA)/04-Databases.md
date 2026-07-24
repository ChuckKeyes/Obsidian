# 04 - Databases

## AlloyDB

**Definition:** Google's fully managed PostgreSQL-compatible database designed for high performance, high availability, and enterprise workloads.

---
## Apache Spark

**Definition:** An open-source distributed data processing engine used for large-scale analytics, machine learning, and batch processing. Commonly runs on Dataproc.

---
## BigQuery

**Definition:** Google's fully managed, serverless data warehouse used for large-scale SQL analytics and business intelligence.

---
## Bigtable

**Definition:** Google's fully managed NoSQL wide-column database designed for massive datasets, low-latency reads, and high-throughput workloads.

---
## Blobstore

**Definition:** Legacy App Engine storage service for storing large binary objects (BLOBs). Modern Google Cloud applications typically use Cloud Storage instead.

---
## `bq show`

**Definition:**

`bq show` is a BigQuery command-line command used to display information about a resource, such as a dataset, table, view, job, model, reservation, or table schema.

**Example:**

```
bq show PROJECT_ID:DATASET.TABLE
```

**PCA Exam Tip:**

If the question asks how to inspect a BigQuery table, dataset, schema, or resource from the command line, think **`bq show`**.

---
## Cloud Spanner

**Definition:** Google's globally distributed relational database that provides horizontal scalability, strong consistency, and high availability.

---
## Cloud Spanner Emulator

**Definition:** A local development tool that simulates Cloud Spanner for testing applications without using a live Google Cloud environment.

---
## Cloud SQL

**Definition:** Google's fully managed relational database service supporting MySQL, PostgreSQL, and SQL Server.

---
## Datalab

**Definition:** Google's legacy interactive notebook environment for data exploration and visualization. It has been replaced by Vertex AI Workbench.

---
## Dataprep

**Definition:** A visual data preparation service used to clean, transform, and prepare datasets for analysis. It reduces the need for manual coding.

---
## Dataproc

**Definition:** Google's managed Apache Spark and Hadoop service used for big data processing and analytics.

---
## Datastore

**Definition:** Google's original NoSQL document database for App Engine applications. It is now part of Firestore in Datastore mode.

---
## Datastream

**Definition:** A serverless change data capture (CDC) service that continuously replicates database changes into Google Cloud services.

---
## Dataflow

**Definition:** Google's fully managed stream and batch data processing service based on Apache Beam.

---
## Firestore

**Definition:** Google's fully managed NoSQL document database designed for web, mobile, and serverless applications with automatic scaling.

---
## Hadoop

**Definition:** An open-source framework for distributed storage and large-scale data processing. Often managed through Dataproc.

---
## Memorystore for Memcached

**Definition:**

A fully managed, **in-memory caching service** based on the open-source **Memcached** software. It stores frequently accessed data in RAM to improve application performance and reduce database load.

**Key Features:**

- Fully managed by Google Cloud
- Extremely fast in-memory cache
- Compatible with Memcached clients
- Horizontally scalable
- No data persistence
- Best for temporary cache data

**Common Uses:**

- Cache database queries
- Cache web pages
- Cache API responses
- Store temporary session data
- Reduce latency for high-traffic applications

**PCA Exam Tip:**

Use **Memorystore for Memcached** when you need **simple, high-speed caching** and the data can be recreated if the cache is lost.

---
## Memorystore for Redis

**Definition:**

A fully managed, **in-memory data store and cache** based on the open-source **Redis** software. It provides fast data access with optional persistence, replication, and high availability.

**Key Features:**

- Fully managed by Google Cloud
- In-memory key-value database
- Optional data persistence
- Supports replication and failover
- High availability options
- Supports advanced data structures (lists, sets, hashes, sorted sets, streams)

**Common Uses:**

- Database caching
- User session storage
- Leaderboards
- Shopping carts
- Real-time analytics
- Pub/Sub messaging
- Distributed locking

---
## MongoDB

**Definition:** A popular NoSQL document database that can run on Google Cloud using Compute Engine, GKE, or MongoDB Atlas.

---
## NoSQL

**Definition:** A category of databases that store non-relational data such as documents, key-value pairs, graphs, or wide-column data for flexible scalability.

---
## Pub/Sub

**Definition:** Google's fully managed messaging service that enables asynchronous communication between applications using publishers and subscribers.

---
## RDB (Relational Database)

**Definition:** A database that stores data in related tables using rows and columns and is queried using SQL.

---
## Schema Versioning Tool

**Definition:**

A schema versioning tool tracks and applies controlled changes to a database schema, such as creating tables, adding columns, modifying indexes, or rolling back changes.

Common examples include:

```
Flyway
Liquibase
Alembic
Django migrations
```

**PCA Exam Tip:**

If the question says **manage database schema changes across development, staging, and production**, think **schema migration or schema versioning tool**.

This is a general software-development category, not a specific Google Cloud service.

---
## SQL Server

**Definition:** Microsoft's relational database management system, available as a managed database through Cloud SQL.

---
# PCA Memory Table

| Service                    | Remember It As                         |
| -------------------------- | -------------------------------------- |
| **AlloyDB**                | High-performance PostgreSQL            |
| **Apache Spark**           | Distributed data processing            |
| **BigQuery**               | Data warehouse & analytics             |
| **Bigtable**               | Massive NoSQL database                 |
| **Blobstore**              | Legacy binary storage                  |
| **Cloud Spanner**          | Global relational database             |
| **Cloud Spanner Emulator** | Local Spanner testing                  |
| **Cloud SQL**              | Managed MySQL, PostgreSQL & SQL Server |
| **Datalab**                | Legacy notebook environment            |
| **Dataprep**               | Data cleaning and preparation          |
| **Dataproc**               | Managed Spark & Hadoop                 |
| **Datastore**              | Legacy NoSQL database                  |
| **Datastream**             | Change data capture (CDC)              |
| **Dataflow**               | Batch & stream processing              |
| **Firestore**              | NoSQL document database                |
| **Hadoop**                 | Distributed big data framework         |
| **MongoDB**                | NoSQL document database                |
| **NoSQL**                  | Non-relational databases               |
| **Pub/Sub**                | Messaging service                      |
| **RDB**                    | Relational database                    |
| **SQL Server**             | Microsoft relational database          |
- 