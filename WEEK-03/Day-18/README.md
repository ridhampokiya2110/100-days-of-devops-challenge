# 🚀 Day 18: Automating Deployment with Git & AWS

## 📋 Project Overview
On Day 18, I moved away from manual file creation on the server. Instead, I connected my AWS EC2 instance directly to GitHub. Now, any code I push to GitHub can be deployed to the live server with a single command.

## ⚙️ Architecture
**Laptop (VS Code)** ➡️ `git push` ➡️ **GitHub** ➡️ `git pull` ➡️ **AWS EC2 (Live Website)**

## 🛠️ Commands Used

### 1. Install Git on Server
```bash
sudo apt update
sudo apt install git -y