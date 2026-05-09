# 🏗️ Day 84: CI/CD Foundation - Executing the First Jenkins Pipeline

## 📋 Project Overview
Jenkins is one of the most widely adopted CI/CD orchestration tools in the industry. With my Jenkins server already provisioned locally, today's focus was on practical implementation. I created, configured, and successfully executed my very first Freestyle automation job. This serves as the baseline for all future complex CI/CD pipelines.

## ⚙️ Core Concepts Explored
* **Jenkins Architecture:** Navigating the dashboard, understanding item creation, and managing the build history.
* **Freestyle Projects:** Structuring basic automation jobs that allow maximum flexibility for custom scripting.
* **Build Steps:** Instructing the Jenkins runner engine to execute specific terminal commands (Shell/Batch) on the host machine.
* **Log Analysis:** Reading the Jenkins Console Output to debug, validate, and confirm the success of an execution.

## 🛠️ Execution Steps
1. **Dashboard Access:** Logged into the existing Jenkins UI via `http://localhost:8080`.
2. **Create Pipeline:** Initialized a new "Freestyle Project" named `Day84-First-Job`.
3. **Configure Build Step:** Added an "Execute shell" (or Windows batch command) step and injected the following script:
   ```bash
   echo "Hello from Jenkins!"
   echo "Day 84 of 100 Days of DevOps is completely successful!"
   echo "Ready for enterprise automation!"