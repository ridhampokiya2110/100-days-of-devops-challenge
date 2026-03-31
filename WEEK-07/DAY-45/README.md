# ⚖️ Day 45: High Availability with AWS Application Load Balancer (ALB) via Terraform

## 📋 Project Overview
A single server is a single point of failure. Today, I leveled up my cloud architecture by designing a **High Availability (HA)** environment. Using Terraform, I provisioned two separate Ubuntu web servers and placed an AWS Application Load Balancer (ALB) in front of them to intelligently distribute incoming HTTP traffic.

## ⚙️ Core Concepts Explored
* **High Availability (HA):** Ensuring a system remains operational and accessible even if individual components fail.
* **Application Load Balancer (ALB):** AWS's Layer 7 load balancer that routes traffic based on advanced application-level information.
* **Target Groups & Health Checks:** Configuring the ALB to continuously monitor the health of registered EC2 instances and route traffic only to healthy nodes.
* **Availability Zones (AZs) & Subnets:** Dynamically fetching VPC subnets using Terraform Data Sources (`data.aws_subnets`) to ensure the ALB spans across multiple AZs.

## 🛠️ Steps Executed & Debugging Real-World Errors
1. **The Infrastructure:** Wrote a comprehensive HCL script to provision a Security Group, two Ubuntu EC2 instances (with Apache bootstrapped via `user_data`), an ALB, a Target Group, and a Listener.
2. **The Output:** Configured `outputs.tf` to automatically retrieve the Load Balancer's DNS name.
3. **The `503 Service Unavailable` Error:** Encountered a real-world routing issue where the ALB returned a 503 error. 
4. **Root Cause Analysis (The "Unused" AZ Issue):** Investigated the AWS Console and found the Target Group status was "Unused". The EC2 instances were provisioned in an Availability Zone (AZ 3) that was not explicitly included in the ALB's subnet list.
5. **The Fix:** Modified the Terraform data source to fetch *all* default subnets (`subnets = data.aws_subnets.default.ids`), ensuring the ALB had visibility across the entire region.
6. **Validation:** Applied the fix, verified the Target Group health checks turned "Healthy", and successfully demonstrated traffic switching between Server 1 and Server 2 upon browser refresh.
