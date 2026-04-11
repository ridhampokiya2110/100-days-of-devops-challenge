# 💻 Day 55: Terraform Provisioners (`local-exec`)

## 📋 Project Overview
Bridging the gap between infrastructure provisioning and configuration management is a key DevOps workflow. Today, I implemented **Terraform Provisioners**, specifically the `local-exec` block, to automatically execute local terminal commands the exact moment an AWS resource finishes provisioning.

## ⚙️ Core Concepts Explored
* **Terraform Provisioners:** Special blocks used to execute scripts or commands on either the local machine running Terraform or the remote machine being created.
* **`local-exec` Provisioner:** Executes commands on the machine running the Terraform binary (e.g., your laptop, CloudShell, or CI/CD runner).
* **Self Object (`self`):** A special variable used within provisioner blocks to reference the attributes of the parent resource (like fetching `self.public_ip`).

## 🛠️ Execution Steps (eu-north-1 Region)
1. **Server Configuration:** Defined a `t3.micro` EC2 instance with an automatically assigned public IP.
2. **Provisioner Block:** Nested a `provisioner "local-exec"` block inside the `aws_instance` resource.
3. **Command Injection:** Configured a bash command: `echo '... ${self.public_ip}' > server_ips.txt` to capture the IP address dynamically.
4. **Validation:** Executed `terraform apply`. Terraform provisioned the server, extracted the new Public IP, and successfully triggered the local shell to generate a `server_ips.txt` file containing the data.
