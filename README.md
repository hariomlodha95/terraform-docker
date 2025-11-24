🚀 Terraform + Docker Deployment (Nginx Web Server)

📌 Objective
  Set up and deploy an Nginx container using Terraform with Docker provider.
  This project automates container creation, network setup, and resource provisioning.
---
🧰 Tools & Technologies:
  - Terraform
  - Docker
  - Nginx
  - Local Docker Engine
---
📂 Project Structure
```
terraform-docker/
├── main.tf
├── terraform.tfstate
├── terraform.tfstate.backup
└── .terraform/

```
---
⚙️ What the Terraform config does

1. Initializes the Docker provider.
2. Creates a custom Docker network (named web-net).
3. Pulls the latest Nginx image.
4. Creates and runs an Nginx container (advanced-nginx) with:
    - Port mapping (host port 8001 → container port 80)
    - Environment variables
    - Labels (terraform-docker = hariom)
    - Volume mount (/home/hlodha/html on host → /usr/share/nginx/html in container)
    - Health check (to ensure the container is operational)
5. The container can be accessed via: http://localhost:8001
---
✅ Prerequisites
  Ensure the following are installed:
   - Terraform (v1.x or later)
   - Docker Engine (running locally)
     Optional: Git (if committing to GitHub)
---
🧪 How to Use
1. Initialise Terraform:
```
terraform init
```
2. Review what Terraform will do:
```
terraform plan
```
3. Apply changes and build resources:
```
terraform apply -auto-approve  
```
Result:
   1. Docker network web-net created
   2. Nginx image pulled
   3. Container advanced-nginx running
   4. Port 8001 mapped to container’s port 80
   5. Host folder /home/hlodha/html mounted into container

4. To clean up / destroy created resources:
```
terraform destroy -auto-approve
```
---
🩺 Health Check
 The configuration includes:
```
healthcheck {
  test     = ["CMD", "curl", "-f", "http://localhost"]
  interval = "30s"
  timeout  = "5s"
  retries  = 3
}
```
This ensures the Nginx container is healthy and responding.
---
📂 Volume Mapping & Labels
 1. Host directory: /home/hlodha/html → Container directory: /usr/share/nginx/html
 → Any static files you place in the host folder will appear inside the container.
 2. Label assigned: terraform-docker = hariom
 → Helps identify containers created by this Terraform config.
---
👤 Author : 
 - Hari Om — Terraform & DevOps practice project.
