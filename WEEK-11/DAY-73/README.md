# 🚀 Day 73: Continuous Deployment (CD) with GitHub Actions & AWS EC2

## 📋 Project Overview
Yesterday, I automated the container build and push process (Continuous Integration). Today, I completed the DevOps lifecycle by engineering the **Continuous Deployment (CD)** phase. I upgraded my GitHub Actions workflow to securely SSH into a live AWS EC2 instance, pull the freshly built Docker image, and autonomously deploy the updated application to the public internet.

## ⚙️ Core Concepts Explored
* **Continuous Deployment (CD):** Automating the release of validated code directly to production infrastructure.
* **Remote Execution via SSH:** Utilizing GitHub Actions (`appleboy/ssh-action`) to securely authenticate with remote Linux servers using private `.pem` keys.
* **Pipeline Dependencies (`needs` keyword):** Architecting sequential job execution, ensuring the deployment job only triggers if the build job succeeds.
* **Zero-Downtime Deployment Logic:** Writing bash scripts inside the CI/CD pipeline to gracefully remove the old container before booting the new application state.

## 🛠️ Execution Steps
1. **Infrastructure Prep:** Ensured an AWS EC2 instance (Ubuntu) was running with the Docker Engine installed and Port 80 exposed.
2. **Security & Secrets:** Configured the EC2 Public IP, SSH Username (`ubuntu`), and the raw RSA Private Key (`.pem` file content) as encrypted GitHub Secrets.
3. **Pipeline Upgrade:** Extended the YAML workflow to include a `deploy-to-ec2` job.
4. **Remote Scripting:** Injected inline bash commands into the workflow to pull the latest image from Docker Hub, forcefully remove the existing container, and spin up the new container mapped to Port 80.
5. **Execution:** Executed `git push`. The pipeline successfully built the artifact, established a secure SSH tunnel to AWS, and deployed the update instantly without manual intervention.
