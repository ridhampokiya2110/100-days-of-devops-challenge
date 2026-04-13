# 🔍 Day 57: Dynamic Data Sources & `templatefile()` Function

## 📋 Project Overview
Hardcoding values like AMI IDs and inline bash scripts is an anti-pattern that leads to broken pipelines and messy codebases. Today, I engineered a fully dynamic Terraform deployment. I utilized the `aws_ami` data source to automatically fetch the latest Ubuntu OS image and used the `templatefile()` function to dynamically inject variables into an external shell script.

## ⚙️ Core Concepts Explored
* **Dynamic Data Sources (`data "aws_ami"`):** Querying the AWS API during the `terraform plan` phase to retrieve the most up-to-date attributes (like the newest AMI ID) based on specific filters.
* **`templatefile()` Function:** A built-in Terraform function that reads a file at a given path and renders its contents as a string, dynamically replacing variable placeholders with assigned values.
* **Separation of Concerns:** Moving bulky bash scripting out of the main Terraform configuration file (`main.tf`) and into its own template file (`.tpl`), keeping the IaC code clean and readable.

## 🛠️ Execution Steps (eu-north-1 Region)
1. **The Template:** Created `install.sh.tpl` containing a bash script to install Apache, using placeholders like `${environment}` and `${department}`.
2. **Dynamic AMI Query:** Configured a `data` block to query the official Canonical AWS account and filter for the latest `ubuntu-jammy-22.04` HVM image.
3. **Resource Provisioning:** Deployed a `t3.micro` EC2 instance, assigning `data.aws_ami.latest_ubuntu.id` to the AMI argument.
4. **Variable Injection:** Used `user_data = templatefile("install.sh.tpl", { ... })` to pass dynamic strings into the bash script during the server boot cycle.
5. **Validation:** Accessed the deployed public IP via a web browser and verified that the injected variables successfully rendered on the live Apache index page.

