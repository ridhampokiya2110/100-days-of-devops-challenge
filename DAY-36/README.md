# 🗄️ Day 36: The Serverless Database with Amazon DynamoDB

## 📋 Project Overview
Traditional SQL databases require provisioning servers and defining rigid schemas before writing a single line of data. Today, I completed my "Serverless Trinity" (API + Compute + Database) by deploying **Amazon DynamoDB**, a highly scalable, serverless NoSQL database.

## ⚙️ Core Concepts Explored
* **NoSQL vs. SQL:** Understanding the shift from relational tables with fixed columns to flexible, document-style data structures.
* **Serverless Databases:** Eliminating the need for underlying EC2 instances, OS patching, and manual scaling.
* **DynamoDB Architecture:** Grasping the concept of Tables, Items (rows), and Attributes (columns).
* **Partition Keys:** Designing the primary key structure (`UserId`) to uniquely identify and retrieve items in milliseconds.

## 🛠️ Steps Executed
1. **Table Provisioning:** Created a DynamoDB table named `DevOps-Users` directly from the AWS Console.
2. **Schema Definition:** Configured a single String Partition Key (`UserId`) without having to pre-define any other data columns.
3. **Data Insertion (Items):** Manually injected a test item into the table.
4. **Dynamic Attributes:** Demonstrated NoSQL flexibility by adding dynamic attributes (`Name`, `Role`) on the fly, proving that each item can have its own unique structure.
