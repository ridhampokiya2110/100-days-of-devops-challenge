# ⚡ Day 34: Serverless Compute with AWS Lambda

## 📋 Project Overview
Managing and paying for idle EC2 instances just to run lightweight automation scripts is inefficient. Today, I transitioned to a **Serverless Architecture** by writing and executing Python code directly in **AWS Lambda**.

## ⚙️ Core Concepts Explored
* **Serverless Computing:** A cloud execution model where AWS dynamically manages the allocation and provisioning of servers. You only pay for the exact milliseconds your code executes.
* **AWS Lambda:** An event-driven, serverless computing platform that runs code in response to events and automatically manages the computing resources required.
* **Lambda Handler & Events:** Understanding the `lambda_handler(event, context)` architecture. The `event` object passes data to the function, while the `context` object provides runtime information.
* **JSON Payloads:** Sending and parsing JSON data to test the function's logic.

## 🛠️ Steps Executed
1. **Function Provisioning:** Created a new AWS Lambda function using the Python 3.12 runtime from scratch—without configuring a VPC, Security Group, or underlying OS.
2. **Code Implementation:** Wrote a custom Python script designed to parse incoming JSON data (`event.get('name')`) and return a dynamically generated greeting and HTTP 200 status code.
3. **Test Event Configuration:** Crafted a custom JSON test event (`{"name": "Ridham"}`) to simulate an external trigger.
4. **Execution & Validation:** Executed the function and verified the successful output within the AWS Console. Analyzed the execution logs to observe the microsecond billing duration.
