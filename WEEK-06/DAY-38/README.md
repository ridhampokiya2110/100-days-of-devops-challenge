# 🔔 Day 38: Automated Cloud Notifications with Amazon SNS

## 📋 Project Overview
Building an event-driven architecture (S3 -> Lambda) is great, but real-world systems require proactive alerting. Today, I integrated **Amazon Simple Notification Service (SNS)** into my serverless workflow to automatically send email notifications whenever a specific event occurs in my infrastructure.

## ⚙️ Core Concepts Explored
* **Pub/Sub Model:** Understood the Publisher/Subscriber messaging paradigm where Publishers send messages to "Topics", and Subscribers (Emails, SMS, endpoints) receive them asynchronously.
* **Amazon SNS:** AWS's fully managed messaging service for both application-to-application (A2A) and application-to-person (A2P) communication.
* **IAM Roles & Policies:** Modified the Lambda function's Execution Role by attaching the `AmazonSNSFullAccess` policy to securely grant it permission to publish messages.
* **Boto3 (AWS SDK for Python):** Used the `boto3` library inside AWS Lambda to programmatically interact with the SNS service.

## 🛠️ Steps Executed
1. **SNS Topic Creation:** Created a Standard SNS Topic (`S3-Upload-Alerts`) to act as the central notification hub.
2. **Email Subscription:** Added my personal Gmail address as a subscriber to the topic and verified the endpoint.
3. **Security Configuration:** Updated the IAM Role of my existing `S3EventProcessor` Lambda function to allow SNS publishing.
4. **Code Update:** Refactored the Python script to instantiate a `boto3` client and trigger an `sns.publish()` call containing the dynamic S3 file details.
5. **End-to-End Validation:** Uploaded a file to the S3 bucket and successfully received an automated, formatted email alert in my inbox within seconds.
