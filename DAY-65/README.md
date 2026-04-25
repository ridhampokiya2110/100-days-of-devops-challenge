# 🧠 Day 65: Advanced Terraform - Dynamic Blocks

## 📋 Project Overview
Hardcoding multiple nested blocks (like `ingress` rules in a Security Group) makes Terraform configuration files bloated and hard to maintain. Today, I implemented **Terraform Dynamic Blocks** to programmatically generate nested configuration blocks on the fly based on a list of variables.

## ⚙️ Core Concepts Explored
* **Dynamic Blocks (`dynamic`):** A specialized Terraform construct used to dynamically construct repeatable nested blocks (like `ingress`, `egress`, or `tag` blocks) inside a resource.
* **The `content` Block:** The inner block where the actual resource arguments are defined, mapping the iterated values to the configuration.
* **Variable Lists (`list(number)`):** Passing arrays of data to drive the automation logic inside the dynamic block.

## 🛠️ Execution Steps
1. **Variable Definition:** Created a `list(number)` variable containing multiple ports (22, 80, 443, 8080, 9090).
2. **Dynamic Logic:** Authored an `aws_security_group` resource, replacing multiple hardcoded `ingress` blocks with a single `dynamic "ingress"` block.
3. **Iteration:** Used `for_each` to iterate over the port list, assigning `ingress.value` to the `from_port` and `to_port` arguments inside the `content` block.
4. **Validation:** Executed `terraform apply` and verified via the AWS Console that the Security Group successfully provisioned 5 distinct inbound rules dynamically from a single code block.

