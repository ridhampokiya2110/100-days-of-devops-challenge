# 💾 Day 78: Persistent Storage & Docker Volumes

## 📋 Project Overview
Containers are ephemeral, meaning any data written inside a container's writable layer is permanently lost when the container is removed. Today, I implemented **Docker Volumes** to establish persistent storage. This ensures that critical application data (like database records or user uploads) survives container restarts, crashes, and CI/CD redeployments.

## ⚙️ Core Concepts Explored
* **Ephemeral Containers:** Understanding the temporary nature of container filesystems.
* **Docker Volumes:** Host-managed storage objects that are completely decoupled from the lifecycle of any individual container.
* **Volume Mounting (`-v` flag):** The mechanism of bridging a host volume to a specific directory path inside the container environment.
* **Stateful Architecture:** Designing systems where the compute layer (the container) can be destroyed and replaced without impacting the storage layer (the data).

## 🛠️ Execution Steps
1. **Create Persistent Storage:** Executed `docker volume create day78-data` to initialize the storage unit.
2. **Mount and Write:** 
   * Ran a container and mounted the volume: `docker run -d --name app-v1 -v day78-data:/app-data ubuntu sleep 1000`
   * Executed a command to write a text file into the `/app-data` directory.
3. **Simulate Destruction:** Forcefully deleted the container using `docker rm -f app-v1`.
4. **Restore and Verify:** 
   * Launched a new container (`app-v2`) and mounted the exact same `day78-data` volume.
   * Read the contents of the `/app-data` directory and successfully confirmed the text file was completely preserved.

