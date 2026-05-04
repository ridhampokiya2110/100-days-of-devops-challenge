# 📉 Day 74: Docker Image Optimization via Multi-Stage Builds

## 📋 Project Overview
Bloated Docker images significantly slow down CI/CD pipelines, increase cloud storage costs, and expand the security attack surface. Today, I tackled image optimization by engineering a **Multi-Stage Docker Build**. I successfully decoupled the heavy build-time environment from the lightweight runtime environment, reducing the final container footprint by over 90%.

## ⚙️ Core Concepts Explored
* **Multi-Stage Builds:** Utilizing multiple `FROM` statements in a single `Dockerfile` to separate the build pipeline from the production runtime.
* **Build Context Isolation:** Preventing source code, compilers, and heavy dependency folders (like `node_modules`) from leaking into the final production image.
* **Artifact Copying (`COPY --from=`):** Selectively extracting only the compiled, production-ready artifacts from the builder stage and injecting them into a lean runtime image (like `alpine`).
* **Security & Cost Optimization:** Reducing the attack surface area by removing unnecessary OS packages and slashing registry storage costs.

## 🛠️ Execution Steps
1. **Mock Application Setup:** Created a standard `package.json` setup to simulate a modern Javascript frontend build process.
2. **Stage 1 (The Builder):** Defined a heavy `node:18` base image to act as the builder environment. Executed the build commands to generate the static artifacts.
3. **Stage 2 (The Runtime):** Defined a hyper-lightweight `nginx:alpine` image.
4. **Artifact Extraction:** Used the `COPY --from=builder` directive to transfer only the generated `/build` directory into the Nginx hosting path, completely discarding the Node.js environment.
5. **Validation:** Built the image using `docker build`. Executed `docker images` to verify the drastic reduction in image size compared to a standard Node-based container.
