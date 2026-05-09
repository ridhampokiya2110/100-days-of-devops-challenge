# ☁️ Day 81: Enterprise Artifact Management (AWS ECR)

## 📋 Project Overview
Hosting proprietary corporate source code and container images on public registries (like Docker Hub) poses a massive security risk. Today, I implemented Enterprise Cloud Security by migrating my container storage strategy to **AWS Elastic Container Registry (ECR)**. I successfully authenticated, tagged, and pushed a local Docker image into a strictly private AWS cloud repository.

## ⚙️ Core Concepts Explored
* **Private Container Registries:** The difference between public distribution (Docker Hub) and private, IAM-controlled storage (AWS ECR).
* **CLI Authentication:** Using the `aws cli` to fetch temporary authorization tokens to log the Docker daemon into AWS.
* **Image Tagging Architecture:** Understanding why images must be renamed with the exact Registry URI before pushing (`account-id.dkr.ecr.region.amazonaws.com/repo-name:tag`).

## 🛠️ Execution Steps
1. **Provision Registry:** Created a private repository named `day81-private-app` via the AWS Management Console.
2. **Authenticate Docker:** Executed the AWS CLI login command to link my terminal to my AWS account securely.
   ```bash
   aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <account-id>.dkr.ecr.<region>.amazonaws.com
3. **Build Local Image:** Created a simple local image using docker build -t my-local-app .
4. **Tag for AWS:** Retagged the image to match the remote ECR destination structure.
    docker tag my-local-app:latest <account-id>.dkr.ecr.<region>[.amazonaws.com/day81-private-app:latest](https://.amazonaws.com/day81-private-app:latest)
5. **Secure Push:** Uploaded the custom image to AWS ECR using docker push