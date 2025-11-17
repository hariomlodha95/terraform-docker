terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# -------------------------------
# Custom Docker Network
# -------------------------------
resource "docker_network" "web_network" {
  name = "web-net"
}

# -------------------------------
# Pull Latest Nginx Image
# -------------------------------
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

# -------------------------------
# Create Nginx Container
# -------------------------------
resource "docker_container" "nginx_container" {
  name  = "advanced-nginx"
  image = docker_image.nginx_image.image_id

  restart    = "always"
  must_run   = true
  logs       = true
  tty        = true
  stdin_open = false

  network_mode = docker_network.web_network.name

  # ---------- Ports ----------
  ports {
    internal = 80
    external = 8001
    protocol = "tcp"
  }

  # ---------- Environment ----------
  env = [
    "APP_ENV=production",
    "APP_VERSION=1.0.0"
  ]

  # ---------- Labels ----------
  labels  {
    label = "terraform-docker"
    value   = "hariom"
  }

  # ---------- Volumes ----------
  volumes {
    host_path      = "/home/hlodha/html"
    container_path = "/usr/share/nginx/html"
    read_only      = false
  }

  # ---------- Healthcheck ----------
  healthcheck {
    test     = ["CMD", "curl", "-f", "http://localhost"]
    interval = "30s"
    timeout  = "5s"
    retries  = 3
  }
}

