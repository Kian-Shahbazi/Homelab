# 🖥️ Template VM Inventory

## 📌 Introduction
This document serves as a **central reference** for all template virtual machines used in the infrastructure.
Each entry contains:
- **OS and version**
- **Purpose / notes**
- **Host IP address**
- **Default user**
- **Connection snippet** for SSH access

The list is designed to be **extensible** — simply add more sections when new template VMs are created.

---

## 🟢 Current Templates

### **Debian 12 – Base Administration Template**
- **OS:** Debian GNU/Linux 12 (Bookworm)
- **Purpose:** Base environment for administration tools and testing
- **Default User:** `albaz`

**SSH Connection:**
```bash
ssh albaz@""
```

**Optional ~/.ssh/config Entry:**
```
Host debian12-template
    HostName 192.168.2.170
    User albaz
```
> With this config, you can connect using:
```bash
ssh debian12-template
```

---

## ➕ Adding More Templates
When creating a new template VM, copy the structure above and fill in:
1. **OS name & version**
2. **Purpose**
3. **Host IP**
4. **User**
5. **SSH connection details**

Example placeholder for a new entry:
```
### **Ubuntu 24.04 – Development Template**
- **OS:** Ubuntu 24.04 LTS
- **Purpose:** Web application development base
- **Host IP:** `192.168.x.xxx`
- **Default User:** `<username>`

**SSH Connection:**
```bash
ssh <username>@192.168.x.xxx
```
```
