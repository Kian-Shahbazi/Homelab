# VM ID Convention – Proxmox Cluster "HomeLabCluster (hlc)"

To ensure clarity and scalability, VM IDs follow a consistent scheme. Each ID is unique within the cluster and represents its role and purpose in your homelab.

## 🧩 ID Ranges

| ID Range      | Purpose                              | Example ID  | Example VM Name                 |
|---------------|--------------------------------------|-------------|----------------------------------|
| 100–199       | 📦 Templates / Base Images            | 100         | `dhlc-template-l-base`         |
| 200–299       | ⚙️ System Services (DNS, DHCP, NTP…)  | 200         | `dhlc-l-lxc-dhcp-1`              |
| 300–399       | 🧠 Controllers / Management VMs       | 300         | `dhlc-l-vm-ctrl-1`               |
| 400–499       | 📦 Container Hosts (Docker, Podman)   | 400         | `dhlc-l-vm-dock-1`               |
| 500–599       | ☁️ Kubernetes Nodes                   | 500         | `dhlc-l-vm-k8s-1`                |
| 600–699       | 🌐 Network Services (Proxy, VPN…)     | 600         | `dhlc-l-vm-proxy-1`              |
| 700–799       | 🏠 Smart Home / Home Automation       | 700         | `dhlc-l-vm-smarthome-1`          |
| 800–899       | 🔬 Test / Development / Staging       | 800         | `dhlc-l-vm-test-1`               |
| 900–999       | 📊 Monitoring / Logging               | 900         | `dhlc-l-vm-monitoring-1`         |
| 1000+         | 🌍 External Services / Future Use     | 1000        | `dhlc-l-vm-ext-backup-1`         |

---

## 🧠 Naming Convention (used with the ID)

```text
[location][cluster][os-type][type][role]-[number]

Example:
dhlc-l-vm-dock-1        → Location "d", Cluster "hlc", Linux VM, role = Docker host, instance #1
dhlc-template-l-debian-base  → Linux base template with ID 100
