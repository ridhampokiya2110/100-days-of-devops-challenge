## 🚀 Day 91 Update: Zero-Touch Deployment via Webhooks

The CI/CD pipeline has been upgraded from manual triggers to a fully automated, event-driven architecture. 

### 🔄 Webhook Integration
*   **GitHub Webhooks:** The repository is configured to send payload events on every `git push`.
*   **Ngrok Tunneling:** Since the Jenkins server is hosted locally for this project, Ngrok is utilized to expose the Jenkins port (`8080`) to the internet securely.
*   **Automated Trigger:** Jenkins is configured with the "GitHub hook trigger for GITScm polling" plugin. Upon receiving the Webhook payload, Jenkins automatically spins up the pipeline.

### 🏗️ Infrastructure Resilience
This pipeline relies heavily on the idempotent nature of **Terraform**. If the underlying AWS EC2 instance is terminated, the next automated pipeline run will gracefully detect the missing infrastructure, provision a brand new server, retrieve the new Public IP, and deploy the application seamlessly.