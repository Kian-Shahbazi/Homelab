# Control Host: `dhlc-l-vm-dock-1`

## ⚙️ Naming

| **Hostname - Proxmox** | **Hostname - VM (shortname)** | **FQDN - Fully Qualifield Domain Name** |
|------------------------|-------------------------------|-----------------------------------------|
| dhlc-l-vm-dock-1       | albion                        | dock-1.local                            |

## 📌 Purpose
The virtual machine **`dhlc-l-vm-dock-1`** serves as the **docker node** in the homelab cluster.
It acts as the **docker-container-hosts** and is primarily used for:

- **Central Docker Station** → Docker Container point of Contact.
- **Hosting useful selfhosting tools** → Tools that are useful in my day to day life.
- **Docker Testlab** → A zone where i can seamingless test new images fast and performand.

This host is **intended to run workloads**, but rather the kinds of workloads which are easier to run in docker than in kubernetes itself.

---

## ⚙️ Specifications

| Component            | Configuration                                                     |
|----------------------|-------------------------------------------------------------------|
| **VM ID**            | 400                                                               |
| **Node**             | `dhlc-l-vm-dock-1`                                                |
| **vCPUs**            | 4 (1 socket, 4 cores) – x86-64 with AES support                   |
| **Memory (RAM)**     | 6 GiB (configurable, Ballooning optional for flexibility)         |
| **Disk**             | 16 GiB (VirtIO SCSI, with I/O thread enabled)                     |
| **BIOS**             | SeaBIOS                                                           |
| **Machine Type**     | i440fx (default)                                                  |
| **SCSI Controller**  | VirtIO SCSI single                                                |
| **CD/DVD Drive**     | Debian 12.11.0 netinst ISO (installation media)                   |
| **Network Device**   | VirtIO (bridge: `vmbr0`, firewall enabled, MAC: `BC:24:11:BC:2A:32`) |

---

## 🛠️ Installed Tools

- **Base-apt and Base-brew** → [apt_tools.sh](/Setup/Scripts/apt_tools.sh) [brew_tools.sh](/Setup/Scripts/brew_tools.sh)
- **Docker** → Containerization
- **Docker-Compose** → Multi-container application
- **lazydocker** → Terminal UI for Docker management.

---

## 📚 Notes
