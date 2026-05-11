# 🐳 Day 87: Docker Integration & Artifact Management via Jenkins Pipeline

## 📋 Project Overview
True continuous delivery relies on automated artifact generation. Today, I integrated the Docker engine directly into my Jenkins Pipeline. I engineered a `Jenkinsfile` that automatically builds a new container image upon every Git commit, dynamically tags it with the unique Jenkins Build ID, and pushes it securely to Docker Hub.

## ⚙️ Core Concepts Explored
* **Pipeline Integrations:** Executing host-level tools (like the Docker CLI) natively from within a Jenkins pipeline script.
* **Jenkins Credential Store:** Abstracting sensitive authentication data (usernames/passwords) from version control by injecting them dynamically during the build stage.
* **Dynamic Image Tagging:** Utilizing environmental variables (`${env.BUILD_ID}`) to ensure every artifact generated has a unique, traceable version number.
* **Declarative Environment Blocks:** Setting up pipeline-wide variables for cleaner and more maintainable Groovy code.

## 🛠️ Execution Steps
1. **Secure Vault:** Added Docker Hub credentials to the Jenkins Global Credential manager under the ID `dockerhub-creds`.
2. **Author `Jenkinsfile`:** Replaced the dummy pipeline with a production-ready script:
   - **Environment Block:** Mapped credentials and defined the target Image URI.
   - **Build Stage:** Executed `bat "docker build -t <image>:<build_id> ."` to compile the image.
   - **Push Stage:** Authenticated securely via `--password-stdin` and executed `docker push`.
3. **Trigger Pipeline:** Executed a `git push` from the local development environment.
4. **Validation:** Observed the GitHub Webhook automatically trigger the Jenkins job. Verified the successful pipeline execution in the Jenkins UI and confirmed the arrival of the versioned artifacts on Docker Hub.
