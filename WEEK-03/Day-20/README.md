# 🛡️ Day 20: AWS IAM (Identity and Access Management)

## 📋 Project Overview
Security is paramount in DevOps. Today, I explored **AWS IAM** to secure the AWS environment by applying the **Principle of Least Privilege (PoLP)**. I learned why using the AWS Root Account for daily tasks is a bad practice and created a restricted IAM User instead.

## ⚙️ Key Concepts Learned
* **Root User vs. IAM User:** Security best practices for AWS accounts.
* **IAM Policies:** JSON documents that define granular permissions.
* **Principle of Least Privilege:** Granting only the permissions required to perform a specific task.

## 🛠️ Steps Executed
1. **Created an IAM User:** Generated a new user profile with AWS Management Console access.
2. **Attached Policies:** Directly attached the `AmazonEC2ReadOnlyAccess` policy to the user.
3. **Security Testing:** Logged in as the new IAM user via an Incognito window.