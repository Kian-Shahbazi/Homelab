# 🚀 Ansible Infrastructure Directory Structure Documentation

## 📖 Overview
This document describes the **directory structure** for my Ansible infrastructure management setup.
It is designed to be **scalable, modular, and maintainable** for managing multiple environments and node types.

---

## 🌳 Directory Tree

```
ansible-infrastructure/
├── ansible.cfg                      # ⚙️ Main Ansible configuration file
├── README.md                        # 📘 Project documentation
├── inventories/                     # 📦 Environment-specific inventories
│   └── production/                  # 🏭 Production environment configuration
│       ├── hosts.yml                # 📋 Inventory file for production hosts
│       ├── group_vars/              # 📊 Group-specific variables
│       └── host_vars/               # 🖥️ Host-specific variables
├── playbooks/                       # 📜 Playbooks for automated tasks
│   ├── docker-setup-robust.yaml     # 🐳 Robust Docker setup playbook
│   ├── k3s-install.yaml             # ☸️ K3s lightweight Kubernetes installer
│   └── system-update.yaml           # 🔄 System update and maintenance playbook
├── roles/                           # 🧩 Reusable automation modules
├── files/                           # 📂 Static files for deployment
└── templates/                       # 📝 Jinja2 templates for dynamic configs
```

---

## 📂 File & Directory Details

### ⚙️ Root Level

- **`ansible.cfg`**
  Defines Ansible's default behavior & settings.
  **Key settings:**
  - `inventory`: Default inventory location
  - `remote_user`: Default SSH user
  - `host_key_checking`: Disabled for automation
  - SSH performance optimizations

- **`README.md`**
  Project documentation and quick reference guide.

---

### 📦 Inventories

- **`inventories/`** → Holds environment-specific inventory definitions.
  Useful for **production, staging, development** separation.

#### 🏭 Production

- **`hosts.yml`** → Defines hosts & groups:
  - `docker`: Docker hosts
  - `k3s`: K3s cluster nodes
  - `kubernetes`: Parent group for all k8s nodes
    - `k8s_masters`: Control-plane nodes
    - `k8s_workers`: Worker nodes

- **`group_vars/`** → Variables applying to production host groups:
  - `all.yml`: Variables for **all hosts**
  - `docker.yml`: Variables for **docker group**
  - `k3s.yml`: Variables for **k3s cluster**
  - `kubernetes.yml`: Variables for **kubernetes group**

- **`host_vars/`** → Variables specific to **individual hosts**.
  **Use cases:**
  - Host-specific configurations
  - Unique certificates/credentials
  - Custom tweaks not shared by groups

#### 🧪 Future Environments

- **`staging/`** → Mirror of production structure, ready for staging deployments
- **`development/`** → Development environment for testing changes

---

### 🔑 Variables

- **`group_vars/` (within inventories)**
  Variables that apply to **specific groups** within an environment.
  Higher priority than global vars, lower than host vars.

- **`host_vars/` (within inventories)**
  Variables specific to **individual hosts**.
  **Highest priority** in the variable hierarchy.
  Examples:
  - Host-specific IP configurations
  - Unique SSL certificates
  - Custom resource limits
  - Environment-specific credentials

---

### 🧩 Roles

Reusable automation modules for specific tasks.

**Standard role structure:**
```
roles/
├── docker-install/
│   ├── tasks/
│   │   └── main.yml          # Main task definitions
│   ├── handlers/
│   │   └── main.yml          # Event handlers (restart services, etc.)
│   ├── defaults/
│   │   └── main.yml          # Default variables (lowest priority)
│   ├── vars/
│   │   └── main.yml          # Role variables (high priority)
│   ├── files/                # Static files specific to this role
│   ├── templates/            # Jinja2 templates specific to this role
│   └── meta/
│       └── main.yml          # Role dependencies and metadata
└── k3s-setup/
    ├── tasks/main.yml
    ├── handlers/main.yml
    └── templates/
```

**Benefits:**
- ♻️ Reusable across playbooks
- 🧪 Independently testable
- 📦 Encapsulated logic
- 🔄 Easy to share and version

---

### 📜 Playbooks

Orchestrate execution of roles & tasks.

**Current playbooks:**
- **`docker-setup-robust.yaml`** → Comprehensive Docker installation and configuration
- **`k3s-install.yaml`** → K3s lightweight Kubernetes cluster setup
- **`system-update.yaml`** → System maintenance and package updates

**Best practices:**
- Use descriptive names
- Keep playbooks focused on specific goals
- Leverage roles for reusability
- Include clear documentation in comments

**Common pattern:**
```yaml
---
- name: Setup Docker Infrastructure
  hosts: docker
  become: true
  roles:
    - docker-install
    - docker-compose-setup
```

---

### 📂 Files

Static files copied **as-is** to target hosts.

**Examples:**
- Configuration files (`.conf`, `.yaml`)
- Scripts (shell, Python, etc.)
- Binaries and executables
- SSL certificates and keys
- License files

**Usage in playbooks:**
```yaml
- name: Copy static config
  copy:
    src: files/app.conf
    dest: /etc/app/app.conf
```

---

### 📝 Templates

Dynamic **Jinja2 templates** for configuration files.

**Use cases:**
- Configs requiring variables
- Environment-specific settings
- Generated content based on facts
- Multi-host configurations

**Example template (`templates/docker-daemon.json.j2`):**
```json
{
  "log-driver": "{{ docker_log_driver }}",
  "log-opts": {
    "max-size": "{{ docker_log_max_size }}"
  }
}
```

**Usage in playbooks:**
```yaml
- name: Configure Docker daemon
  template:
    src: templates/docker-daemon.json.j2
    dest: /etc/docker/daemon.json
```

---

## ⚡ Current Configuration

### 🔐 SSH Setup

- Passwordless SSH enabled for all hosts
- Key-based authentication required
- Keys stored securely:
  - Private → `~/.ssh/id_ed25519`
  - Public → `~/.ssh/id_ed25519.pub`
- ✅ Keys deployed to all managed hosts

---

## 🎯 Usage Examples

### Run a playbook against production:
```bash
ansible-playbook -i inventories/production/hosts.yml playbooks/docker-setup-robust.yaml
```

### Update all production systems:
```bash
ansible-playbook -i inventories/production/hosts.yml playbooks/system-update.yaml
```

### Check connectivity to all hosts:
```bash
ansible -i inventories/production/hosts.yml all -m ping
```
---

## 📚 Best Practices

### 🎨 Organization
- Keep inventories environment-specific
- Use roles for reusable components
- Maintain clear naming conventions
- Document complex logic

### 🔒 Security
- Use Ansible Vault for sensitive data
- Implement least-privilege access
- Regularly rotate SSH keys
- Never commit secrets to version control

### 🧪 Testing
- Test playbooks in staging first
- Use `--check` mode for dry runs
- Validate syntax before execution
- Keep backups before major changes

### 📈 Scalability
- Design roles to be idempotent
- Use variables for flexibility
- Implement proper error handling
- Monitor execution times

---

✨ This structure ensures clean separation of environments, reusable roles, and future scalability.
