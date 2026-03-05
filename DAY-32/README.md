# 🌍 Day 32: Domain Name System (DNS) with Amazon Route 53

## 📋 Project Overview
IP addresses are for machines; domain names are for humans! Today, I explored the networking backbone of the internet by setting up **Amazon Route 53**, AWS's highly available and scalable Cloud Domain Name System (DNS) web service. 

## ⚙️ Core Concepts Explored
* **DNS (Domain Name System):** The "phonebook" of the internet that translates human-readable domain names (like `example.com`) into IP addresses (`192.0.2.1`).
* **Amazon Route 53:** AWS's premium DNS service, operating reliably on Port 53.
* **Hosted Zones:** A container for records that define how traffic is routed for a specific domain and its subdomains.
* **DNS Records:** * **NS (Name Server):** The authoritative servers holding the DNS records for the domain.
  * **SOA (Start of Authority):** Contains core administrative information about the zone.
  * **A, CNAME, and AWS Alias Records:** Concepts on how to map domains to standard IPs versus dynamic AWS resources (like ALBs or CloudFront).

## 🛠️ Steps Executed
1. **Hosted Zone Creation:** Navigated to the Route 53 dashboard and provisioned a new Public Hosted Zone for a custom domain (leveraging AWS Promotional Credits to cover the non-free tier cost).
2. **Record Analysis:** Examined the automatically generated `NS` (Name Server) and `SOA` (Start of Authority) records.
3. **Nameserver Delegation:** Understood the process of taking the 4 AWS-provided Name Servers and configuring them within a third-party domain registrar (like GoDaddy/Namecheap) to hand over DNS resolution control to AWS.
