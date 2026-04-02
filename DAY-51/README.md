# 🔄 Day 51: Advanced Terraform - Loops & Meta-Arguments (`for_each`)

## 📋 Project Overview
Writing repetitive code blocks for multiple identical or similar resources is inefficient and hard to maintain. Today, I advanced my Infrastructure as Code (IaC) skills by implementing **Terraform Meta-Arguments**, specifically the `for_each` loop, to provision a multi-tier fleet of servers from a single resource block.

## ⚙️ Core Concepts Explored
* **`for_each` Meta-Argument:** A looping mechanism in Terraform that iterates over a map or a set of strings to create multiple resource instances dynamically.
* **Maps & Locals:** Defining a complex data structure (Map of Objects) in a `locals` block to store the unique configurations (instance size, name) for each server in the fleet.
* **Dynamic Indexing (`each.key` & `each.value`):** Extracting specific values during the loop iteration to dynamically assign instance types and tags to AWS resources.

## 🛠️ Execution Steps (eu-north-1 Region)
1. **Defined the Fleet:** Created a `locals` block containing a map of three distinct servers: Frontend (`t3.micro`), Backend (`t3.small`), and Database (`t3.micro`).
2. **The Loop:** Written a single `aws_instance` block and attached the `for_each = local.project_servers` argument.
3. **Deployment:** Ran `terraform apply`. Terraform automatically iterated through the map and provisioned all 3 servers in parallel, assigning the correct sizes and tags dynamically.
