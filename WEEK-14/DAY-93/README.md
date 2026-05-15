## ☁️ Day 93 Update: Docker Registry Integration (Docker Hub)

The CI/CD pipeline has been elevated to utilize industry-standard artifact management by integrating **Docker Hub**.

### 🔄 Artifact Lifecycle Workflow
*   **Centralized Image Storage:** The pipeline no longer relies on building and storing images purely locally on the production server. Built images are now pushed to a centralized registry.
*   **Pipeline Execution Steps:**
    1. **Authentication:** Jenkins securely injects Docker Hub credentials and logs the runner into the registry.
    2. **Build & Tag:** The application is packaged into a Docker image and tagged with the proper namespace (`username/repository:latest`).
    3. **Push:** The immutable image artifact is pushed to the public Docker Hub registry.
    4. **Deploy:** The production server pulls the latest artifact directly from the registry and spins up the container mapped to port `80`.
*   **Security:** Transitioned to inline remote execution via Jenkins Groovy scripts, utilizing credential masking to handle Docker tokens securely without exposing them in static scripts.