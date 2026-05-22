## 🔐 Day 98 Update: Configuration Management & Security

The Kubernetes architecture has been refined to fully separate configuration from code, increasing both security and flexibility.

### 📝 Decoupled Configurations
*   **ConfigMaps:** Implemented `configmap.yaml` to manage standard application variables (like `APP_ENV`), allowing dynamic configuration changes without requiring a Docker image rebuild.
*   **Secrets Management:** Introduced `secret.yaml` to securely handle sensitive environment variables via Base64 encoding and Kubernetes Opaque secrets.
*   **Environment Injection:** The `deployment.yaml` was updated to dynamically map these K8s resources directly into the container's environment variables upon pod initialization.