# 🚀 100 Days of DevOps Challenge

![DevOps Banner](https://img.shields.io/badge/DevOps-100%20Days%20Challenge-blue?style=for-the-badge&logo=linux)
![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen?style=for-the-badge&logo=jenkins)
![Kubernetes](https://img.shields.io/badge/Kubernetes-K3s-blue?style=for-the-badge&logo=kubernetes)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

Welcome to my **100 Days of DevOps** repository! 🎯 
This repository documents my 100-day journey from writing basic Linux commands to architecting and deploying a fully automated, self-healing, auto-scaling, and highly observable Kubernetes infrastructure.

## 🌟 Project Overview: The Final Architecture
By the end of this challenge, I successfully engineered a production-grade CI/CD pipeline for a web application (Tic-Tac-Toe). 

**The Automated Workflow:**
`Git Push` ➡️ `Jenkins Trigger` ➡️ `Terraform AWS Provisioning` ➡️ `Docker Build` ➡️ `Trivy DevSecOps Scan` ➡️ `Docker Hub Push` ➡️ `K3s Rolling Update` ➡️ `HPA Autoscaling` ➡️ `Slack ChatOps Alert` ➡️ `Prometheus & Grafana Monitoring`.

## 🛠️ Tech Stack Mastered
* **Cloud Provider:** AWS (EC2, VPC, Security Groups)
* **Infrastructure as Code (IaC):** Terraform
* **CI/CD:** Jenkins (Groovy Declarative Pipelines)
* **Containerization:** Docker, Docker Compose
* **Container Orchestration:** Kubernetes (K3s), Helm
* **DevSecOps:** Trivy (Vulnerability Scanning)
* **Observability:** Prometheus, Grafana
* **ChatOps:** Slack API Integration

## 🗺️ Journey Highlights

### Phase 1: The Foundations
* Mastered Linux core commands, user management, and shell scripting.
* Deep dive into Git & GitHub for version control.
* Grasped the fundamentals of networking, SSH, and web servers (Nginx/Apache).

### Phase 2: CI/CD & Automation
* Setup **Jenkins** on AWS EC2.
* Wrote declarative `Jenkinsfile` pipelines.
* Integrated webhook triggers for automated builds upon Git commits.

### Phase 3: Infrastructure as Code (IaC)
* Used **Terraform** to dynamically provision AWS EC2 instances and Security Groups.
* Implemented `user_data` scripts for automated bootstrapping of servers (AMI baking logic).

### Phase 4: Containerization & DevSecOps
* Containerized the application using **Docker**.
* Transitioned to "Shift-Left Security" by integrating **Trivy** to scan Docker images for `HIGH` and `CRITICAL` vulnerabilities before pushing to Docker Hub.

### Phase 5: Kubernetes Orchestration (K3s)
* Migrated from Docker Compose to **Kubernetes** using a lightweight K3s cluster.
* Implemented **Zero-Downtime Rolling Updates** via dynamic image versioning.
* Decoupled configurations using **ConfigMaps** and **Secrets**.
* Configured **Liveness and Readiness Probes** for self-healing capabilities.
* Set up a **Horizontal Pod Autoscaler (HPA)** with resource requests/limits to handle traffic spikes.

### Phase 6: Observability & ChatOps
* Deployed **Prometheus & Grafana** using **Helm** charts for real-time cluster telemetry (CPU, Memory, Network).
* Integrated Jenkins with **Slack** to receive real-time conditional alerts (Success/Failure) for every deployment.

## 🚀 How to Use This Repository
1. Clone the repository: `git clone https://github.com/ridhampokiya2110/100-days-of-devops-challenge.git`
2. Explore the day-by-day folders to see the progression of scripts and configurations.
3. The root directory contains the final `Jenkinsfile`, `main.tf`, and `k8s/` manifests used for the ultimate production architecture.

## 🤝 Connect with Me
I am a passionate Cloud & DevOps enthusiast constantly looking to build robust architectures. Let's connect!
* **LinkedIn:** [Ridham Pokiya](https://www.linkedin.com/in/ridham-pokiya-b7974a249)
* **GitHub:** [@ridhampokiya2110](https://github.com/ridhampokiya2110)