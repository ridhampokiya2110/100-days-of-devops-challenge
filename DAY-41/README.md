# 🏗️ Day 41: Introduction to Infrastructure as Code (IaC) with Terraform

## 📋 Project Overview
Clicking through the AWS Management Console is great for learning, but it is not scalable or repeatable for enterprise environments. Today, I transitioned from "ClickOps" to **Infrastructure as Code (IaC)** by provisioning an Amazon S3 bucket entirely through code using **HashiCorp Terraform**.

## ⚙️ Core Concepts Explored
* **Infrastructure as Code (IaC):** The process of managing and provisioning computer data centers through machine-readable definition files, rather than physical hardware configuration or interactive configuration tools.
* **HashiCorp Configuration Language (HCL):** The human-readable language used to write Terraform code.
* **AWS Provider:** Configuring Terraform to interact with the AWS API securely.
* **Terraform Lifecycle:** Understanding the three golden commands of Terraform deployment.

## 🛠️ Steps Executed
1. **Environment Setup:** Accessed AWS CloudShell and manually installed the Terraform CLI utility via the `yum` package manager.
2. **Writing HCL (`main.tf`):** Created a configuration file defining the AWS provider (Region: `ap-south-1`) and declared an `aws_s3_bucket` resource with custom tags.
3. **Initialization (`terraform init`):** Downloaded the necessary AWS provider plugins to initialize the working directory.
4. **Execution Plan (`terraform plan`):** Generated a dry-run execution plan to verify the exact resources Terraform would create (`+ create`).
5. **Deployment (`terraform apply`):** Executed the code, automatically provisioning the S3 bucket in my AWS account without touching the GUI.
6. **Cleanup (`terraform destroy`):** Safely and automatically tore down the infrastructure to manage cloud costs.
