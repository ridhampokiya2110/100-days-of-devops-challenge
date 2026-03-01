#  Day 26: AWS Auto Scaling Groups (ASG) & High Availability

##  Project Overview
Following the implementation of an Application Load Balancer (ALB) on Day 25, today's objective was to automate the scaling process. I configured an **AWS Auto Scaling Group (ASG)** to automatically launch or terminate EC2 instances based on demand, ensuring high availability and cost optimization without manual intervention.

##  Architecture & Core Concepts
* **Launch Template:** A saved blueprint containing the AMI (Ubuntu), Instance Type (`t2.micro`), Security Groups, Key Pair, and User Data script required to automatically provision new web servers.
* **Auto Scaling Group (ASG):** The automation engine that maintains the desired number of instances and dynamically scales out/in within defined limits (Min: 1, Max: 3).
* **Self-Healing:** Configured the ASG to use Elastic Load Balancing (ELB) health checks. If an instance becomes unresponsive, the ASG automatically terminates and replaces it.

##  Steps Executed
1. **Created a Launch Template:** Embedded a bash script in the User Data to automatically install and start the Apache web server on boot.
2. **Target Group & ALB Setup:** Provisioned an internet-facing ALB spanning multiple Availability Zones (`ap-south-1a` and `ap-south-1b`) and an empty Target Group.
3. **ASG Configuration:** - Linked the ASG to the previously created Launch Template and Target Group.
   - Set the capacity rules: `Desired capacity = 1`, `Minimum capacity = 1`, `Maximum capacity = 3`.
   - Enabled ELB health checks for accurate instance monitoring.
