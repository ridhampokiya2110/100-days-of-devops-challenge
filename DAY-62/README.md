# 🔄 Day 62: Terraform Loops (`count` and `for_each`)

## 📋 Project Overview
Hardcoding multiple resource blocks for similar infrastructure is highly inefficient and violates the DRY principle. Today, I mastered **Terraform Meta-Arguments (`count` and `for_each`)** to dynamically provision multiple resources from a single configuration block using loops.

## ⚙️ Core Concepts Explored
* **`count` Meta-Argument:** A simple loop that provisions a specific number of identical resources. It uses `count.index` to differentiate resources numerically (e.g., Server-0, Server-1).
* **`for_each` Meta-Argument:** The advanced and safer approach to looping. It iterates over a `map` or a `set` of strings, using `each.key` and `each.value` to create uniquely identifiable resources.
* **Sets vs. Lists:** Understanding why `for_each` requires a `set` (unordered, unique values) to prevent state file corruption when items are added or removed from the middle of the list.
* **For Expressions:** Using `[for item in collection : item.attribute]` to dynamically format and output list data to the console.

## 🛠️ Execution Steps
1. **Count Implementation:** Authored an `aws_s3_bucket` block with `count = 3` to instantly provision three numbered environment buckets.
2. **For_Each Implementation:** Defined a Terraform variable containing a `set(string)` of employee names. Used `for_each` inside an `aws_iam_user` block to programmatically generate uniquely named AWS IAM accounts.
3. **Execution:** Ran `terraform apply`. Terraform successfully iterated through the loops, generating 7 discrete AWS resources from just two logical HCL blocks.
4. **Validation:** Verified the outputs via the terminal and the AWS Console, confirming that the loop dynamically injected the correct numeric and string values into the tags and resource names.
