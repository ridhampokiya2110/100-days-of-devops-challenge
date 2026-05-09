# 🌐 Day 80: Docker Networking & Infrastructure Isolation

## 📋 Project Overview
Security is paramount in containerized environments. Exposing every container to the default network or public host ports is a major security vulnerability. Today, I implemented **User-Defined Docker Networks** to isolate backend services (like databases) from unauthorized access, mimicking the architecture of an AWS VPC.

## ⚙️ Core Concepts Explored
* **Docker Bridge Networks:** Understanding how Docker creates virtual networks to route traffic between containers.
* **Network Isolation:** Creating boundaries where containers can only talk to each other if they belong to the same explicitly defined network.
* **Internal DNS Resolution:** How Docker's embedded DNS server automatically resolves container names to internal IP addresses (e.g., pinging `secret-db` instead of `172.18.0.x`).
* **VPC Simulation:** Using Docker networks to simulate Public and Private subnets locally before deploying to cloud infrastructure.

## 🛠️ Execution Steps
1. **Network Initialization:** 
   * Created a private network: `docker network create my-secure-net`
2. **Deploy Isolated Database:** 
   * Ran a container mimicking a database inside the network, with no exposed ports: `docker run -d --name secret-db --network my-secure-net alpine sleep 1000`
3. **Deploy Public Gateway:** 
   * Ran an Nginx container exposed to the host, acting as the public tier: `docker run -d --name public-web --network my-secure-net -p 8080:80 nginx:alpine`
4. **Deploy Unauthorized Container:** 
   * Ran a separate container on the default network: `docker run -d --name outsider alpine sleep 1000`
5. **Validation Testing:**
   * **Allowed Traffic:** `docker exec public-web ping -c 3 secret-db` (Success: DNS resolved and packets received).
   * **Blocked Traffic:** `docker exec outsider ping -c 3 secret-db` (Failure: Network isolation enforced, hostname unresolvable).
