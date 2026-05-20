## 📈 Day 97 Update: Kubernetes Autoscaling & Resource Management

The cluster orchestration has been optimized for production-grade stability and dynamic load handling.

### ⚖️ Cluster Stability Enhancements
*   **Resource Quotas:** Updated the `deployment.yaml` to enforce strict CPU and Memory requests and limits. This prevents runaway containers from monopolizing host resources and causing node-level OOM crashes.
*   **Horizontal Pod Autoscaling:** Introduced an `hpa.yaml` manifest. The Kubernetes control plane now monitors CPU utilization across the application pods. If CPU load exceeds 50%, the cluster automatically scales the replica count horizontally (from 2 up to 5 pods) to absorb the traffic spike, ensuring seamless user experience.