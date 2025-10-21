# Services Documentation

This document provides an overview of all deployed services and their hosting nodes.
It serves as a central reference point to keep track of the infrastructure as it grows.

---

## 📋 Table of Contents
- [Deployment Nodes](#deployment-nodes)
  - [Control Nodes](#control-nodes)
  - [Docker Nodes](#docker-nodes)
  - [Kubernetes Nodes](#kubernetes-nodes)
- [Service Overview](#service-overview)
- [Planned Extensions](#planned-extensions)

---

## 🖥 Deployment Nodes

### Control Nodes
| Node Name      | Services Installed |
|----------------|--------------------|
| **dhlc-l-ctrl-1** | - Ansible |

---

### Docker Nodes
| Node Name      | Services Installed     |
|----------------|------------------------|
| **dhlc-l-dock-1** | - Docker <br> - Docker Compose |

---

### Kubernetes Nodes *(planned)*
| Node Name      | Services Installed |
|----------------|--------------------|
| **dhlc-l-vm-k8s-1**          | - Kubernetes <br> - Helm <br> - Monitoring (Prometheus/Grafana) |
| **dhlc-l-vm-k8s-2**          | - Kubernetes <br> - Helm <br> - Monitoring (Prometheus/Grafana) |
| **dhlc-l-vm-k8s-3**          | - Kubernetes <br> - Helm <br> - Monitoring (Prometheus/Grafana) |


---

## 📦 Service Overview
This section gives a high-level view of services across nodes.

| Service            | Node(s)         | Notes |
|--------------------|-----------------|-------|
| **Ansible**        | dhlc-l-ctrl-1    | Used for automation & orchestration |
| **Docker**         | dhlc-l-dock-1    | Container runtime |
| **Docker Compose** | dhlc-l-dock-1    | Multi-container orchestration |
| **Kubernetes** *(planned)* | dhlc-l-vm-k8s-1, dhlc-l-vm-k8s-2, dhlc-l-vm-k8s-3 | Cluster management, container orchestration |
