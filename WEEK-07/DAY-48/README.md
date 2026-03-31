# 🧩 Day 48: Terraform Modules & The DRY Principle

## 📋 Project Overview
Writing all infrastructure code in a single `main.tf` file is not scalable. Today, I advanced my Terraform skills by implementing **Terraform Modules**. I built a custom, reusable blueprint for AWS EC2 instances and used it to provision different environments, adhering to the **DRY (Don't Repeat Yourself)** principle.

## ⚙️ Core Concepts Explored
* **Terraform Modules:** Self-contained packages of Terraform configurations that are managed as a group. They act like "functions" in programming.
* **The DRY Principle:** Eliminating redundant code by creating a single source of truth (the module) and calling it multiple times with different parameters.
* **Input Variables (`variables.tf`):** Passing dynamic values (like AMI ID, instance type, and tags) from the root module into the child module.

## 🛠️ Execution Steps
1. **Built the Blueprint (Child Module):** 
   - Created a directory structure `modules/ec2`.
   - Defined the expected inputs in `variables.tf`.
   - Created the actual EC2 resource in `main.tf` using those variables instead of hardcoded values.
2. **Called the Module (Root Module):**
   - In the master `main.tf`, I invoked the custom `ec2` module twice.
   - **Dev Environment:** Passed variables for a smaller instance (`t3.micro`).
   - **Prod Environment:** Passed variables for a larger instance (`t3.small`).
3. **Applied the Infrastructure:** Ran `terraform init` to initialize the local module and `terraform apply` to provision both environments simultaneously.
