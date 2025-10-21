# 🏠 Homelab Repository

Welcome to my **Homelab repository** — a personal space for documenting, planning, and automating my self-hosted infrastructure. This repository is where I collect ideas, write down architectural decisions, and store scripts that help power and maintain my Homelab.

## 📘 About This Repo

This project is a work-in-progress reflection of my journey into building a reliable, secure, and efficient Homelab. Whether it’s hosting services, managing backups, experimenting with new technologies, or creating automation workflows — everything lives here.

Feel free to explore or get inspired!

## 📂 Repository Structure

A quick overview of the repository layout for documentation, environment setup, and automation scripts.

### 🧾 [doc/](./doc)
Comprehensive documentation covering system design, standards, and cluster setup.

- **[DHLC_Cluster/](./doc/DHLC_Cluster)** – Guides for cluster configuration and node setup
  - [cluster_setup.md](./doc/DHLC_Cluster/cluster_setup.md)
  - [dhlc-l-vm-ctrl-1.md](./doc/DHLC_Cluster/dhlc-l-vm-ctrl-1.md)
  - [dhlc-l-vm-dock-1.md](./doc/DHLC_Cluster/dhlc-l-vm-dock-1.md)
  - [dhlc-l-vm-k8s-1.md](./doc/DHLC_Cluster/dhlc-l-vm-k8s-1.md)
  - [dhlc-l-vm-k8s-2.md](./doc/DHLC_Cluster/dhlc-l-vm-k8s-2.md)
  - [dhlc-l-vm-k8s-3.md](./doc/DHLC_Cluster/dhlc-l-vm-k8s-3.md)
- [naming-convention.md](./doc/naming-convention.md) – Naming rules for systems and resources
- [vm-id-convention.md](./doc/vm-id-convention.md) – Virtual machine ID standards
- [os_choice.md](./doc/os_choice.md) – OS selection rationale
- [services.md](./doc/services.md) – List of active or planned services
- [tools.md](./doc/tools.md) – Recommended tools and utilities
- [todo-list.md](./doc/todo-list.md) – Current project tasks
- [template.md](./doc/template.md) – Base template for new documentation pages

---

### ⚙️ [Environment/](./Environment)
Everything needed to bootstrap and automate the working environment.

- **[Automation/](./Environment/Automation)** – Automated setup scripts and configurations
  - **[Ansible/](./Environment/Automation/Ansible)** – Infrastructure automation via Ansible
    - [ansible-infrastructure/](./Environment/Automation/Ansible/ansible-infrastructure)
      - [ansible.cfg](./Environment/Automation/Ansible/ansible-infrastructure/ansible.cfg)
      - [hosts.yml](./Environment/Automation/Ansible/ansible-infrastructure/inventories/production/hosts.yml)
      - Playbooks:
        - [docker-setup-robust.yaml](./Environment/Automation/Ansible/ansible-infrastructure/playbooks/docker-setup-robust.yaml)
        - [k3s-install.yaml](./Environment/Automation/Ansible/ansible-infrastructure/playbooks/k3s-install.yaml)
        - [system-update.yaml](./Environment/Automation/Ansible/ansible-infrastructure/playbooks/system-update.yaml)
    - [Setup.md](./Environment/Automation/Ansible/Setup.md) – Ansible setup guide
  - **[Scripts/](./Environment/Automation/Scripts)** – Quick setup utilities
    - [apt_tools.sh](./Environment/Automation/Scripts/apt_tools.sh)
    - [brew_tools.sh](./Environment/Automation/Scripts/brew_tools.sh)
- **[dotfiles/](./Environment/dotfiles)** – Developer environment configuration
  - [zshrc](./Environment/dotfiles/zshrc)
  - [tmux.conf](./Environment/dotfiles/tmux.conf)
  - [starship.toml](./Environment/dotfiles/starship.toml)
- **[Setup/](./Environment/Setup)** – Environment setup documentation
  - [workspace_setup.md](./Environment/Setup/workspace_setup.md)
  - [k3s.md](./Environment/Setup/k3s.md)

---

✅ **Tip:** Start with the [Environment/Setup/workspace_setup.md](./Environment/Setup/workspace_setup.md) guide for a smooth onboarding process.


## 🧠 Goals

- Learn and apply **DevOps**, **networking**, and **system administration** principles
- Host and maintain my own **self-hosted services**
- Explore **automation** and **infrastructure-as-code**
- Build a private, secure, and resilient network environment

## 🛠️ Technologies & Tools (Planned/Used)

- 🐳 Docker & Docker Compose
- ☸️ Kubernetes
- 📦 Proxmox / KVM
- 🌐 Pi-hole / AdGuard Home
- 🧰 Ansible / Bash scripting
- 🔐 WireGuard / Tailscale
- ☁️ NAS / Backup strategies
- 📊 Grafana + Prometheus

## 🚧 Work in Progress

This repository evolves as I experiment and refine my Homelab setup. Expect notes, configs, diagrams, and maybe some chaos!

---

Happy homelabbing! 🧪
