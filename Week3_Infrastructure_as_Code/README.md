# AWS Infrastructure Automation with Terraform

## 🚀 Project Overview
This project demonstrates how to use **Infrastructure as Code (IaC)** to deploy a fully functional, secure networking environment in AWS. Instead of manual configuration, I used **Terraform** to provision a custom VPC and a virtual server (EC2) ready for web traffic.

## 🏗️ Architecture
The following AWS resources are managed by this code:
* **VPC & Networking:** A custom Virtual Private Cloud with a public subnet.
* **Internet Connectivity:** An Internet Gateway and Route Table to allow traffic to and from the web.
* **Security:** A Security Group acting as a firewall, allowing **SSH (Port 22)** for management and **HTTP (Port 80)** for web traffic.
* **Compute:** A Linux EC2 instance (t2.micro) with an automatically assigned Public IP.



## 🛠️ Tech Stack
* **Cloud Provider:** AWS
* **IaC Tool:** Terraform
* **Language:** HCL (HashiCorp Configuration Language)

## 📂 Project Structure
* `main.tf`: The primary logic for AWS resources.
* `variables.tf`: Defined variables for reusability (Machine size, VPC ID).
* `outputs.tf`: Prints the Public IP of the server once created.
* `terraform.tfvars`: Stores the specific values for the variables.

## 📸 Proof of Deployment


# [AWS Console Success] 

<img width="838" height="393" alt="AWS console success" src="https://github.com/user-attachments/assets/f8fa13cb-769f-4225-b847-23e0417746b9" />

# [Terminal Output] 


<img width="541" height="308" alt="gui and terminal output" src="https://github.com/user-attachments/assets/d6b45c29-dfee-4d23-8153-c64e67042bfe" />

## 💡 What I Learned
* How to use **Data Sources** to reference existing AWS resources.
* The importance of **Stateful Security Groups** in AWS.
* How to link subnets to the internet using **Route Table Associations**.
