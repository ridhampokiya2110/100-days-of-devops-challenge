# 🛠️ Day 43: Terraform Outputs & Real-World Cloud Debugging

## 📋 Project Overview
Today’s goal was to upgrade my Terraform setup by using `outputs.tf` to print the live website URL directly in the terminal. However, the deployment failed with an `ERR_CONNECTION_REFUSED` error. Instead of giving up, I dove deep into the server logs via SSH, identified an OS-level package manager conflict, rewrote my bootstrap script, and successfully brought the website online!

## ⚙️ Core Concepts Explored
* **Terraform Outputs (`outputs.tf`):** Extracting dynamic data (like Public IPs) from the Terraform state file and printing it to the CLI.
* **Cloud-init & User Data:** Understanding the "First Boot Rule" where bootstrapping scripts execute only once upon instance creation.
* **Linux Package Managers:** Recognizing the critical differences between Amazon Linux (`yum`) and Ubuntu (`apt`).
* **SSH & Log Analysis:** Modifying Security Groups to open Port 22, SSHing into a broken server, and analyzing `/var/log/cloud-init-output.log` to find the root cause of failure.

## 🛠️ Steps Executed
1. **Output Configuration:** Added an `outputs.tf` file to dynamically print the `web_server_public_ip` and `website_url`.
2. **The Bug:** Deployed the infrastructure in the Stockholm region (`eu-north-1`). The website refused to connect.
3. **The Investigation:** Updated the Terraform Security Group to allow SSH (Port 22). Connected to the instance and checked the Apache service status.
4. **Root Cause Analysis:** Read the cloud-init logs and discovered: `yum: command not found`. The chosen Europe AMI was actually an Ubuntu image, which uses `apt`, not `yum`!
5. **The Fix:** Rewrote the `user_data` bash script in `main.tf` to use `apt update -y` and `apt install -y apache2`.
6. **Final Deployment:** Destroyed the corrupted instance, applied the fresh code, and successfully accessed the live web server directly from the Terraform terminal output.
