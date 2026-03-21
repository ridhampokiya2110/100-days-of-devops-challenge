# 💻 Day 42: Terraform Variables & Live EC2 Web Server Deployment

## 📋 Project Overview
Hardcoding values in infrastructure code makes it difficult to reuse. Today, I upgraded my IaC skills by introducing **Terraform Variables** to create dynamic, modular code. Using this, I fully automated the deployment of a live Apache Web Server on an AWS EC2 instance, entirely from the command line.

## ⚙️ Core Concepts Explored
* **Terraform Variables (`variables.tf`):** Separating configuration data from the core logic to make the code reusable across different environments (Dev, Test, Prod).
* **AWS Security Groups in Terraform:** Provisioning a virtual firewall (`aws_security_group`) through code to allow inbound HTTP (Port 80) traffic.
* **EC2 User Data Provisioning:** Utilizing the `user_data` argument in Terraform to automatically inject a bash script that installs and starts an Apache web server the moment the EC2 instance boots.

## 🛠️ Steps Executed
1. **Variable Configuration:** Created `variables.tf` to store dynamic inputs like `aws_region`, `instance_type`, and the `ami_id`.
2. **Resource Definition:** Wrote `main.tf` referencing the variables (e.g., `var.ec2_instance_type`).
3. **Firewall & Compute Integration:** Configured the EC2 instance block to attach the newly created Security Group ID dynamically.
4. **Automated Bootstrapping:** Injected an HTML page via the `user_data` bash script.
5. **Deployment & Validation:** Ran `terraform apply`. Once provisioned, I navigated to the EC2 Public IP in my browser and successfully viewed the live, auto-generated HTML website.
6. **Teardown:** Executed `terraform destroy` to efficiently clean up all associated resources.
