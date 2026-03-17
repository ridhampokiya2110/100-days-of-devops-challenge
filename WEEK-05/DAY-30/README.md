# 🌍 Day 30: Global Content Delivery & HTTPS with AWS CloudFront

## 📋 Project Overview
Hosting a website on Amazon S3 (Day 29) is great, but it lacks two critical features for production: **Global Speed** and **SSL/HTTPS Security**. Today, I solved both problems by integrating my S3 static website with **Amazon CloudFront**, AWS's powerful Content Delivery Network (CDN).

## ⚙️ Core Concepts Explored
* **Content Delivery Network (CDN):** A globally distributed network of proxy servers (Edge Locations) that cache content closer to the end-users, drastically reducing latency.
* **Edge Caching & Invalidation:** Understanding how CloudFront caches files (`index.html`) and how to clear that memory (Cache Invalidation) when updates are made.
* **Default Root Object:** Configuring CloudFront to automatically serve the `index.html` file when the base URL is requested, preventing the classic S3 "Access Denied" XML error.
* **SSL/TLS Security:** Upgrading the website from standard HTTP to secure HTTPS using CloudFront's default certificate.

## 🛠️ Steps Executed
1. **Distribution Creation:** Provisioned a new CloudFront web distribution.
2. **Origin Configuration:** Mapped the CloudFront Origin to the S3 Static Website Endpoint.
3. **Security Enforcement:** Configured the Viewer Protocol Policy to automatically redirect all HTTP traffic to HTTPS.
4. **Troubleshooting:** Encountered the classic "AccessDenied" XML error. Successfully debugged and resolved it by:
   - Setting the **Default Root Object** to `index.html`.
   - Performing a **Cache Invalidation** (`/*`) to clear outdated edge caches.

