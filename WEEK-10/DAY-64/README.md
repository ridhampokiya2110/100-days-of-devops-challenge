# 🧠 Day 64: Writing Clean Code with Terraform Dynamic Blocks

## 📋 Project Overview
Hardcoding dozens of nested blocks (like `ingress` rules inside an AWS Security Group) makes Terraform configuration files excessively long and difficult to maintain. Today, I solved this problem by utilizing **Terraform Dynamic Blocks**. This advanced feature allows for the programmatic generation of nested blocks via iteration, drastically reducing code repetition.

## ⚙️ Core Concepts Explored
* **Nested Blocks in Terraform:** Elements like `ingress` and `egress` inside an `aws_security_group`, or `tag` blocks inside an Auto Scaling Group, which traditionally require repetitive copy-pasting.
* **Dynamic Blocks (`dynamic "name"`):** A special Terraform construct that acts like a `for_each` loop, but specifically for generating repeatable nested blocks instead of full top-level resources.
* **The `content` Block:** The inner template inside a dynamic block that defines exactly what each generated block should look like, utilizing the iterator value (`<name>.value`).
* **List Variables:** Passing an array of values (`list(number)`) directly into the dynamic block iterator.

## 🛠️ Execution Steps
1. **Variable Configuration:** Declared a `list(number)` variable containing five distinct ports (`[22, 80, 443, 8080, 9090]`).
2. **Resource Definition:** Created an `aws_security_group` resource and replaced traditional hardcoded `ingress` rules with a single `dynamic "ingress"` construct.
3. **Loop Logic:** Instructed the dynamic block to iterate over the port list, mapping the current `ingress.value` to both the `from_port` and `to_port` attributes dynamically.
4. **Validation:** Executed `terraform plan` to visually verify that Terraform expanded the single dynamic block into five distinct ingress rules. Applied the code and verified the precise inbound configurations within the AWS Console.
