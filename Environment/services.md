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
| **dhl-l-ctrl-1** | - Ansible |

---

### Docker Nodes
| Node Name      | Services Installed     |
|----------------|------------------------|
| **dhl-l-dock-1** | - Docker <br> - Docker Compose |

---

### Kubernetes Nodes *(planned)*
| Node Name      | Services Installed |
|----------------|--------------------|
| _TBD_          | - Kubernetes <br> - Helm <br> - Monitoring (Prometheus/Grafana) |

---

## 📦 Service Overview
This section gives a high-level view of services across nodes.

| Service            | Node(s)         | Notes |
|--------------------|-----------------|-------|
| **Ansible**        | dhl-l-ctrl-1    | Used for automation & orchestration |
| **Docker**         | dhl-l-dock-1    | Container runtime |
| **Docker Compose** | dhl-l-dock-1    | Multi-container orchestration |
| **Kubernetes** *(planned)* | _TBD_ | Cluster management, container orchestration |
