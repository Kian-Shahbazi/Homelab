# Naming Convention – Homelab Cluster (Proxmox)

## 🧠 Goal

Establish a consistent and well-structured naming convention for all virtual machines, containers, and templates in the homelab cluster – based on location, role, and resource type.

## 📚 Convention Structure

Structure: location, cluster, OS, resource type, role, instance number

### Component Details

| Abbreviation   | Meaning                            | Example Value         |
|----------------|------------------------------------|------------------------|
| `d`            | Location (*despia*)                | `d`                    |
| `hlc`          | Cluster Type (*HomeLabCluster*)    | `hlc`                  |
| `l` / `w`      | Operating System                   | `l` or `w`             |
| `vm` / `lxc` / `template` | Resource Type          | `vm`, `lxc`, `template` |
| `ctrl`, `dock`, `proxy`, `smarthome`, … | Role label    | freely defined     |
| `1`            | Instance number (not `001`)        | `1`, `2`, …            |

---

## 🔤 Examples

| Name                      | Purpose                                     |
|---------------------------|---------------------------------------------|
| `dhlcl-template-os-base`  | Base template for Ubuntu/Linux VMs          |
| `dhlcl-vm-ctrl-1`         | Controller VM (e.g., Ansible, Monitoring)   |
| `dhlcl-vm-dock-1`         | Docker host                                 |
| `dhlcl-vm-proxy-1`        | Reverse proxy (e.g., Traefik, Nginx)        |
| `dhlcl-vm-smarthome-1`    | Home automation system (e.g., HAOS)         |
| `dhlcl-lxc-dhcp-1`        | DHCP server as an LXC container             |

---

## ✅ Best Practices

- Use sequential numbering **per role**, not across all VMs globally.
- Clearly mark base images/templates using `template`.
- Use descriptive role names for critical components, such as `ctrl` for controller (e.g., Ansible master).
- Optionally expand location prefix for multi-location setups (e.g., `b` for *berlin*, `f` for *frankfurt*).
