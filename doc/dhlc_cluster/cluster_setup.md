# 🌐 Cluster Setup – DHLC (Despian HomeLabCluster)

## 🧠 Goal
Build a **5-node homelab cluster** for experimenting with modern infrastructure, automation, container orchestration and hosting useful Home and life assistance tools.

---

## 🔤 Node Setup

| Name                 | Role / Purpose                                |
|----------------------|-----------------------------------------------|
| `dhlc-l-vm-ctrl-1`   | **Controller Node**: Ansible, CI/CD, Monitoring, Logging |
| `dhlc-l-vm-dock-1`   | **Docker Host**: Lightweight apps, sandboxing |
| `dhlc-l-vm-k8s-1`    | **K8s Node**: Control-plane / Worker (hybrid) |
| `dhlc-l-vm-k8s-2`    | **K8s Node**: Worker                          |
| `dhlc-l-vm-k8s-3`    | **K8s Node**: Worker                          |

---

## 🛠️ Software Stack

- **Base OS:** Debian 12 Bookworm
- **Automation:** Ansible + Terraform
- **Container Runtime:** Docker
- **Orchestration:** Kubernetes
- **Monitoring & Observability:** Prometheus + Grafana, Loki, Alertmanager
- **Logging:**
- **CI/CD:** ArgoCD

---

## 💾 Storage Plan

 - **NAS Storage** Implementing Network Attached Storage
---
