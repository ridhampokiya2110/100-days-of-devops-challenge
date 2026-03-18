# ⚡ Day 37: Event-Driven Automation with AWS S3 and Lambda

## 📋 Project Overview
Moving beyond manual executions and API triggers, today I dived into **Event-Driven Architecture**. I successfully automated a workflow where uploading a file to an Amazon S3 bucket automatically triggers a serverless AWS Lambda function to process that event in real-time.

## ⚙️ Core Concepts Explored
* **Event-Driven Architecture:** A design pattern where decoupled applications asynchronously publish and react to events (state changes).
* **S3 Event Notifications:** Configuring an S3 bucket to monitor specific actions (`s3:ObjectCreated:*`) and push those events to a target service.
* **AWS Lambda Triggers:** Setting up Lambda to listen for S3 events and automatically execute a Python script upon receiving the trigger.
* **CloudWatch Logs:** Validating automated executions and debugging backend code by analyzing the logs generated during the event execution.

## 🛠️ Steps Executed
1. **Infrastructure Setup:** Provisioned a fresh, private Amazon S3 bucket and a new Python 3.12 AWS Lambda function.
2. **Code Implementation:** Wrote a Python script utilizing the `json` and `urllib.parse` libraries to extract the `bucket_name` and `file_name` dynamically from the incoming S3 event payload.
3. **Trigger Configuration:** Linked the S3 bucket to the Lambda function by adding an S3 trigger, restricted specifically to "All object create events".
4. **Execution & Validation:** Uploaded a test file to the S3 bucket and navigated to Amazon CloudWatch. Successfully verified the event extraction and execution via the log streams.
