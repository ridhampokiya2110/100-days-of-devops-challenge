# 🚂 Day 39: Decoupling Microservices with Amazon SQS

## 📋 Project Overview
Tightly coupled architectures (like API -> Lambda -> Database) are prone to crashing during massive traffic spikes. Today, I solved this problem by introducing a "Buffer" into the system using **Amazon SQS (Simple Queue Service)** to build a highly scalable, decoupled microservices architecture.

## ⚙️ Core Concepts Explored
* **Tight vs. Loose Coupling:** Understanding why direct communication between services is risky under heavy load and how a message queue decouples them.
* **Amazon SQS:** AWS's fully managed message queuing service that enables asynchronous communication between distributed components.
* **Producer-Consumer Model:** * **Producer:** The system (like a frontend app or API) that sends messages into the queue.
  * **Consumer:** The backend worker (like an EC2 instance or Lambda function) that polls the queue, processes the message, and deletes it.
* **Polling:** The mechanism by which consumers retrieve messages from the SQS queue.

## 🛠️ Steps Executed
1. **Queue Provisioning:** Created a Standard SQS Queue named `DevOps-Order-Queue` via the AWS Console.
2. **Message Production:** Acted as a frontend Producer and published a JSON-formatted order message (e.g., `"orderId": "ORD-999"`) into the queue.
3. **Message Consumption:** Acted as a backend Consumer, manually polled the queue, and successfully retrieved and inspected the message payload.
4. **Validation:** Confirmed that the message successfully sat in the waiting line (queue) until the consumer was ready to read it.