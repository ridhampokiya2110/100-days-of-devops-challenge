# 🔒 Day 75: Container Resource Limits & Performance Monitoring

## 📋 Project Overview
By default, Docker containers have unrestricted access to the host machine's compute resources. In a production environment, a single compromised or buggy container can trigger an Out of Memory (OOM) exception, crashing the entire AWS EC2 node. Today, I implemented strict Infrastructure Security measures by enforcing **CPU and Memory limits** on containers and monitored them using Docker's native tooling.

## ⚙️ Core Concepts Explored
* **Resource Capping:** Preventing containers from consuming 100% of host resources (Noisy Neighbor Problem).
* **Memory Limits (`--memory`):** Setting a strict hard limit on RAM consumption. If the container exceeds this, the Docker daemon automatically terminates it (OOMKilled) to protect the host OS.
* **CPU Limits (`--cpus`):** Throttling container compute access to a specific fraction of host CPU cores, ensuring smooth operation of other parallel services.
* **Real-time Monitoring (`docker stats`):** Utilizing the Docker CLI to stream live compute metrics, memory consumption boundaries, and network I/O.

## 🛠️ Execution Steps
1. **Unrestricted Baseline:** Deployed a standard container (`uncapped-app`) and utilized `docker stats` to observe that its memory limit defaulted to the absolute maximum capacity of the host system.
2. **Resource Throttling:** Deployed a second container (`locked-app`) applying the following DevOps constraints:
   ```bash
   docker run -d --name locked-app --memory="256m" --cpus="0.5" nginx