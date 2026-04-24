# 🌍 Day 63: Environment Isolation with Terraform Workspaces

## 📋 Project Overview
Managing multiple environments (Development, Staging, Production) usually leads to duplicated code folders, which is a maintenance nightmare. Today, I engineered a highly scalable IaC architecture using **Terraform Workspaces**. This allowed me to provision completely isolated environments using a single, unified `main.tf` codebase.

## ⚙️ Core Concepts Explored
* **Terraform Workspaces:** Isolated state files within the same working directory. Each workspace manages its own set of infrastructure independently of the others.
* **The `${terraform.workspace}` Variable:** A built-in Terraform variable that dynamically outputs the name of the currently active workspace.
* **Local Values (`locals`):** Defining a map of variables within the configuration to centralize logic.
* **The `lookup()` Function:** A dynamic function used to query the `locals` map and select specific resource attributes (like Instance Size) based on the active workspace name.

## 🛠️ Execution Steps
1. **Dynamic Configuration:** Engineered a `main.tf` file utilizing `locals` to map instance sizes (`t3.micro` for Dev, `t3.small` for Prod) based on the active workspace.
2. **Dev Deployment:** Executed `terraform workspace new dev` and ran `terraform apply`. Provisioned a cost-effective `t3.micro` Dev server.
3. **Prod Deployment:** Executed `terraform workspace new prod` and ran `terraform apply` *without altering a single line of code*. Terraform utilized a fresh state file to provision a highly-available `t3.small` Prod server.
4. **Validation:** Accessed the AWS Console and verified the simultaneous existence of two completely distinct servers (`Day63-Server-dev` and `Day63-Server-prod`), successfully achieving environment isolation from a single repository.

