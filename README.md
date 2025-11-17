🚀 Terraform Docker Setup – Nginx Container Deployment

This project demonstrates how to provision a complete Docker-based Nginx setup using Terraform.
It includes:

Docker provider configuration
Custom Docker network
Pulling the latest Nginx image
Deploying a production-ready Nginx container
Environment variables, labels, volumes, and health checks

📁 Project Structure
.
├── main.tf     # Terraform configuration file
└── README.md   # Project documentation

🔧 Prerequisites

Ensure the following tools are installed:

🟢 Terraform (v1.x or later)
🟢 Docker (Engine running locally)
🟢 Optional: Git (if pushing to GitHub)

Verify installation:

terraform -v
docker -v

⚙️ Terraform Configuration Overview

The Terraform file performs these tasks:

1. Initializes Docker provider
2. Creates a custom Docker network
3. Pulls the latest Nginx Docker image
4. Creates a container with:
   a. Port mapping 8001 → 80
   b. Custom env variables
   c. Labels
   d.Mounted volume
   e. Healthcheck

🚀 How to Use This Project
1️⃣ Initialize Terraform

Run this once:

terraform init

2️⃣ View the Terraform Plan
terraform plan

3️⃣ Apply and Create Docker Resources
terraform apply -auto-approve


This will:

1. Create network web-net
2. Pull Nginx image
3. Run container advanced-nginx
4. Map port 8001
5. Mount /home/hlodha/html → /usr/share/nginx/html

Access Nginx at:

👉 http://localhost:8001

4️⃣ Destroy Infrastructure

To destroy the created container, image, and network:

terraform destroy -auto-approve

🧪 Health Check

Terraform config includes:

healthcheck {
  test     = ["CMD", "curl", "-f", "http://localhost"]
  interval = "30s"
  timeout  = "5s"
  retries  = 3
}


This ensures your Nginx container is always healthy.

📦 Volume Mapping

🟢 Host folder:

/home/hlodha/html

🟢 Container folder:

/usr/share/nginx/html


Any static file placed in the host folder appears inside the container.

🏷️ Labels Used
terraform-docker = hariom

Helps in identifying containers created via Terraform.

🌐 Network Used

A custom Docker network called web-net is created:

docker network ls

👤 Author

Hari Om
Terraform & DevOps Practice Project
