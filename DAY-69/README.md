# 🪄 Day 69: Multi-Container Orchestration with Docker Compose

## 📋 Project Overview
Running complex multi-container architectures via individual CLI commands is inefficient, prone to human error, and impossible to version control. Today, I leveled up my containerization skills by migrating from manual `docker run` operations to declarative Infrastructure as Code using **Docker Compose**.

## ⚙️ Core Concepts Explored
* **Docker Compose:** A powerful tool for defining and running multi-container Docker applications via a single configuration file.
* **Declarative YAML (`docker-compose.yml`):** Defining the entire state of the application stack (Services, Networks, Volumes, and Environment Variables) in a single, version-controllable document.
* **Automatic Networking:** Understanding how Docker Compose automatically provisions a default bridge network, enabling seamless DNS resolution between services without manual network creation.
* **Dependency Management (`depends_on`):** Controlling the startup order of containers to ensure the database initializes before the frontend application attempts to connect.

## 🛠️ Execution Steps
1. **Configuration:** Authored a robust `docker-compose.yml` file mapping out two distinct services: `my-db` (MySQL 8.0) and `my-wordpress` (WordPress).
2. **State & Environment:** Configured a managed Docker Volume (`day69-db-data`) for database persistence and mapped environment variables to ensure secure cross-container authentication.
3. **Orchestration Execution:** Deployed the entire stack instantly using `docker compose up -d`.
4. **Validation:** Successfully accessed the fully integrated WordPress UI via `localhost:8082`, proving that the automated networking and provisioning executed flawlessly.

