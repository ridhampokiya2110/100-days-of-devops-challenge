# 🔒 Day 33: Free SSL/TLS Certificates with AWS Certificate Manager (ACM)

## 📋 Project Overview
Security is not an afterthought; it's a prerequisite. Today, I focused on securing web traffic by generating a public SSL/TLS certificate using **AWS Certificate Manager (ACM)** and validating domain ownership via **Amazon Route 53**.

## ⚙️ Core Concepts Explored
* **AWS Certificate Manager (ACM):** A service that lets you easily provision, manage, and deploy public and private Secure Sockets Layer/Transport Layer Security (SSL/TLS) certificates.
* **Wildcard Certificates:** Requested a certificate for both the root domain (`example.com`) and all subdomains (`*.example.com`) using a single certificate to save time and effort.
* **DNS Validation:** The most robust and recommended method to prove domain ownership to AWS by adding a specific `CNAME` record to the DNS configuration.

## 🛠️ Steps Executed
1. **Certificate Request:** Navigated to the ACM console (specifically in the `us-east-1` region for future CloudFront compatibility) and requested a public certificate.
2. **Domain Configuration:** Entered the custom domain name and added a wildcard entry to ensure comprehensive coverage.
3. **Validation Setup:** Selected "DNS Validation" over Email Validation for a fully automated renewal process.
4. **Route 53 Integration:** Utilized the "Create records in Route 53" feature to automatically inject the required `CNAME` validation record into my existing Hosted Zone.
