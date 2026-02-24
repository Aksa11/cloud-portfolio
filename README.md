**AWS Infrastructure Project: End-to-End Cloud Infrastructure Deployment Using AWS EC2, Nginx, and Linux Server Management**

###📌 Project Goal
I built a public web server from scratch to master the relationship between Cloud Networking and Linux Administration. 
I performed all configurations manually via the CLI to gain a deep understanding of service management and troubleshooting.

###🖼️ Network Architecture
Visualizing the Flow: This diagram shows my custom VPC, the Public Subnet, and the Security Group rules I configured to bridge the gap between the internet and my VM.

###🛠️ Technical Workflow (Manual Deployment)

I connected to an Ubuntu 24.04 EC2 Instance via SSH and executed the following steps:
1. **Network Security**: Defined Inbound Rules for Port 22 (Admin Access) and Port 80 (Public HTTP).
2. **Package Management**: Synchronized the local package index using sudo apt update.
3. **Service Installation**: Manually installed and initialized the Nginx web server.
4. **System Persistence**: Configured the systemd manager to ensure Nginx remains active after system reboots.
5. **Environment Audit**: Verified deployment by monitoring real-time request traffic in /var/log/nginx/access.log.
   
###🔍 Key Takeaways

⁍ CLI Proficiency: Comfortable navigating the Linux filesystem and managing root-level services.
⁍ Cloud Fundamentals: Understanding how VPCs and Subnets isolate resources.
⁍ Debugging: Able to interpret HTTP status codes (200, 304, 404) to solve connectivity issues.
