# 🗄️ Day 47: Terraform Remote Backend (S3 & DynamoDB State Locking)

## 📋 Project Overview
Storing the `terraform.tfstate` file locally is highly risky and makes team collaboration impossible. Today, I upgraded my Terraform architecture by migrating the local state file to a secure, remote **AWS S3 Bucket** and implemented **State Locking** using **Amazon DynamoDB**.

## ⚙️ Core Concepts Explored
* **Remote Backend (S3):** Centralizing the state file in the cloud so the entire team works from the exact same infrastructure source of truth.
* **State Locking (DynamoDB):** Preventing race conditions. If Developer A is running `terraform apply`, DynamoDB locks the state so Developer B cannot make conflicting changes at the same time.
* **State Versioning:** Enabled S3 versioning to keep a history of state files, allowing easy rollback if the state gets corrupted.

## 🛠️ Execution Steps
1. **Provisioned Storage:** Wrote Terraform code to create a unique S3 bucket with versioning enabled.
2. **Provisioned Lock Table:** Created a DynamoDB table with a `LockID` primary key.
3. **Applied Infrastructure:** Ran `terraform apply` to create the S3 bucket and DynamoDB table first.
4. **Backend Migration:** Added the `backend "s3"` configuration block to `main.tf` and ran `terraform init` to seamlessly migrate the local state file to the remote S3 bucket.
