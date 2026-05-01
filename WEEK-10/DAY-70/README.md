# 🚀 Day 70: Container Distribution via Docker Hub (Image Registries)

## 📋 Project Overview
Building and running containers locally is only the first half of the containerization lifecycle. To deploy applications to cloud servers, images must be hosted centrally. Today, I mastered **Docker Registries** by authenticating, pulling a public image, applying a custom tag, and pushing it directly to my personal **Docker Hub** repository.

## ⚙️ Core Concepts Explored
* **Image Registries:** Centralized storage and distribution systems for Docker images.
* **Docker Login:** Authenticating the local CLI with a remote registry securely.
* **Image Tagging (`docker tag`):** Restructuring an image's nomenclature to include the registry hostname/username and a specific version/tag (e.g., `username/app-name:v1`).
* **Push & Pull Operations:** Retrieving images from the cloud (`docker pull`) and transmitting local images to a remote repository (`docker push`).

## 🛠️ Execution Steps
1. **Authentication:** Executed `docker login` via the CLI to establish a secure connection.
2. **Base Image Retrieval:** Pulled a lightweight web server image (`nginx:alpine`) to act as our base application.
3. **Standardized Tagging:** Renamed the downloaded image to follow registry standards: `docker tag nginx:alpine <username>/day70-my-nginx:v1`.
4. **Registry Upload:** Executed `docker push <username>/day70-my-nginx:v1`. Monitored the upload process to the Docker Hub registry.
5. **Remote Validation:** Transitioned to an independent cloud environment (Play with Docker) and executed `docker run -p 8080:80 <username>/day70-my-nginx:v1`. The remote server successfully pulled and executed the image from the cloud.
