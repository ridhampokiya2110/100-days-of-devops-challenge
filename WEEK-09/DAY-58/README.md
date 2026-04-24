# 🔒 Day 58: DevSecOps - Dynamic Secret Management with AWS SSM

## 📋 Project Overview
Hardcoding sensitive data (Passwords, DB Credentials, API Keys) into Terraform configuration files is a critical security vulnerability. If pushed to version control, it exposes the entire infrastructure. Today, I implemented a secure "DevSecOps" workflow by integrating **AWS Systems Manager (SSM) Parameter Store** with Terraform to fetch and inject secrets dynamically without exposing them in plaintext.

## ⚙️ Core Concepts Explored
* **Secret Management:** Storing sensitive strings outside of the codebase in a secure, encrypted cloud vault.
* **AWS SSM Parameter Store:** An AWS service providing secure, hierarchical storage for configuration data management and secrets management.
* **Terraform Data Source (`aws_ssm_parameter`):** Fetching encrypted values from AWS SSM and decrypting them dynamically at runtime (`with_decryption = true`).
* **Heredoc Syntax (`<<-EOF`):** Writing multi-line bash scripts cleanly inside the `user_data` block without external template files.

## 🛠️ Execution Steps (eu-north-1 Region)
1. **Secret Provisioning:** Used the AWS CLI to securely create a `SecureString` parameter named `/prod/api/key` in the Stockholm region.
2. **Data Source Integration:** Configured `data "aws_ssm_parameter"` to fetch and decrypt the secret during the Terraform plan/apply phase.
3. **Secure Injection:** Provisioned an Ubuntu `t3.micro` EC2 instance and utilized Terraform Heredoc syntax in the `user_data` block to inject the decrypted parameter value into a hidden `.env` file on the server.
4. **Validation:** Verified the server creation and successfully confirmed that the sensitive API key was present in the OS environment file, while remaining 100% invisible in the `main.tf` file.
