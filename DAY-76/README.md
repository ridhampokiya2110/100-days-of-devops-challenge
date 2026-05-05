# 🩺 Day 76: Docker Healthchecks & Application Monitoring

## 📋 Project Overview
A running container does not guarantee a working application. A process might be active while the web server inside is frozen or returning 500 errors (often called "Zombie Containers"). Today, I solved this by implementing **Docker Healthchecks**, enabling the Docker daemon to actively probe and verify the actual health of the application.

## ⚙️ Core Concepts Explored
* **Zombie Containers:** The discrepancy between a container's OS process state and the actual application availability state.
* **The `HEALTHCHECK` Instruction:** A native Dockerfile directive that tells Docker how to test the container to check that it is still working.
* **Internal Probing:** Using tools like `curl` inside the container to make HTTP requests to the application's own localhost interface.
* **Container States:** Understanding the transition between `starting`, `healthy`, and `unhealthy` states.
