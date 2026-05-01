# 🤖 Day 72: Continuous Integration (CI) with GitHub Actions

## 📋 Project Overview
Manual Docker builds and pushes are inefficient and unscalable for professional environments. Today, I transitioned from manual operations to fully automated CI/CD pipelines by implementing **GitHub Actions**. I engineered a workflow that automatically builds a Docker image and pushes it to Docker Hub every time new code is merged into the main branch.

## ⚙️ Core Concepts Explored
* **Continuous Integration (CI):** Automating the integration of code changes into a shared repository, including automated builds.
* **GitHub Actions Workflows:** Defining event-driven automation pipelines using YAML configuration files.
* **GitHub Secrets:** Securely storing sensitive credentials (like Docker Hub authentication tokens) outside of the version-controlled codebase.
* **Automated Build & Push (`docker/build-push-action`):** Leveraging pre-built community actions to streamline the Docker image build and registry upload process on a temporary GitHub-hosted runner.

## 🛠️ Execution Steps
1. **Application Containerization:** Created a simple static HTML application and a corresponding `Dockerfile` using `nginx:alpine` as the base image.
2. **Credential Management:** Configured `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` as securely encrypted Repository Secrets within GitHub.
3. **Pipeline Configuration:** Authored `.github/workflows/docker-ci.yml` to define the CI jobs.
4. **Automation Trigger:** Pushed the codebase to the `main` branch.
5. **Validation:** Navigated to the GitHub Actions tab to monitor the execution logs. Verified that the runner successfully authenticated, built the image from the `./DAY-72` context, and pushed the final artifact (`day72-automated-nginx:latest`) to the remote Docker Hub registry without any manual CLI intervention.
