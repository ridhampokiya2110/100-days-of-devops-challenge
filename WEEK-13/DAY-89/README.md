# 🚀 Day 89: Fully Automated Infrastructure with Terraform & Jenkins

Today, I reached a major milestone in my #100DaysOfDevOps challenge by automating the provisioning of AWS infrastructure using Terraform within a Jenkins CI/CD pipeline.

## ✅ Key Achievements
* **Dynamic AMI Fetching**: Implemented a dynamic lookup for the latest Ubuntu 24.04 LTS AMI in the `us-east-1` region, making the code reusable and error-free.
* **Automated EC2 Provisioning**: Configured Terraform to launch a `t3.micro` instance automatically via Jenkins.
* **Security as Code**: Defined Security Groups to manage inbound/outbound traffic (Port 22 & 80) programmatically.
* **CI/CD Integration**: Integrated Terraform initialization and application stages directly into the Jenkins Declarative Pipeline.

## 🛠️ Technical Stack
* **Cloud**: Amazon Web Services (AWS)
* **IaC**: Terraform
* **CI/CD**: Jenkins
* **OS**: Ubuntu 24.04 LTS

## 📂 Project Structure
- `terraform/main.tf`: Contains the AWS provider, AMI data source, EC2 instance, and Security Group definitions.
- `Jenkinsfile`: Automates the workflow using AWS credentials stored securely in Jenkins.

