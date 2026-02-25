# ⚖️ Day 25: AWS Application Load Balancer (ALB) & High Availability

## 📋 Project Overview
A single server is a single point of failure. Today, I learned how to achieve **High Availability** and handle more traffic by distributing incoming requests across multiple servers using an **AWS Application Load Balancer (ALB)**.

## ⚙️ Architecture & Concepts
* **Target Group:** A logical grouping of EC2 instances that will receive the traffic.
* **Application Load Balancer (ALB):** The "manager" that sits in front of the servers, receives public HTTP traffic, and intelligently routes it to healthy instances in the Target Group.
* **Availability Zones (AZs):** Deployed servers in different physical data centers (`ap-south-1a` and `ap-south-1b`) to ensure the application stays online even if one data center goes down.

## 🛠️ Steps Executed
1. **Provisioned Web Servers:** Launched two EC2 instances in different AZs.
2. **Automated Setup:** Used AWS User Data scripts to automatically install and start the Apache2 web server on boot.
3. **Customized Web Pages:** Overwrote the default Apache `index.html` to display "Hello from Server 1" and "Hello from Server 2" to verify traffic routing.
4. **Target Group Creation:** Registered both EC2 instances into a new Target Group (`My-Chef-Team`).
5. **ALB Configuration:** Created an internet-facing ALB, attached the appropriate Security Groups (allowing Port 80), and routed the default listener to my Target Group.

## ✅ Result & Validation
Successfully accessed the ALB's public DNS URL. By simply refreshing the browser, I observed the load balancer dynamically switching the traffic between Server 1 and Server 2. 
