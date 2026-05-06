# 🐳 Day 79: Multi-Container Orchestration (Docker Compose)

## 📋 Project Overview
Modern microservice architectures rely on multiple interconnected containers (e.g., a web server interacting with a separate database server). Managing these relationships manually via CLI commands is unscalable. Today, I implemented **Docker Compose** to define, run, and manage multi-container environments using a single, declarative YAML configuration file.

## ⚙️ Core Concepts Explored
* **Infrastructure as Code (IaC):** Defining the entire infrastructure blueprint (networks, volumes, and services) in a version-controlled YAML file.
* **Service Definitions:** Breaking down an application into distinct microservices (e.g., `web` and `db`) within the compose file.
* **Internal Networking:** How Docker Compose automatically creates a dedicated bridge network, allowing services to communicate seamlessly using their service names as DNS hostnames (e.g., WordPress connecting to MySQL via the `db` hostname).
* **Dependency Management:** Using the `depends_on` directive to enforce proper container boot ordering.

## 🛠️ Execution Steps
1. **Configuration Creation:** Authored a `docker-compose.yml` file configuring a full-stack WordPress application.
2. **Database Provisioning:** Defined a MySQL 8.0 service, mapped a persistent volume for data retention, and injected root credentials via environment variables.
3. **Application Provisioning:** Defined the WordPress service, linked its environment variables to match the database credentials, and exposed port 8080 to the local host.
4. **Stack Execution:** Ran `docker compose up -d` to build the network and spin up the entire application stack simultaneously.
5. **Validation:** Accessed `http://localhost:8080` to verify that the application successfully booted and established a connection with the database container.
6. **Stack Teardown:** Executed `docker compose down` to cleanly remove the containers and network interfaces.
