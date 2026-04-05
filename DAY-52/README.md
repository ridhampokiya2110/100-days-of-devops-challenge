# ⚡ Day 52: Terraform Dynamic Blocks - Automating Nested Rules

## 📋 Project Overview
Continuing my deep dive into advanced Terraform syntax, today I tackled the challenge of repetitive nested blocks. Instead of manually defining multiple Inbound Rules (ingress) for an AWS Security Group, I utilized **Terraform Dynamic Blocks** to generate them automatically from a list of ports, making the code incredibly clean and scalable.

## ⚙️ Core Concepts Explored
* **Dynamic Blocks:** A powerful feature used to construct nested repeatable blocks (like `ingress` or `egress` inside a security group) dynamically.
* **Complex Data Sources:** Combined `aws_subnets` and `aws_subnet` data blocks to intelligently fetch the correct `vpc_id` in the Stockholm (`eu-north-1`) region to avoid default VPC dependency errors.
* **Iterative Configuration:** Using a `locals` list array combined with `for_each` inside the `dynamic` block to iterate over port numbers.

## 🛠️ Execution Steps
1. **Defined Data:** Created a list of required ports (`[22, 80, 443, 8080, 9000]`) in the `locals` block.
2. **Dynamic Generation:** Inside the `aws_security_group` resource, I wrote a single `dynamic "ingress"` block.
3. **The Content Iteration:** Mapped `from_port` and `to_port` to `ingress.value` so Terraform could inject each port dynamically.
4. **Validation:** Executed `terraform apply` and successfully provisioned a security group with 5 flawlessly configured inbound rules attached to a `t3.micro` EC2 instance.

## ✅ Conclusion
Using Dynamic Blocks reduces hundreds of lines of static configuration into a highly maintainable, 10-line logic block. Adding a new firewall port is now as simple as adding a single number to an array!