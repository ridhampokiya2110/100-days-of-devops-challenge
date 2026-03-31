# 🌐 Day 49: Terraform Registry & Official AWS VPC Module

## 📋 Project Overview
Building a secure, production-grade AWS Virtual Private Cloud (VPC) from scratch requires hundreds of lines of code to configure subnets, route tables, Internet Gateways, and NAT Gateways. Today, I leveraged the **Terraform Registry** to deploy a highly available AWS VPC architecture using the official, community-verified AWS module in just 15 lines of code!

## ⚙️ Core Concepts Explored
* **Terraform Registry:** The official repository of pre-built, production-ready modules managed by HashiCorp, cloud providers, and the community.
* **Abstraction:** Hiding complex infrastructure details behind a simple module block to accelerate deployment.
* **Production VPC Architecture:** Automatically provisioning Public Subnets (for Load Balancers/Web Servers) and Private Subnets (for Databases/Backend) across multiple Availability Zones.
* **NAT Gateway:** Enabling outbound internet access for instances in private subnets without exposing them to the public internet.

## 🛠️ Execution Steps
1. **Module Sourcing:** Sourced the `terraform-aws-modules/vpc/aws` module directly from the Terraform Registry.
2. **Configuration:** Passed dynamic variables to define:
   - VPC CIDR Block (`10.0.0.0/16`)
   - 2 Availability Zones (`eu-north-1a`, `eu-north-1b`)
   - 2 Public Subnets & 2 Private Subnets
   - Enabled a single NAT Gateway to optimize costs.
3. **Execution:** Ran `terraform init` to download the remote module and `terraform apply` to provision the entire networking backbone seamlessly.
