# 🤖 Day 46: Auto Scaling Groups (ASG) & Self-Healing Architecture via Terraform

## 📋 Project Overview
Managing servers manually is inefficient and risky. Today, I upgraded my AWS infrastructure from statically provisioned EC2 instances to a fully automated, **Self-Healing Architecture** using AWS Auto Scaling Groups (ASG) and Launch Templates via Terraform.

## ⚙️ Core Concepts Explored
* **Launch Templates:** Creating a reusable blueprint for EC2 instances (defining AMI, instance type, security groups, and automated bootstrap scripts via `user_data`).
* **Auto Scaling Group (ASG):** The automated manager that ensures a specific number of instances are always running. 
* **Self-Healing / High Availability:** If a server crashes or is manually terminated, the ASG instantly detects the missing capacity and provisions a new instance to replace it.
* **ALB Integration:** Seamlessly attaching the ASG to an Application Load Balancer's Target Group so new servers automatically start receiving traffic.

## 🛠️ Execution & The "Chaos" Test
1. **Infrastructure as Code:** Wrote Terraform scripts to provision the VPC data sources, Security Groups, ALB, Launch Template, and the ASG.
2. **ASG Rules:** Configured the ASG with `desired_capacity = 2`, `min_size = 1`, and `max_size = 4`.
3. **The Chaos Validation:** To prove the self-healing capability, I manually went into the AWS Management Console and terminated one of the running EC2 instances. 
4. **Result:** Within minutes, the ASG detected the health check failure and automatically spun up a brand-new instance, maintaining the desired capacity of 2 without any manual intervention.

