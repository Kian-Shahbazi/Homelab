# 🚀 Adding NFS Storage in Proxmox

## Step 1: Create NFS Share

On NAS:

1. Create volume
2. Create folder in Volume

If not configured yet - enable nfs service

3. Configure folder
  - set client ip [proxmox_ip]
  - set permissions [read_write]
  - set squash root
  - set async

4. On Homelab [Proxmox]

  - Datacenter - Storage - Add - NFS
  - Set ID [Storage_Name]
  - Set Server IP [nas_ip]
  - Content [backup/ISO/etc]
