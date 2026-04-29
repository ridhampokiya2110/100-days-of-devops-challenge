# 🌐 Day 68: Docker Networks & Multi-Container Communication

## 📋 Project Overview
Real-world applications are rarely standalone; they consist of multiple microservices (e.g., Frontend, Backend, Database) that need to communicate securely. Today, I engineered a multi-container architecture using **Docker Networks**, demonstrating how an isolated Web application (WordPress) can seamlessly communicate with a secluded Database (MySQL) without exposing the database to the public internet.

## ⚙️ Core Concepts Explored
* **Docker Networks (Bridge):** Creating an isolated virtual network for containers to communicate securely.
* **Internal DNS Resolution:** Understanding how Docker's embedded DNS server automatically resolves container names to their internal IP addresses, eliminating the need to hardcode IPs.
* **Container Isolation:** Ensuring security by *not* exposing the database port (`-p`) to the host machine, while exclusively exposing the web frontend port.
* **Environment Variables Integration:** Injecting configuration data (`WORDPRESS_DB_HOST=my-db`) to link separate application tiers dynamically.

## 🚀 Execution Steps & Code

### Step 1: Provision the Virtual Network
Created a custom bridge network to house our application stack.
```powershell
docker network create day68-network

### Step 2: Deploy the Database Tier (Backend)
Spun up a MySQL container directly into the new network. I did not publish its ports to the host, ensuring it remains isolated and secure.

docker run -d `
  --name my-db `
  --network day68-network `
  -e MYSQL_ROOT_PASSWORD=supersecret `
  -e MYSQL_DATABASE=wordpress_db `
  mysql:8.0

### Step 3: Deploy the Web Tier (Frontend)
Spun up a WordPress container in the same network. Directed WordPress to connect to the database simply by passing the database container's name (my-db).

docker run -d `
  --name my-wordpress `
  --network day68-network `
  -p 8080:81 `
  -e WORDPRESS_DB_HOST=my-db `
  -e WORDPRESS_DB_USER=root `
  -e WORDPRESS_DB_PASSWORD=supersecret `
  -e WORDPRESS_DB_NAME=wordpress_db `
  wordpress:latest

### Step 4: Validation
Navigated to http://localhost:8081 in the browser and successfully accessed the live WordPress setup UI, proving that the internal cross-container connection was successful!