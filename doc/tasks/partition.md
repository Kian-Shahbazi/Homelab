# 🚀 Expanding VM Storage in Proxmox

This guide explains how to add extra storage to an existing VM in Proxmox and create a new partition.

---

## 1. Create a New Partition

1. Open the disk partitioning tool:
   ```bash
   sudo cfdisk /dev/sda

Create a new partition (e.g., /dev/sda3) and save your changes.

Exit cfdisk.

## 2. Format the Partition

sudo mkfs.ext4 /dev/sda3

## 3. Format the Partition

Create a Mount Point

sudo mkdir /mnt/xxx

## 4. Mount the Partition

You have two options to mount the partition:

Option 1: Temporary Mount 🔧
sudo mount /dev/sda3 /mnt/xxx


⚠️ This mount is temporary and will be lost after a reboot.

Option 2: Permanent Mount 💾

Find the UUID of the new partition:

lsblk -f


Edit /etc/fstab:

sudo nano /etc/fstab


Add a new line for the partition:

UUID=<UUID_of_sda3>  /mnt/xxx  ext4  defaults  0 2


Save the file and mount all partitions:

sudo mount -a


(Optional) Reboot to ensure the partition is mounted correctly.

## 5. Verify the Mount ✅

df -h
lsblk
