# Control Host: `dhlc-l-vm-ctrl-1`

## ⚙️ Naming

| **Hostname - Proxmox** | **Hostname - VM (shortname)** | **FQDN - Fully Qualifield Domain Name** |
|------------------------|-------------------------------|-----------------------------------------|
| dhlc-l-vm-ctrl-1       | aluber                        | ctrl-1.local                            |

## 📌 Purpose
The virtual machine **`dhlc-l-vm-ctrl-1`** serves as the **control node** in the homelab cluster.
It acts as the **central access point** (bastion host) and is primarily used for:

- **Central SSH Access** → Entry point into the cluster.
- **Configuration Management** → Running **Ansible** playbooks to configure and manage other nodes.
- **Kubernetes Management Tools** → Hosting client-side tools such as `kubectl`, `helm`, and `k9s` to interact with the Kubernetes cluster.
- **Automation & Orchestration** → Serving as the main control plane for infrastructure automation tasks.
- **Future Expansion** → Potential to run additional monitoring, logging, or CI/CD tools if required.

This host is **not intended to run workloads**, but rather to provide a stable and consistent management interface for the cluster.

---

## ⚙️ Specifications

| Component            | Configuration                                                     |
|----------------------|-------------------------------------------------------------------|
| **VM ID**            | 300                                                               |
| **Node**             | `dhlc-l-vm-ctrl-1`                                                |
| **vCPUs**            | 2 (1 socket, 2 cores) – x86-64 with AES support                   |
| **Memory (RAM)**     | 2 GiB (configurable, Ballooning optional for flexibility)         |
| **Disk**             | 16 GiB (VirtIO SCSI, with I/O thread enabled)                     |
| **BIOS**             | SeaBIOS                                                           |
| **Machine Type**     | i440fx (default)                                                  |
| **SCSI Controller**  | VirtIO SCSI single                                                |
| **CD/DVD Drive**     | Debian 12.11.0 netinst ISO (installation media)                   |
| **Network Device**   | VirtIO (bridge: `vmbr0`, firewall enabled, MAC: `BC:24:11:BC:2A:32`) |

---

## 🛠️ Installed Tools

- **Base-apt and Base-brew** → [apt_tools.sh](/Setup/Scripts/apt_tools.sh) [brew_tools.sh](/Setup/Scripts/brew_tools.sh) ✅
- **Ansible** → Infrastructure automation and provisioning. Installed via apt. ✅
- **kubectl** → Kubernetes CLI for cluster management.
- **helm** → Kubernetes package manager.
- **k9s** → Terminal UI for Kubernetes management.

---

## 📚 Notes

- **Created Ansible-key** -> Created `ansible-aluber` key for the controll host to be able to connect to all other hosts.
- **Created Github-key** -> Created `github-aluber` and added config to ssh for github connection.
