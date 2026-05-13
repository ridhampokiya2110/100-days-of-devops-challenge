# 📜 Day 86: Pipeline as Code - Transitioning to Jenkinsfile

## 📋 Project Overview
Managing Continuous Integration jobs via a web interface becomes highly inefficient and error-prone as a project scales. Today, I adopted the "Pipeline as Code" methodology. By writing a `Jenkinsfile`, I defined my entire CI/CD pipeline in a version-controlled script. This approach ensures that the deployment infrastructure is treated with the same rigor as the application code itself.

## ⚙️ Core Concepts Explored
* **Pipeline as Code:** The philosophy of storing infrastructure and automation logic in version control systems.
* **Declarative vs. Scripted Pipelines:** Utilizing the modern, readable declarative syntax in Jenkins to define execution stages.
* **Jenkinsfile:** The core artifact that Jenkins reads to execute a pipeline dynamically.
* **Stage View Visualization:** Breaking down a monolithic build job into granular, trackable stages (Build, Test, Deploy) for better logging and debugging.

## 🛠️ Execution Steps
1. **Author Jenkinsfile:** Created a file named `Jenkinsfile` at the root of the project repository containing the declarative pipeline structure:
   ```groovy
   pipeline {
       agent any
       stages {
           stage('Build') { steps { echo 'Building...' } }
           stage('Test') { steps { echo 'Testing...' } }
           stage('Deploy') { steps { echo 'Deploying...' } }
       }
   }