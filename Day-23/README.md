# 🔒 Day 23: AWS VPC - Private Subnets & NAT Gateways

## 📋 Project Overview
Today I advanced my AWS networking skills by setting up a **Private Subnet** and a **NAT Gateway**. This architecture is standard industry practice for securing backend servers and databases.

## ⚙️ Architecture Built
1. **Private Subnet:** Created `Private-Subnet-1` (`10.0.2.0/24`) inside my custom VPC. Instances here get NO public IP.
2. **NAT Gateway:** Deployed a NAT Gateway in the *Public* Subnet and assigned it an Elastic IP. This acts as a one-way valve for internet access.
3. **Private Route Table:** Created a custom routing table for the private subnet, routing all outbound internet traffic (`0.0.0.0/0`) through the NAT Gateway.
4. **EC2 Deployment:** Launched a private server to validate the architecture. 

## 🛡️ Security Concept (The Vault)
Servers in the private subnet are completely shielded from direct inbound internet traffic. They can download updates (via the NAT Gateway), but hackers cannot initiate a connection from the outside.

**Note:** The NAT Gateway and Elastic IP were successfully deleted post-lab to optimize cloud costs.