## 🐳 Day 92 Update: Docker Containerization

The CI/CD pipeline has been modernized by introducing containerization to the deployment workflow. 

### 📦 Container Architecture
*   **Dockerized Frontend:** The Tic-Tac-Toe application is no longer hosted on a bare-metal Nginx installation. Instead, it is packaged into a lightweight Docker container using an `nginx:alpine` base image.
*   **Immutable Deployments:** The deployment script (`deploy.sh`) has been refactored. On every Git push, the webhook triggers Jenkins to:
    1. Build a fresh Docker image containing the latest source code.
    2. Gracefully spin down and remove the outdated container.
    3. Launch the new container with proper port mapping (`80:80`).
*   **Infrastructure Update:** The underlying Terraform configurations were adjusted to bootstrap the EC2 instance with the Docker Engine rather than a standalone Nginx service.