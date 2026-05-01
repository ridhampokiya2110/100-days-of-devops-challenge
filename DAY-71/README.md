# ☁️ Day 71: Cloud Deployment (Docker on AWS EC2)

## 📋 Project Overview
Running containers on a local development machine is just the beginning. The ultimate goal of containerization is seamless cloud deployment. Today, I bridged the gap between local development and production infrastructure by provisioning a live **AWS EC2 instance**, configuring the server, and deploying a globally accessible containerized application directly from Docker Hub.

## ⚙️ Core Concepts Explored
* **Cloud Infrastructure Provisioning:** Launching and configuring an AWS EC2 instance (Ubuntu) as a host machine.
* **Network Security & Firewalls:** Modifying AWS Security Groups to expose Port 80 (HTTP) to the public internet.
* **Server Configuration:** Interacting with a remote Linux server via SSH to install and enable the Docker Engine daemon from scratch.
* **Remote Image Execution:** Utilizing `docker run` on a remote server to autonomously pull image layers from a central registry (Docker Hub) and boot the application.

## 🛠️ Execution Steps & Code

### Step 1: AWS Infrastructure Provisioning
1. Launched a fresh **Ubuntu Linux EC2 instance** via the AWS Management Console.
2. Configured the attached Security Group to **allow inbound HTTP traffic** (Port 80) from `0.0.0.0/0`.
3. Connected to the instance via SSH.

### Step 2: Install Docker Engine on the Host
Executed the following system commands to install and start the Docker daemon on the fresh Linux server:
```bash
sudo apt update -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker