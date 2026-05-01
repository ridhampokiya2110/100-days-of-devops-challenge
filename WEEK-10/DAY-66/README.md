# 🐳 Day 66: Introduction to Docker & Containerization

## 📋 Project Overview
The phrase "It works on my machine" is the bane of software engineering. Differences in OS versions, libraries, and system configurations cause code to fail in production. Today, I solved this by entering the world of **Containerization** using **Docker**. I containerized a Python web application, ensuring it will run identically on any machine, anywhere.

## ⚙️ Core Concepts Explored
* **Containers vs. VMs:** Understanding that containers share the host system's kernel, making them lightweight, extremely fast to boot, and highly portable compared to bulky Virtual Machines.
* **Dockerfile:** The blueprint or recipe used to assemble a Docker Image.
* **Docker Image:** A read-only, executable package that includes everything needed to run a piece of software (code, runtime, libraries, environment variables).
* **Docker Container:** A running instance of a Docker Image.
* **Port Mapping (`-p`):** Bridging the isolated container's internal network port to the host machine's external port.

## 🛠️ Execution Steps
1. **Application Code:** Created a simple Python Flask web application (`app.py`) and defined its dependencies (`requirements.txt`).
2. **The Blueprint:** Authored a `Dockerfile` using `python:3.9-slim` as the base image. Configured the working directory, copied the local code into the container, and defined the `RUN` and `CMD` instructions.
3. **Image Building:** Executed `docker build -t day66-flask-app .` to compile the application and its environment into a portable Docker Image.
4. **Container Execution:** Ran `docker run -p 8080:8080 day66-flask-app` to spin up an isolated container process.
5. **Validation:** Successfully accessed the containerized application via `localhost:8080` in the web browser.

