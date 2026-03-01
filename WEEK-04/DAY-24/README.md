# 🛡️ Day 24: Secure Access using a Bastion Host (Jump Server)

## 📋 Project Overview
A private subnet is secure because it blocks direct internet access. But how do administrators manage servers inside it? Today, I solved this by implementing a **Bastion Host (Jump Box)** architecture.

## ⚙️ Architecture & Flow
**Laptop ➡️ (SSH via Public IP) ➡️ Bastion Host (Public Subnet) ➡️ (SSH via Private IP) ➡️ Private DB Server (Private Subnet)**

## 🛠️ Steps Executed
1. **Infrastructure Prep:** Ensured one EC2 instance was running in the Public Subnet (Bastion) and one in the Private Subnet (Target).
2. **Key Management:** Securely transferred my SSH private key (`.pem`) contents to the Bastion host using the `nano` editor and secured it with `chmod 400`.
3. **The First Jump:** SSH'd into the Bastion Host from my local machine over the public internet.
4. **The Second Jump:** From inside the Bastion Host, I initiated an SSH connection to the Private EC2 instance using its internal Private IP (`10.0.2.x`).

## ✅ Result
Successfully established a terminal session inside a fully isolated Private EC2 instance. This is the industry-standard method for securely managing backend databases and internal microservices.