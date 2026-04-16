# 🌍 Day 60: Multi-Region Deployments with Terraform Provider Aliases

## 📋 Project Overview
Deploying infrastructure to a single AWS region is risky; if that region experiences an outage, the application goes offline. Today, I engineered a global Disaster Recovery (DR) architecture by deploying resources simultaneously to two different AWS regions (Stockholm and Mumbai) using a single Terraform configuration file and **Provider Aliases**.

## ⚙️ Core Concepts Explored
* **Multi-Region Architecture:** Distributing infrastructure across geographical locations to ensure high availability and disaster recovery.
* **Provider Aliases (`alias`):** Configuring multiple instances of the same provider (AWS) within a single Terraform configuration.
* **Explicit Provider Mapping:** Using the `provider = aws.<alias_name>` meta-argument inside resource blocks to override the default provider and target a specific region.
* **Regional AMI Handling:** Dynamically fetching region-specific Amazon Machine Images (AMIs) using localized data sources.

## 🛠️ Execution Steps
1. **Provider Setup:** Defined a default AWS provider targeting `eu-north-1` (Stockholm) and a secondary provider with the alias `mumbai` targeting `ap-south-1`.
2. **Dynamic Data Fetching:** Created two separate `aws_ami` data blocks, explicitly binding one to the Mumbai provider to fetch the correct localized AMI ID.
3. **Primary Deployment:** Provisioned an EC2 instance (`t3.micro`) using the default provider, establishing the Primary Active server in Europe.
4. **DR Deployment:** Provisioned a backup EC2 instance (`t2.micro`) and attached `provider = aws.mumbai`, successfully spinning up the Passive DR server in India.
5. **Validation:** Executed `terraform apply` and verified via the AWS Console that both resources were provisioned in their respective geographic regions simultaneously.

