## 🔄 Day 96 Update: Dynamic Versioning & Zero-Downtime Deployments

The CI/CD workflow has been hardened by adopting production-grade versioning and orchestration strategies.

### 🏷️ Artifact Versioning Strategy
*   **Deprecated Mutable Tags:** Removed the reliance on the ambiguous `:latest` tag.
*   **Immutable Build Tags:** The Jenkins pipeline now dynamically tags every Docker image with its unique CI Build Number (e.g., `app:96`). This ensures an exact 1:1 traceability between Git commits, Jenkins runs, and Registry artifacts.

### ☸️ Kubernetes Rolling Updates
*   **Zero-Downtime Strategy:** The `deployment.yaml` is now dynamically injected with the new build tag during the pipeline run. Kubernetes detects this state change and executes a native **Rolling Update**, replacing pods one-by-one without dropping active user connections.
*   **Synchronous Validation:** The pipeline executes `kubectl rollout status`, ensuring that Jenkins accurately reports a failed build if the Kubernetes cluster fails to start the new pods successfully.