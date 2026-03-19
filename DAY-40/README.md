# 📊 Day 40: EC2 Stress Testing & Live CloudWatch Monitoring

## 📋 Project Overview
Building infrastructure is only half the job; monitoring how it behaves under extreme load is what keeps systems alive. Today, I launched an Amazon EC2 instance, intentionally overloaded its CPU using a stress-testing tool, and monitored the real-time telemetry data using **Amazon CloudWatch**.

## ⚙️ Core Concepts Explored
* **Amazon CloudWatch:** AWS's native monitoring and observability service used to collect metrics, logs, and set alarms.
* **Telemetry Data:** Understanding `CPUUtilization`, one of the most critical metrics for EC2 health.
* **Load Simulation:** Using Linux tools (`stress`) to artificially generate high CPU loads and simulate a massive traffic spike.
* **NOC (Network Operations Center) Operations:** Experiencing how engineers monitor live infrastructure graphs to detect anomalies.

## 🛠️ Steps Executed
1. **Infrastructure Provisioning:** Launched an Amazon Linux 2023 EC2 instance (`t2.micro`).
2. **Server Access:** Connected to the instance via EC2 Instance Connect.
3. **Environment Setup:** Updated the package manager and installed the `stress` utility.
4. **Stress Test Execution:** Ran the command `stress --cpu 4 --timeout 300` to force the CPU to 100% utilization for 5 minutes.
5. **Real-Time Monitoring:** Navigated to the CloudWatch Metrics dashboard, filtered by EC2 Per-Instance Metrics, and observed the live visual graph spiking to its maximum limit.

