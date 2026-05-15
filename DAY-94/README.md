## 🛡️ Day 94 Update: DevSecOps & Vulnerability Scanning

The CI/CD pipeline has been upgraded from DevOps to **DevSecOps** by integrating automated security scanning.

### 🔍 Security Implementation
*   **Vulnerability Scanner:** Integrated **Trivy** (by Aqua Security) directly into the deployment workflow.
*   **Shift-Left Security Gate:** The pipeline now follows a strict sequence: `Build -> Scan -> Push`. 
*   **Severity Filtering:** The scanner is configured to specifically look for `HIGH` and `CRITICAL` Common Vulnerabilities and Exposures (CVEs) within the built Docker image before it is allowed to be pushed to the Docker Hub registry.
*   **Automated Provisioning:** The Terraform `user_data` script was updated to automatically install the Trivy binary on the target EC2 instance during the infrastructure provisioning phase.