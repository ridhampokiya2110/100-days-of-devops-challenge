## ☸️ Day 95 Update: Kubernetes Orchestration (K3s)

The infrastructure has graduated from standalone Docker containers to a fully orchestrated **Kubernetes** environment.

### 🏗️ K8s Architecture & Deployment
*   **Lightweight Cluster:** Configured the EC2 instance to run **K3s**, providing a production-grade Kubernetes environment without the massive overhead.
*   **Declarative Manifests:** 
    *   `deployment.yaml`: Enforces High Availability (HA) by maintaining a replica set of `2` application pods. It pulls the verified Docker Hub image seamlessly.
    *   `service.yaml`: Exposes the application to the internet using a `LoadBalancer` service type, handling traffic distribution across the healthy pods.
*   **Dynamic Pipeline Injection:** The Jenkins pipeline dynamically utilizes `sed` to inject secure registry credentials into the YAML manifests before executing `kubectl apply`, keeping the codebase modular and secure.