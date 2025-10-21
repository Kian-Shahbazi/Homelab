# 🚀 Ansible Infrastructure Directory Structure Documentation

## 📖 Overview
This document describes the **directory structure** for my Ansible infrastructure management setup.
It is designed to be **scalable, modular, and maintainable** for managing multiple environments and node types.

---

## 🌳 Directory Tree
ansible-infrastructure/
├── ansible.cfg # ⚙️ Main Ansible configuration file
├── inventories/ # 📦 Environment-specific inventories
│ └── production/ # 🏭 Production environment configuration
│ └── hosts.yml # 📋 Inventory file for production hosts
└── playbooks/ # 📜 Playbooks for automated tasks
├── docker-setup-robust.yaml # 🐳 Robust Docker setup playbook
└── system-update.yaml # 🔄 System update and maintenance playbo


---

## 📂 File & Directory Details

### ⚙️ Root Level
- **`ansible.cfg`**
  Defines Ansible’s default behavior & settings.
  **Key settings:**
  - `inventory`: Default inventory location
  - `remote_user`: Default SSH user
  - `host_key_checking`: Disabled for automation
  - SSH performance optimizations

---

### 📦 Inventories
- **`inventories/`** → Holds environment-specific inventory definitions.
  Useful for **production, staging, development** separation.

#### 🏭 Production
- **`hosts.yml`** → Defines hosts & groups:
  - `docker`: Docker hosts
  - `kubernetes`: Parent group for all k8s nodes
    - `k8s_masters`: Control-plane nodes
    - `k8s_workers`: Worker nodes

- **`group_vars/`** → Vars applying to production hosts:
  - `all.yml`: Vars for **all hosts**
  - `docker.yml`: Vars for **docker group**
  - `kubernetes.yml`: Vars for **k8s group**

#### 🧪 Staging
- Mirror of production, ready for future use.

---

### 🔑 Variables
- **`group_vars/` (Global)**
  Vars that apply across **all environments**.
  ⚠️ Use sparingly — lower priority than env-specific vars.

- **`host_vars/`**
  Vars specific to **individual hosts**.
  **Use cases:**
  - Host-specific configs
  - Unique certs/credentials
  - Custom tweaks not shared by groups

---

### 🧩 Roles
Reusable automation modules.

**Example structure:**

roles/
├── docker-install/
│ ├── tasks/main.yml
│ ├── handlers/main.yml
│ ├── defaults/main.yml
│ └── templates/
└── kubernetes-setup/
├── tasks/main.yml
├── handlers/main.yml
└── files/

---

### 📜 Playbooks
Orchestrate execution of roles & tasks.

**Conventions:**
- `site.yml`: Master playbook including all others
- `docker-setup.yml`: Docker-specific tasks
- `k8s-setup.yml`: Kubernetes-specific tasks

---

### 📂 Files
Static files copied **as-is** to target hosts.
Examples: configs, scripts, binaries, certs.

---

### 📝 Templates
Dynamic **Jinja2 templates**.
Great for configs that need vars, environment-specific details, or generated content.

---

## ⚡ Current Configuration

### ✅ Active Host
- **docker-host** → `192.168.2.171` (`user: albaz`)

### 🌱 Planned Expansion
- Add **3 Kubernetes nodes**:
  - `k8s_masters` group
  - `k8s_workers` group

### 🔐 SSH Setup
- Passwordless SSH enabled
- Keys:
  - Private → `~/.ssh/id_ed25519`
  - Public → `~/.ssh/id_ed25519.pub`
- ✅ Keys deployed to **docker-host**

---
✨ This structure ensures clean separation of environments, reusable roles, and future scalability.
