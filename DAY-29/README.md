# 🌐 Day 29: Serverless Static Website Hosting with Amazon S3

## 📋 Project Overview
Why pay for an EC2 server running 24/7 just to host a simple HTML landing page? Today, I explored the power of **Serverless Architecture** by hosting a highly available, static website entirely on **Amazon S3**. 

## ⚙️ Core Concepts Explored
* **Serverless Hosting:** Eliminating the need to provision, patch, or manage underlying operating systems (like Linux) or web servers (like Apache/Nginx).
* **S3 Static Website Hosting:** An S3 feature that serves HTML, CSS, and client-side JavaScript directly to web browsers.
* **S3 Bucket Policies:** Writing JSON-based IAM policies to grant public read access (`s3:GetObject`) to specific bucket resources.

## 🛠️ Steps Executed
1. **Bucket Provisioning:** Created a new S3 bucket configured specifically for public access (disabling the "Block all public access" safeguard with intent).
2. **Asset Upload:** Uploaded custom `index.html` (the main landing page) and `error.html` (for 404 routing) files.
3. **Feature Activation:** Enabled the "Static website hosting" property on the S3 bucket and mapped the index and error documents.
4. **Security Configuration:** Authored and attached a custom JSON Bucket Policy to allow anonymous public read access to all objects within the bucket.

## ✅ Result & Validation
Successfully accessed the website via the globally available S3 endpoint URL. The page loaded instantly, demonstrating a highly scalable, zero-maintenance, and incredibly cost-effective hosting solution.