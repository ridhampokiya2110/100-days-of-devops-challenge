# 🛡️ Day 54: Terraform Lifecycle Meta-Arguments (Zero-Downtime & Protection)

## 📋 Project Overview
Managing cloud infrastructure isn't just about creating resources; it's about protecting them from accidental deletion and ensuring seamless updates. Today, I implemented **Terraform Lifecycle Rules** to achieve zero-downtime server updates and bulletproof critical data storage against accidental `terraform destroy` commands.

## ⚙️ Core Concepts Explored
* **`prevent_destroy`:** A hard safety lock. If applied to a resource (like a Production Database or S3 bucket), Terraform will explicitly reject any attempt to destroy it.
* **`create_before_destroy`:** Reverses the default Terraform behavior. Instead of destroying the old resource before creating the replacement (which causes application downtime), Terraform creates the new resource first, and only destroys the old one once the new one is running.
* **`ignore_changes`:** Instructs Terraform to ignore specific manual changes made via the AWS Console (e.g., manual tagging), preventing Terraform from overwriting them on the next apply.

## 🛠️ Execution Steps (eu-north-1 Region)
1. **Critical Storage:** Provisioned an AWS S3 bucket with the `prevent_destroy = true` lifecycle rule.
2. **High-Availability Server:** Provisioned an EC2 instance (`t3.micro`) with `create_before_destroy = true` and `ignore_changes = [tags]`.
3. **Disaster Simulation:** Ran `terraform destroy`. The execution successfully **failed**, proving the S3 bucket was locked and safeguarded from accidental deletion.
4. **Update Simulation:** Changed the EC2 instance type to simulate an upgrade. Terraform successfully provisioned the new server before terminating the old one.
