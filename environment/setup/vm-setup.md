VM Setup Documentation
===============

## Setting Up New VMs After Cloning Template

### 1. Generate SSH Host Keys and Enable SSH Service
**Purpose:** Each VM needs unique SSH host keys for security.
```bash
sudo ssh-keygen -A
sudo systemctl start ssh.service
sudo systemctl enable ssh.service
```
### 2. Set Hostname
**Purpose:** Give VM a uniquehostname to distinguish it from other machines on the network.

```bash
sudo hostnamectl set-hostname new-name
# Also update /etc/hosts with the new hostname
# Format:
# 127.0.1.1    debian.local debian
# Where: debian.local = FQDN, debian = shortname
debian.local = FQDN
debian = shortname
```

### 3. Add VM to Control Node
**Purpose:** Copy the SSH public key from the control node to the new VM.
**Run this command FROM your control node:**
```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub user@ip
```

## Other things to do

1. Only one time - Create ssh-key and lock root-user login access
```bash
ssh-keygen -t ed25519 -C "dhlcl-master-key" -f ~/.ssh/dhlcl_master_key
#In /etc/ssh/sshd_config
PermitRootLogin no
DenyUsers root
```
