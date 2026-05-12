What AWS Lambda is (and why people use it)

AWS Lambda is a serverless compute service. “Serverless” doesn’t mean there are no servers—it means you don’t manage them. You upload code, define when it should run, and AWS handles provisioning, scaling, patching, and teardown.

Core idea
You write a function (small unit of code).
You attach triggers (events).
AWS runs your code on demand, scales it automatically, and bills you only for execution time.
Why it’s powerful
Zero server management (no EC2, no OS patching).
Auto-scaling (1 request → 1 instance; 10,000 requests → 10,000 instances).
Pay per use (milliseconds of execution + memory used).
Event-driven (runs only when something happens).
How Lambda fits into your architecture

Given your Jenkins + Terraform + S3 setup, Lambda typically sits in the middle of event-driven flows:

<font color="#ff0000">S3 Upload → Lambda → Process → Store/Notify</font>
<font color="#ff0000">API Gateway → Lambda → Business Logic → DB</font>
<font color="#ff0000">CloudWatch Event → Lambda → Scheduled Job</font>
<font color="#ff0000">GitHub Webhook → Lambda → Trigger pipeline (optional)</font>

[Function as a Service (Faas) - System Design - GeeksforGeeks](https://www.geeksforgeeks.org/system-design/function-as-a-service-faas-system-design/)

Think of Lambda as a reaction engine:

“When X happens, run this code.”

## Key building blocks

### 1. Function

Your code package (Python, Node.js, etc.).

### 2. Event

What triggers the function:

- **S3 upload**
- **HTTP request (via API Gateway)**
- **Scheduled cron (CloudWatch Events / EventBridge)**
- **DynamoDB stream**
- **SNS/SQS message**

### 3. Handler

The **entry point** AWS calls.

### 4. Execution Role (IAM)

Permissions your function needs (e.g., read S3, write logs).

---

## The Lambda execution model (important)

When an event arrives:

1. **AWS allocates a runtime environment**
2. **Loads your code**
3. **Calls your handler**
4. **Returns response**
5. **Environment may be reused (warm start) or destroyed (cold start)**

### Cold start vs warm start

- **Cold start**: first run → slightly slower (environment boot)
- **Warm start**: reused → fast

---

## Writing your first Lambda (Python)

### Basic structure

<span style="background:#d3f8b6">def lambda_handler(event, context):</span>
<span style="background:#d3f8b6">    return {</span>
<span style="background:#d3f8b6">        "statusCode": 200,</span>
<span style="background:#d3f8b6">        "body": "Hello from Lambda"</span>
<span style="background:#d3f8b6">    }</span>

### What are `event` and `context`?

- `event` → input data (trigger payload)
- `context` → runtime info (request ID, timeout, etc.)

---

## Example 1: Lambda triggered by S3 upload

When a file is uploaded to S3:
<span style="background:#d3f8b6">import json</span>

<span style="background:#d3f8b6">def lambda_handler(event, context):</span>
<span style="background:#d3f8b6">    # Get S3 info from event</span>
<span style="background:#d3f8b6">    record = event['Records'][0]</span>
<span style="background:#d3f8b6">    bucket = record['s3']['bucket']['name']</span>
<span style="background:#d3f8b6">    key = record['s3']['object']['key']</span>

<span style="background:#d3f8b6">    print(f"New file uploaded: {key} in {bucket}")</span>

<span style="background:#d3f8b6">    return {</span>
<span style="background:#d3f8b6">        "statusCode": 200,</span>
<span style="background:#d3f8b6">        "body": f"Processed {key}"</span>
<span style="background:#d3f8b6">    }</span>
### What happens

- You upload a file → S3 fires event → Lambda runs → logs info
## Example 2: Lambda as an API backend

Used with API Gateway:
<span style="background:#d3f8b6"><font color="#000000">import json</font></span>

<span style="background:#d3f8b6"><font color="#000000">def lambda_handler(event, context):</font></span>
<span style="background:#d3f8b6"><font color="#000000">    name = event.get("queryStringParameters", {}).get("name", "Guest")</font></span>

<span style="background:#d3f8b6"><font color="#000000">    return {</font></span>
<span style="background:#d3f8b6"><font color="#000000">        "statusCode": 200,</font></span>
<span style="background:#d3f8b6"><font color="#000000">        "body": json.dumps({</font></span>
<span style="background:#d3f8b6"><font color="#000000">            "message": f"Hello {name}"</font></span>
<span style="background:#d3f8b6"><font color="#000000">        })</font></span>
<span style="background:#d3f8b6"><font color="#000000">    }</font></span>
Call:
curl "https://api-id.execute-api.us-east-1.amazonaws.com?name=Chuck"
Response:
<span style="background:#d3f8b6">{</span>
<span style="background:#d3f8b6">  "message": "Hello Chuck"</span>
<span style="background:#d3f8b6">}</span>

## Example 3: Processing your Proof uploads (your project)

You could connect this to your S3 bucket:

<span style="background:#d3f8b6">def lambda_handler(event, context):</span>
<span style="background:#d3f8b6">    for record in event['Records']:</span>
<span style="background:#d3f8b6">        key = record['s3']['object']['key']</span>

<span style="background:#d3f8b6">        if key.endswith(".png"):</span>
<span style="background:#d3f8b6">            print(f"Image uploaded: {key}")</span>
<span style="background:#d3f8b6">        elif key.endswith(".md"):</span>
<span style="background:#d3f8b6">            print(f"Markdown uploaded: {key}")</span>

<span style="background:#d3f8b6">    return {"statusCode": 200}</span>
Now your architecture becomes:

<span style="background:#d3f8b6">Terraform → S3 Upload → Lambda → Logging/Processing</span>

## Deployment options

### 1. AWS Console (easy)

- Paste code
- Deploy
- Test

### 2. ZIP upload
<span style="background:#d3f8b6">zip function.zip lambda_function.py</span>

Upload to Lambda

### 3. **Terraform (best for you)**

<span style="background:#d3f8b6">resource "aws_lambda_function" "example" {</span>
<span style="background:#d3f8b6">  function_name = "my_lambda"</span>
<span style="background:#d3f8b6">  handler       = "lambda_function.lambda_handler"</span>
<span style="background:#d3f8b6">  runtime       = "python3.12"</span>

<span style="background:#d3f8b6">  filename         = "function.zip"</span>
<span style="background:#d3f8b6">  source_code_hash = filebase64sha256("function.zip")</span>

<span style="background:#d3f8b6">  role = aws_iam_role.lambda_exec.arn</span>
<span style="background:#d3f8b6">}</span>

### IAM role (required)
Lambda needs permission to run and log:

<span style="background:#d3f8b6">resource "aws_iam_role" "lambda_exec" {</span>
<span style="background:#d3f8b6">  name = "lambda_exec_role"</span>

<span style="background:#d3f8b6">  assume_role_policy = jsonencode({</span>
<span style="background:#d3f8b6">    Version = "2012-10-17"</span>
<span style="background:#d3f8b6">    Statement = [{</span>
<span style="background:#d3f8b6">      Action = "sts:AssumeRole"</span>
<span style="background:#d3f8b6">      Effect = "Allow"</span>
<span style="background:#d3f8b6">      Principal = {</span>
<span style="background:#d3f8b6">        Service = "lambda.amazonaws.com"</span>
<span style="background:#d3f8b6">      }</span>
<span style="background:#d3f8b6">    }]</span>
<span style="background:#d3f8b6">  })</span>
<span style="background:#d3f8b6">}</span>

## Logging (VERY important)

Logs go to:

- CloudWatch Logs

Inside code:

<span style="background:#d3f8b6">print("Debug message")</span>

Then view logs in AWS console.

---

## Limits to know

- Max execution time: 15 minutes
- Memory: 128 MB → 10 GB
- Stateless (no persistent disk)
- /tmp storage (limited, temporary)

---

## When to use Lambda

Good for:

- event processing
- APIs
- automation scripts
- CI/CD hooks
- lightweight compute

Not good for:

- long-running jobs
- heavy GPU workloads
- large stateful systems

---

## How this fits YOUR portfolio

You already have:

- Terraform ✅
- Jenkins CI/CD ✅
- S3 storage ✅

Add Lambda and you can say:

> “I built an event-driven pipeline where infrastructure deployment uploads artifacts to S3, triggering Lambda functions for automated

![[Pasted image 20260425145721.png]]

For your Lab3/Lab4 architecture, the correct pattern is:

<span style="background:#d3f8b6">Client → API Gateway → Lambda → Tokyo RDS</span>

But the Lambda should be in **Tokyo / ap-northeast-1**, near the RDS database.

## Best design

<span style="background:#d3f8b6">API Gateway  </span>
<span style="background:#d3f8b6">   ↓  </span>
<span style="background:#d3f8b6">Lambda function in Tokyo VPC  </span>
<span style="background:#d3f8b6">   ↓  </span>
<span style="background:#d3f8b6">Private subnets  </span>
<span style="background:#d3f8b6">   ↓  </span>
<span style="background:#d3f8b6">RDS Security Group  </span>
<span style="background:#d3f8b6">   ↓  </span>
<span style="background:#d3f8b6">Tokyo RDS Database</span>

## Key requirements

Your Lambda needs:

1. **VPC access**
    - Put Lambda in the same VPC/private subnets that can reach RDS.
2. **Security Group rule**
    
    - RDS must allow inbound from the Lambda security group on:
    
    <span style="background:#d3f8b6">3306 for MySQL  </span>
<span style="background:#d3f8b6">    5432 for PostgreSQL</span>
    
3. **Database credentials**
    - Do **not** hardcode username/password.
    - Store them in **AWS Secrets Manager**.
4. **IAM role**
    - Lambda role needs permission to:
    - write CloudWatch logs
    - read the DB secret from Secrets Manager
5. **Query by ID, not name**
    
    - Do not query only by `"Mr Lee"` in real systems.
    - Use a unique ID like:
    
    <span style="background:#d3f8b6">patient_id  </span>
<span style="background:#d3f8b6">    customer_id  </span>
<span style="background:#d3f8b6">    record_id</span>
    

## Simple Python Lambda example

Example for **MySQL RDS**:

<span style="background:#d3f8b6">import json  </span>
<span style="background:#d3f8b6">import os  </span>
<span style="background:#d3f8b6">import pymysql  </span>
<span style="background:#d3f8b6">import boto3  </span>
  
<span style="background:#d3f8b6">secrets = boto3.client("secretsmanager")  </span>
  
<span style="background:#d3f8b6">def lambda_handler(event, context):  </span>
<span style="background:#d3f8b6">    secret_name = os.environ["DB_SECRET_NAME"]  </span>
<span style="background:#d3f8b6">    db_host = os.environ["DB_HOST"]  </span>
<span style="background:#d3f8b6">    db_name = os.environ["DB_NAME"]  </span>
  
<span style="background:#d3f8b6">    secret = secrets.get_secret_value(SecretId=secret_name)  </span>
<span style="background:#d3f8b6">    creds = json.loads(secret["SecretString"])  </span>
  
<span style="background:#d3f8b6">    record_id = event["queryStringParameters"]["record_id"]  </span>
  
<span style="background:#d3f8b6">    connection = pymysql.connect(  </span>
<span style="background:#d3f8b6">        host=db_host,  </span>
<span style="background:#d3f8b6">        user=creds["username"],  </span>
<span style="background:#d3f8b6">        password=creds["password"],  </span>
<span style="background:#d3f8b6">        database=db_name,  </span>
<span style="background:#d3f8b6">        connect_timeout=5  </span>
<span style="background:#d3f8b6">    )  </span>
  
<span style="background:#d3f8b6">    try:  </span>
<span style="background:#d3f8b6">        with connection.cursor(pymysql.cursors.DictCursor) as cursor:  </span>
<span style="background:#d3f8b6">            sql = """  </span>
<span style="background:#d3f8b6">                SELECT record_id, full_name, status, created_at  </span>
<span style="background:#d3f8b6">                FROM patient_records  </span>
<span style="background:#d3f8b6">                WHERE record_id = %s  </span>
<span style="background:#d3f8b6">                LIMIT 1  </span>
<span style="background:#d3f8b6">            """  </span>
<span style="background:#d3f8b6">            cursor.execute(sql, (record_id,))  </span>
<span style="background:#d3f8b6">            result = cursor.fetchone()  </span>
  
<span style="background:#d3f8b6">        return {  </span>
<span style="background:#d3f8b6">            "statusCode": 200,  </span>
<span style="background:#d3f8b6">            "body": json.dumps(result)  </span>
<span style="background:#d3f8b6">        }  </span>
  
<span style="background:#d3f8b6">    finally:  </span>
<span style="background:#d3f8b6">        connection.close()</span>

## API call example

curl "https://api.example.com/records?record_id=12345"

## Important portfolio wording

For your project, say it like this:

> Lambda retrieves authorized records from the private Tokyo RDS database through API Gateway. Sensitive records remain stored only in Tokyo, while API access is controlled through IAM, security groups, and authenticated requests.

## Big warning

Do **not** expose RDS publicly.

The wrong design is:

<font color="#ff0000">Lambda on public internet → public RDS endpoint</font>

The right design is:

<font color="#ff0000">Lambda inside VPC → private RDS endpoint</font>