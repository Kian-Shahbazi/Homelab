# Control Host: `dhlc-l-vm-k8s-1`

## ⚙️ Naming

| **Hostname - Proxmox** | **Hostname - VM (shortname)** | **FQDN - Fully Qualifield Domain Name** |
|------------------------|-------------------------------|-----------------------------------------|
| dhlc-l-vm-k8s-1        | lubellion                     | k8s-1.local                            |

## 📌 Purpose
The virtual machine **`dhlc-l-vm-k8s-1`** serves as the **Kubernetes Master node** in the homelab cluster.
It acts as the **cluster control plane** and is primarily used for:
- **Kubernetes API Server** → Central point for all cluster communication and management.
- **Cluster orchestration and scheduling** → Managing pod deployment across worker nodes.
- **etcd database management** → Storing cluster state and configuration data.
- **Controller management** → Running essential cluster controllers for resource management.
This host is **not intended to run application workloads**, but rather focuses on cluster management and control plane operations.

---

## ⚙️ Specifications

| Component            | Configuration                                                     |
|----------------------|-------------------------------------------------------------------|
| **VM ID**            | 500                                                               |
| **Node**             | `dhlc-l-vm-k8s-1`                                                |
| **vCPUs**            | 4 (1 socket, 4 cores) – x86-64 with AES support                   |
| **Memory (RAM)**     | 8 GiB (configurable, Ballooning optional for flexibility)         |
| **Disk**             | 80 GiB (VirtIO SCSI, with I/O thread enabled)                     |
| **BIOS**             | SeaBIOS                                                           |
| **Machine Type**     | i440fx (default)                                                  |
| **SCSI Controller**  | VirtIO SCSI single                                                |
| **CD/DVD Drive**     | Debian 12.11.0 netinst ISO (installation media)                   |
| **Network Device**   | VirtIO (bridge: `vmbr0`, firewall enabled, MAC: `BC:24:11:BC:2A:32`) |

---

## 🛠️ Installed Tools

- **Base-apt and Base-brew** → [apt_tools.sh](/Setup/Scripts/apt_tools.sh) [brew_tools.sh](/Setup/Scripts/brew_tools.sh)
- **k3s** (Minimal Kubernetes Engine for 3 nodes) → [k3s.md](/Setup/k3s.md)
- **Rancher** → Rancher UI

---

## 📚 Notes
