
Class Notes

![[Pasted image 20260502201112.png]]

################################################################

import json


def lambda_handler(event, context):

    print("Hello from Lambda")

    print(f"Event: {event}")

    return {

        'statusCode': 200,

        'body': json.dumps('Hello from Lambda!')

    }
   #################################################################
## IAM

IAM ............ Roles ....................... Create role..................

AWSLambdaBasicExecutionRole

### Trust policy

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "lambda.amazonaws.com"
                ]
            }
        }
    ]
}

## AWSLambdaBasicExecutionRole

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        }
    ]
}

