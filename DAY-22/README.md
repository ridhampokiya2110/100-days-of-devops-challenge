# 🚀 Day 22: Launching EC2 inside a Custom VPC

## 📋 Project Overview
After building a custom Virtual Private Cloud (VPC) on Day 21, today's objective was to deploy an operational EC2 server into that specific network environment to validate the routing and internet gateway configurations.

## ⚙️ Deployment Steps Executed
1. **EC2 Instance Creation:** Initiated a new Ubuntu `t2.micro` instance.
2. **Custom Network Assignment:** Overrode the AWS default settings and assigned the instance to `My-First-VPC` and `Public-Subnet-1`.
3. **Public IP Allocation:** Enabled "Auto-assign public IP" to ensure the instance was reachable from the public internet.
4. **Security Group:** Created a new Security Group (`VPC-Web-SG`) explicitly allowing Inbound SSH (Port 22) and HTTP (Port 80) traffic.

## ✅ Result & Validation
* Successfully connected to the instance via SSH.
* The internal IP of the server verified that it was running inside my custom CIDR block  rather than the AWS default network.
* The successful SSH connection proves that the Internet Gateway (IGW) and Route Tables created on Day 21 are routing traffic flawlessly!