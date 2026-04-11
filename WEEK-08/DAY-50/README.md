# 🏆 Day 50: Terraform Workspaces & Conditional Logic

## 📋 Project Overview
Halfway through the 100-Days of DevOps challenge! 🎉 Today, I optimized multi-environment deployments (Dev vs. Prod) by implementing **Terraform Workspaces**. Instead of duplicating code folders or manually changing variables, I used a single codebase that dynamically adapts based on the active workspace.

## ⚙️ Core Concepts Explored
* **Terraform Workspaces:** Isolated state files (`terraform.tfstate`) for the same configuration directory. Perfect for managing parallel environments like `dev`, `staging`, and `prod`.
* **Conditional Expressions (`? :`):** Writing intelligent Terraform code that evaluates the current environment and provisions resources accordingly.
* **Local Values (`locals`):** Assigning expressions to temporary variables to keep the main resource blocks clean and readable.

## 🛠️ Execution Steps
1. **Workspace Creation:** Initialized multiple environments using `terraform workspace new dev` and `terraform workspace new prod`.
2. **Dynamic Code Configuration:** Utilized the `${terraform.workspace}` variable in `main.tf` to implement conditional sizing:
   - *Logic:* `terraform.workspace == "prod" ? "t3.small" : "t3.micro"`
3. **Deployment:** - Selected the `dev` workspace and applied. Terraform provisioned a small `t3.micro` instance named `Day50-Server-dev`.
   - Switched to the `prod` workspace and applied. Terraform automatically provisioned a larger `t3.small` instance named `Day50-Server-prod` without altering a single line of code.

commands:-
    terraform workspace new dev
    terraform workspace new prod