# 🗄️ Day 31: Managed Databases with Amazon RDS (MySQL)

## 📋 Project Overview
Managing databases on traditional EC2 servers involves manual patching, scaling, and configuring backups. Today, I transitioned to a "Managed Service" approach by provisioning a highly available MySQL database using **Amazon Relational Database Service (RDS)**. 

## ⚙️ Core Concepts Explored
* **Managed Services:** Offloading administrative tasks (OS installation, database setup, patching, and automated backups) directly to AWS.
* **Amazon RDS:** A managed service that makes it easy to set up, operate, and scale a relational database in the cloud.
* **Database Endpoints:** Understanding how applications (like Node.js, Python, or Java backends) connect to the database via a unique AWS-generated DNS endpoint and port (`3306`).
* **Cost Optimization:** Carefully navigating the Free Tier limits by disabling storage autoscaling and Multi-AZ deployments for practice purposes.

## 🛠️ Steps Executed
1. **RDS Provisioning:** Navigated the RDS console to create a new MySQL database instance.
2. **Tier Selection:** Strictly selected the "Free Tier" template (`db.t3.micro` / `db.t4g.micro`) to maintain a zero-cost environment.
3. **Security Configuration:** Set up the Master Username and Password, and created a dedicated VPC Security Group to allow public access strictly for testing connectivity.
4. **Endpoint Generation:** Waited for the deployment to finish and successfully extracted the database connection Endpoint.
