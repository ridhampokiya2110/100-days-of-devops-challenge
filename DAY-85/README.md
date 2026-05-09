# 🔗 Day 85: Event-Driven Automation - GitHub Webhooks & Jenkins

## 📋 Project Overview
True Continuous Integration requires automated triggers, not manual button clicks. Today, I engineered an event-driven architecture that allows GitHub to actively communicate with my local Jenkins server. By configuring GitHub Webhooks, Jenkins now automatically detects code changes and initiates the build process the moment a developer pushes code to the repository.

## ⚙️ Core Concepts Explored
* **Webhooks:** Understanding how HTTP POST requests facilitate real-time, event-driven communication between separate cloud platforms.
* **Reverse Proxy Tunneling (ngrok):** Exposing locally hosted services (like a laptop-based Jenkins server) to the public internet securely to test third-party integrations.
* **Source Code Management (SCM):** Configuring Jenkins to pull proprietary source code directly from version control systems.
* **Event-Driven Pipelines:** Transitioning from manual build execution to fully automated, Git-triggered CI/CD flows.

## 🛠️ Execution Steps
1. **Network Exposure:** Executed `ngrok http 8080` to generate a public, HTTPS-secured URL bridging to my local Jenkins instance.
2. **Configure Webhook:** Added a webhook to the GitHub repository pointing to `https://<ngrok-url>/github-webhook/`.
3. **Jenkins SCM Setup:** Configured the Jenkins Freestyle project to track the target GitHub repository under the "Source Code Management" settings.
4. **Enable Automation Trigger:** Checked the "GitHub hook trigger for GITScm polling" option in the Jenkins build triggers.
5. **Validation Testing:** Pushed a minor code update (`git push origin main`) from the local terminal.
6. **Confirmation:** Navigated to the Jenkins dashboard and verified that a new build run was initiated autonomously, confirming the successful integration of the Webhook payload.

