# Control Host: `dhlc-l-vm-k8s-2`

## ⚙️ Naming

| **Hostname - Proxmox** | **Hostname - VM (shortname)** | **FQDN - Fully Qualifield Domain Name** |
|------------------------|-------------------------------|-----------------------------------------|
| dhlc-l-vm-k8s-2        | titaniklad                    | k8s-2.local                            |

## 📌 Purpose
The virtual machine **`dhlc-l-vm-k8s-2`** serves as a **Kubernetes Worker node** in the homelab cluster.
It acts as the **application workload executor** and is primarily used for:
- **Pod execution** → Running containerized applications and services.
- **Kubelet service** → Managing pod lifecycle and container runtime operations.
- **Kube-proxy networking** → Handling network routing and load balancing for services.
- **Resource provisioning** → Providing CPU, memory, and storage resources for workloads.
This host is **specifically intended to run application workloads** and serves as the compute layer of the Kubernetes cluster.

---

## ⚙️ Specifications

| Component            | Configuration                                                     |
|----------------------|-------------------------------------------------------------------|
| **VM ID**            | 501                                                               |
| **Node**             | `dhlc-l-vm-k8s-2`                                                |
| **vCPUs**            | 2 (1 socket, 4 cores) – x86-64 with AES support                   |
| **Memory (RAM)**     | 5 GiB (configurable, Ballooning optional for flexibility)         |
| **Disk**             | 16 GiB (VirtIO SCSI, with I/O thread enabled)                     |
| **BIOS**             | SeaBIOS                                                           |
| **Machine Type**     | i440fx (default)                                                  |
| **SCSI Controller**  | VirtIO SCSI single                                                |
| **CD/DVD Drive**     | Debian 12.11.0 netinst ISO (installation media)                   |
| **Network Device**   | VirtIO (bridge: `vmbr0`, firewall enabled, MAC: `BC:24:11:BC:2A:32`) |

---

## 🛠️ Installed Tools

- **Base-apt and Base-brew** → [apt_tools.sh](/Setup/Scripts/apt_tools.sh) [brew_tools.sh](/Setup/Scripts/brew_tools.sh)
- **RKE2** → Rancher Kubernetes Engine

---

## 📚 Notes
