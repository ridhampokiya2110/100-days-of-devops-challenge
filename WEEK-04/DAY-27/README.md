# Day 27: AWS CloudWatch, SNS Alarms & Custom Metrics

##  Project Overview
Building infrastructure is only half the job; monitoring it is the other half. Today, I implemented a robust observability system for an EC2 instance using **Amazon CloudWatch** and **Amazon SNS**, including advanced custom metrics tracking.

##  Architecture & Core Concepts
* **Amazon CloudWatch:** The central monitoring and observability service for AWS resources.
* **Amazon SNS (Simple Notification Service):** Used to trigger automated email alerts when metric thresholds are breached.
* **CloudWatch Agent:** A system-level service installed inside the OS to push internal metrics (like RAM and Disk usage) that AWS cannot natively see from the hypervisor level.
* **IAM Roles:** Granted the EC2 instance secure permissions (`CloudWatchAgentServerPolicy`) to write metric data to CloudWatch.

##  Steps Executed
1. **Basic Monitoring & Alarms:** Created a CloudWatch Alarm to monitor `CPUUtilization`. Configured an SNS topic and subscription to send an email alert if the CPU usage exceeds 70%.
2. **IAM Configuration:** Created an IAM Role and attached it to the running EC2 instance to grant CloudWatch access.
3. **Agent Installation:** Downloaded and installed the Amazon CloudWatch Agent on an Ubuntu server via SSH.
4. **Custom Metric Tracking:** Created a JSON configuration file for the agent to specifically track `mem_used_percent` (Memory/RAM usage) and started the service using `systemctl`.
5. **Dashboard Verification:** Validated the incoming custom memory metrics under the new `CWAgent` namespace in the CloudWatch console (ensuring the correct AWS Region was selected!).
