# 🤖 Day 83: CI/CD Automation - Pushing to AWS ECR with GitHub Actions

## 📋 Project Overview
Manual deployments are prone to human error and slow down development speed. After learning how to manually push container images to AWS ECR in previous days, today I automated the entire process. I engineered a GitHub Actions CI/CD pipeline that automatically builds a Docker image and pushes it to a private AWS ECR repository every time new code is committed to the main branch.

## ⚙️ Core Concepts Explored
* **Continuous Integration (CI):** Automating the build phase of containerized applications.
* **GitHub Actions Secrets:** Securely storing AWS IAM credentials in GitHub without hardcoding them in the repository.
* **Workflow File (YAML):** Writing declarative steps to instruct GitHub runner machines on how to authenticate with AWS and execute Docker commands.
* **AWS ECR Login Action:** Utilizing official AWS GitHub Actions to generate secure, temporary login tokens for the Docker daemon.

## 🛠️ Execution Steps
1. **Repository Setup:** Created a new GitHub repository and initialized a basic project with a `Dockerfile`.
2. **Security Configuration:** Added `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_REGION` to the GitHub Repository Secrets.
3. **Pipeline Creation:** Authored a workflow YAML file inside the `.github/workflows` directory.
4. **Pipeline Logic:** Configured the workflow to checkout the code, authenticate with AWS using the stored secrets, log the GitHub runner into the AWS ECR registry, build the Docker image, and push it using dynamic environment variables.
5. **Deployment Execution:** Pushed the code to the `main` branch, triggering the automated pipeline.
6. **Validation:** Verified the successful pipeline execution in the GitHub Actions dashboard and confirmed the arrival of the new image layer in the AWS Management Console.
