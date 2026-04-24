# 📦 Day 61: Mastering Terraform Modules (DRY Principle)

## 📋 Project Overview
Writing thousands of lines of code in a single `main.tf` file leads to unmaintainable, error-prone "Spaghetti Code." Today, I elevated my Infrastructure as Code architecture by implementing **Terraform Modules**. By adhering to the DRY (Don't Repeat Yourself) principle, I created reusable infrastructure templates that can be called multiple times with different parameters.

## ⚙️ Core Concepts Explored
* **Terraform Modules:** Self-contained packages of Terraform configurations that are managed as a group.
* **DRY Principle:** Reducing repetition of software patterns. Replacing hardcoded resources with dynamic variables.
* **Module Sourcing:** Using the `source` argument to point to local directories containing reusable configuration blocks.
* **Variable Passing:** Injecting dynamic arguments (like `instance_size` and `server_name`) from the root module into the child module.

## 🛠️ Execution Steps
1. **Module Creation:** Created a standard file structure `modules/ec2_server/` containing its own `main.tf` and `variables.tf`.
2. **Template Definition:** Authored a generic EC2 resource block inside the module that relies entirely on input variables (`var.ami_id`, `var.instance_size`).
3. **Root Configuration:** Kept the root `main.tf` clean by using `module` blocks instead of `resource` blocks.
4. **Instantiation:** Called the custom module twice:
   - Once to provision a `t3.micro` Frontend Server.
   - Once to provision a `t3.small` Backend Server.
5. **Initialization & Deployment:** Ran `terraform init` to initialize the local modules, followed by `terraform apply` to provision the infrastructure perfectly.
