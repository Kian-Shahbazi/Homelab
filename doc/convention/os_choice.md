# 🐧 Debian 12 for Homelab VMs – Cluster Setup

## 📋 Overview

**Debian 12 (Bookworm)** is a stable, lightweight, and flexible Linux distribution ideal for homelab environments, especially when performance, reliability, and minimalism are desired. It is particularly well-suited for running virtual machines, containers, and orchestrated environments such as Kubernetes.

---

## ✅ Why Choose Debian 12 for Homelab VMs?

| Feature | Benefit |
|--------|---------|
| 🧱 **Stability** | Based on thoroughly tested packages — ideal for long-running services |
| 🧽 **Minimal Base Install** | Clean, lean system with only what you choose |
| 🔒 **Security** | Regular security updates from Debian Security Team |
| 💾 **Low Resource Usage** | Excellent for small VMs and clustered environments |
| 🧩 **Flexibility** | Highly customizable; choose only the packages you need |
| 🛠️ **Systemd-based** | Compatible with most modern orchestration tools |
| 🌍 **Large Ecosystem** | Massive package repositories and documentation |
| 🧰 **Excellent for automation** | Works well with Ansible, Terraform, cloud-init, etc. |

---

## 🖥️ Use Case: Cluster Setup

This Debian 12 image is prepared for a **5-node cluster** setup:

- 1x Controller Node (monitoring, DNS, control plane, etc.)
- 1x Docker Node (for container workloads)
- 3x Kubernetes Nodes (worker nodes for your K8s cluster)

---

## 🔐 Recommended Initial System Setup

### 1. 🛡️ Firewall (UFW)

Debian does **not** include a firewall by default (unlike Ubuntu Server, which enables UFW with SSH rules out of the box). To secure your system:

```bash
sudo apt install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable
```

### 2. 🔑 SSH-Enable

SSH is essential for remote management of your homelab nodes. Debian 12 typically comes with the SSH server package available but not always enabled by default.

#### Install and Enable SSH Server

```bash
sudo apt update
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
```

## ⚙️ Recommended Base Tools to Install

Install these tools **immediately after OS install** to make your system functional and ready for orchestration.

### 🔧 System & Maintenance and Initial System Setup

```bash
sudo apt install -y \
  sudo \
  curl \
  wget \
  git \
  gnupg \
  unzip \
  tar \
  ca-certificates \
  lsb-release \
  software-properties-common \
  apt-transport-https
