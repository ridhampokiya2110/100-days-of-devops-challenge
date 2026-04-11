# 🌐 Day 56: Terraform Remote-Exec & Automated SSH Keys

## 📋 Project Overview
Continuing from local provisioners, today I tackled in-server configuration management using the **Terraform `remote-exec` Provisioner**. Furthermore, to completely eliminate manual "ClickOps", I used the TLS provider to automatically generate and manage AWS SSH Key Pairs entirely within Terraform!

## ⚙️ Core Concepts Explored
* **`remote-exec` Provisioner:** Executes shell commands inside the newly provisioned cloud instance over SSH or WinRM.
* **`connection` Block:** Instructs Terraform on how to authenticate with the target resource (specifying the protocol, user, and private key).
* **Automated Key Management (`tls_private_key`):** Generating secure RSA keys natively via Terraform, creating the AWS Key Pair, and saving the `.pem` file locally.

## 🛠️ Execution Steps (eu-north-1 Region)
1. **Dynamic SSH Key:** Configured `tls_private_key` and `aws_key_pair` to generate a 4096-bit RSA key dynamically during deployment.
2. **Security & Networking:** Created a Security Group allowing ingress on Port 22 (SSH) and Port 80 (HTTP).
3. **Provisioning & Connection:** Deployed an Ubuntu `t3.micro` EC2 instance. Bound the `connection` block to the newly generated private key and the server's public IP.
4. **Remote Execution:** Used `remote-exec` with an inline script to update packages, install Nginx, and start the web service.
5. **Validation:** Accessed the outputted Public IP in a web browser, successfully confirming that the Nginx web server was installed and running automatically post-deployment.
