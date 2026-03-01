# 🗄️ Day 28: AWS S3, IAM & Command Line Interface (CLI)

## 📋 Project Overview
Moving away from the AWS Management Console, today's objective was to interact with AWS programmatically. I provisioned secure cloud storage using **Amazon S3**, implemented security best practices with **AWS IAM**, and used the **AWS CLI** to upload data directly from my local terminal.

## ⚙️ Core Concepts Explored
* **Amazon S3 (Simple Storage Service):** Highly scalable object storage used for backups, data lakes, and static assets.
* **AWS IAM (Identity and Access Management):** The security control plane of AWS. Used to create users and assign granular permissions (Principle of Least Privilege).
* **AWS CLI:** A unified tool to manage AWS services from the command line, essential for automation and CI/CD pipelines.

## 🛠️ Steps Executed
1. **S3 Bucket Creation:** Created a globally unique, private S3 bucket (`devops-backup-vault-...`) to act as a secure storage repository.
2. **IAM User Provisioning:** Instead of using the root account, I created a dedicated IAM User (`s3-admin`) and attached the `AmazonS3FullAccess` policy.
3. **Security Credentials:** Generated programmatic Access Keys (Access Key ID & Secret Access Key) for the new IAM user.
4. **AWS CLI Configuration:** Configured my local terminal with the generated credentials using `aws configure`, setting the default region to `ap-south-1`.
5. **Programmatic Upload:** Created a local text file and successfully pushed it to the S3 bucket using the `aws s3 cp` command. Verified the upload via `aws s3 ls`.
