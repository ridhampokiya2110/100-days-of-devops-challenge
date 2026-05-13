# 🎮 Tic-Tac-Toe - Automated CI/CD Deployment

This repository contains the source code for a web-based Tic-Tac-Toe game, completely deployed using an automated CI/CD pipeline. This project was built as part of the **#100DaysOfDevOps** challenge (Day 90), focusing on bridging Infrastructure-as-Code and Configuration Management.

## 🛠️ Tech Stack & Architecture
*   **Frontend:** HTML, CSS, Vanilla JavaScript
*   **Web Server:** Nginx
*   **Infrastructure:** AWS EC2 (Ubuntu), Provisioned via Terraform
*   **CI/CD:** Jenkins
*   **Scripting:** Bash, Groovy (Jenkinsfile)

## 🚀 Pipeline Workflow
The Jenkins pipeline automatically handles the following stages:
1.  **Checkout 📥:** Pulls the latest application code from the Git repository.
2.  **Terraform Init & Apply 🛠️:** Provisions the AWS EC2 infrastructure and ensures it is in the desired state.
3.  **Deploy App 🎮:** 
    *   Dynamically fetches the new EC2 Public IP using Terraform outputs.
    *   Secures the SSH private key using Windows ACL (`icacls`) SID configurations.
    *   Uses `scp` to transfer HTML/CSS/JS and the `deploy.sh` script to the EC2 instance.
    *   Sanitizes the script for Linux execution (`sed` to fix CRLF line endings).
    *   Executes the deployment script via SSH to configure Nginx and serve the application.

## 🧠 Key Challenges Solved
*   **Windows Node SSH Security:** Overcame strict SSH key permission errors by manipulating Windows Security Identifiers (SIDs) directly inside the Jenkins pipeline.
*   **Cross-OS Formatting:** Prevented execution failures by automatically converting Windows carriage returns to Linux line feeds during the CI/CD run.
*   **Nginx Routing:** Resolved `403 Forbidden` errors by properly managing web root permissions (`www-data`) and exact file placements.