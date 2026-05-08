# ☁️ Day 82: Enterprise Deployment from AWS ECR to EC2

## 📋 Project Overview
Following the work of pushing a container image to a private AWS ECR repository, today I focused on the deployment phase. I provisioned an AWS EC2 instance, authenticated it with my private registry, pulled the secured image, and deployed it. This simulates a real-world production deployment workflow where proprietary code is kept strictly confidential.

## ⚙️ Core Concepts Explored
* **Remote Server Configuration:** Installing Docker and AWS CLI on a fresh Linux server.
* **Server-to-Registry Authentication:** Bridging an EC2 instance with ECR using IAM credentials and security tokens.
* **Private Image Pulling:** Understanding how to retrieve container images from private URLs instead of the public Docker Hub.
* **The Full Deployment Lifecycle:** Completing the `Local Build -> ECR Push -> EC2 Pull -> Run` cycle.

## 🛠️ Execution Steps
1. **Launch Infrastructure:** Spun up an Ubuntu EC2 instance with Port 80 exposed.
2. **SSH & Setup:** Logged into the server and ran `sudo apt install docker.io awscli -y`.
3. **Authenticate:** Configured AWS credentials using `aws configure` and logged Docker into ECR using the `aws ecr get-login-password` command.
4. **Pull Artifact:** Downloaded the private image from ECR using `docker pull <account-id>.dkr.ecr.<region>.amazonaws.com/day81-private-app:latest`.
5. **Execute Deployment:** Spun up the container using `docker run -d -p 80:80 <image-url>`.
6. **Validation:** Verified the deployment by visiting the EC2 Public IPv4 address in a web browser.

