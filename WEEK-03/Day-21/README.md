# Day 21: AWS VPC - Building a Custom Cloud Network

## 📋 Project Overview
Instead of using the default AWS network, today I built my own **Virtual Private Cloud (VPC)** from scratch. This is the foundational networking layer where all secure cloud infrastructure resides.

## ⚙️ Architecture & Resources Created
I created a custom network topology using the AWS Management Console:

1. **VPC (`My-First-VPC`):** - **CIDR Block:** `10.0.0.0/16` (Provides 65,536 private IP addresses).
   - This acts as the outer secure boundary for my cloud resources.

2. **Public Subnet (`Public-Subnet-1`):** - **CIDR Block:** `10.0.1.0/24` (Provides 256 IP addresses).
   - Located in the `ap-south-1a` Availability Zone.

3. **Internet Gateway (`My-IGW`):**
   - Created and attached to the custom VPC to allow communication with the outside internet.

4. **Route Table (`Public-Route-Table`):**
   - Configured custom routing rules.
   - **Destination:** `0.0.0.0/0` (The Internet).
   - **Target:** `My-IGW` (The Internet Gateway).
   - Associated this Route Table explicitly with the Public Subnet.

## ✅ Result
Successfully established a custom, isolated network environment in AWS. The infrastructure is now ready to securely host EC2 instances and other resources in the next phase!