### Lambda videos

[WEEK 32 - CLASS 7: AWS and the Borg TUE APR 14](https://www.youtube.com/watch?v=-aOP5IweUCU&list=PLzfyR91ut1X3Dtxbub2F2kUuRrPK7_-Gs&index=13&t=534s)

[Cloud Computing 20260418 class 7 Class Restructuring, AWS Lambdas Lab and Troubleshooting Apr 18 2](https://www.youtube.com/watch?v=12Zma95Q3Us&list=PL9Tm5WqkVHXAQJyL09Qyw4BSZtO2pPSEB&index=15)

[Cloud Computing 20260419 class 7 Lambda Labs infinite loops, two bucket solution, IAM and permission](https://www.youtube.com/watch?v=CV8rTCVlw6g&list=PL9Tm5WqkVHXAQJyL09Qyw4BSZtO2pPSEB&index=14)

[(97) Cloud Computing 20260421 class 7 Lambda Function, API Gateway Apr 22 2026 - YouTube](https://www.youtube.com/watch?v=a0LL1HunHr8&list=PL9Tm5WqkVHXAQJyL09Qyw4BSZtO2pPSEB&index=13)

[Cloud Computing 20260425 class 7 Lambda Function, API Gateway, Lambda Proxy Integration Apr 25 202](https://www.youtube.com/watch?v=d9goy-uNj2Q&list=PL9Tm5WqkVHXAQJyL09Qyw4BSZtO2pPSEB&index=12)

### Udemy

[Course: AWS Lambda and the Serverless Framework - Hands On Learning! | Udemy](https://www.udemy.com/course/aws-lambda-serverless/learn/lecture/31068016?start=15#overview)

### # AWS Lambda Documentation
[AWS Lambda Documentation](https://docs.aws.amazon.com/lambda/)


![[Pasted image 20260606195248.png]]

# ☁️ AWS Lambda

## Definition

AWS Lambda is a **serverless compute service** from Amazon Web Services that allows you to run code **without managing servers**.

Lambda automatically:

- runs your code
- scales automatically
- handles infrastructure
- charges only when the code executes

---

# 🧠 Simple Explanation

Instead of:

- creating EC2 servers
- installing software
- patching operating systems
- managing scaling

You simply upload:

- Python
- Node.js
- Java
- Go
- other supported code

…and Lambda runs it only when triggered.

---

# ⚙️ How Lambda Works

```
Event → Lambda Function → Executes Code → Returns Result
```

Examples of events:

- API request
- S3 file upload
- DynamoDB change
- CloudWatch timer
- user login
- Kafka message
- webhook
- IoT event

---

# 📦 Common AWS Lambda Uses

|Use Case|Example|
|---|---|
|Automation|Resize uploaded images|
|APIs|Backend API processing|
|DevOps|Start/stop EC2 instances|
|Security|Alert on suspicious activity|
|AI Pipelines|Process ML events|
|ETL|Transform incoming data|
|Serverless Websites|Backend logic|
|Kubernetes Automation|Cluster scripts|

---

# 🔥 Example Architecture

```
User → API Gateway → Lambda → DynamoDB
```

OR

```
S3 Upload → Lambda → Resize Image → Save Back to S3
```

---

# 🐍 Example Python Lambda Function

```
def lambda_handler(event, context):    return {        'statusCode': 200,        'body': 'Hello from Lambda'    }
```

---

# 📈 Benefits

|Benefit|Why Important|
|---|---|
|No servers|Less management|
|Auto scaling|Handles traffic automatically|
|Pay-per-use|Cheap for small workloads|
|Fast deployment|Upload code quickly|
|Event-driven|Great for automation|

---

# ⚠️ Limitations

|Limitation|Description|
|---|---|
|Timeout|Max execution time|
|Stateless|No permanent memory|
|Cold starts|Initial startup delay|
|Resource limits|CPU/RAM limits|

---

# ☁️ Related AWS Services

|Service|Relationship|
|---|---|
|API Gateway|Triggers Lambda APIs|
|S3|File upload triggers|
|CloudWatch|Logs & monitoring|
|DynamoDB|Database integration|
|IAM|Permissions|
|Step Functions|Workflow orchestration|
|EventBridge|Event routing|

---

# 🧠 DevOps / Kubernetes Perspective

In cloud engineering, Lambda is often used for:

- automation
- event processing
- lightweight APIs
- serverless workflows
- infrastructure operations

Kubernetes handles:

- long-running applications
- containers
- complex microservices

Lambda handles:

- short event-driven
# 🚀 Easy Real-World Example

```
Customer uploads PDF        ↓S3 bucket receives file        ↓Lambda triggers automatically        ↓Python extracts text        ↓Results stored in database
```