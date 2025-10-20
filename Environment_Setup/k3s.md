# K3s Cluster Installation

## Cluster Overview

```
lubellion:    192.168.x.x - 4 vCPU, 8 GB RAM, 80 GB Disk (Primary)
titaniklad:   192.168.x.x - 2 vCPU, 6 GB RAM, 60 GB Disk
alba-lenatus: 192.168.x.x - 2 vCPU, 6 GB RAM, 60 GB Disk
```

## Prerequisites

- SSH access to all nodes
- Nodes can reach each other (test with `ping`)
- Internet access on all nodes
- Hostnames configured correctly

## Installation

### 1. Install K3s on lubellion (Primary)

```bash
ssh user@lubellion
curl -sfL https://get.k3s.io | sh -s - server --cluster-init
```

### 2. Get join token

```bash
sudo cat /var/lib/rancher/k3s/server/node-token
```

Copy this token for the next steps.

### 3. Verify lubellion

```bash
sudo k3s kubectl get nodes
```

Expected output:
```
NAME        STATUS   ROLES                       AGE   VERSION
lubellion   Ready    control-plane,etcd,master   1m    v1.28.x+k3s1
```

### 4. Join titaniklad

```bash
ssh user@titaniklad

curl -sfL https://get.k3s.io | sh -s - server \
  --server https://<LUBELLION-IP>:6443 \
  --token <TOKEN>
```

### 5. Join alba-lenatus

```bash
ssh user@alba-lenatus

curl -sfL https://get.k3s.io | sh -s - server \
  --server https://<LUBELLION-IP>:6443 \
  --token <TOKEN>
```

### 6. Verify cluster

```bash
ssh user@lubellion
sudo k3s kubectl get nodes
```

Expected output:
```
NAME           STATUS   ROLES                       AGE   VERSION
lubellion      Ready    control-plane,etcd,master   5m    v1.28.x+k3s1
titaniklad     Ready    control-plane,etcd,master   3m    v1.28.x+k3s1
alba-lenatus   Ready    control-plane,etcd,master   2m    v1.28.x+k3s1
```

All nodes should show `STATUS: Ready`.

### 7. Verify system pods

```bash
sudo k3s kubectl get pods -n kube-system
```

Expected pods (all should be `Running`):
- coredns (2 pods)
- local-path-provisioner
- metrics-server
- traefik (ingress controller)

## kubectl Setup

### Option A: On lubellion

```bash
# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# Setup kubeconfig
mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $USER:$USER ~/.kube/config

# Test
kubectl get nodes
```

### Option B: From laptop (remote access)

```bash
# Install kubectl (if not installed)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# Get kubeconfig from lubellion
ssh user@<LUBELLION-IP> "sudo cat /etc/rancher/k3s/k3s.yaml" > ~/.kube/k3s-config

# Replace server IP
sed -i 's/127.0.0.1/<LUBELLION-IP>/g' ~/.kube/k3s-config

# Set as default config
export KUBECONFIG=~/.kube/k3s-config

# Test
kubectl get nodes
```

## Verification

```bash
# Check nodes
kubectl get nodes -o wide

# Check all pods
kubectl get pods -A

# Check traefik (ingress controller)
kubectl -n kube-system get pods -l app.kubernetes.io/name=traefik
kubectl -n kube-system get svc traefik
```

## Useful Commands

```bash
# Service status (on nodes)
sudo systemctl status k3s

# Service logs (on nodes)
sudo journalctl -u k3s -f

# Restart K3s (on nodes)
sudo systemctl restart k3s

# K3s version
k3s --version

# Create etcd snapshot
sudo k3s etcd-snapshot save --name manual-backup-$(date +%Y%m%d)
```

## Firewall Ports

If firewall is active, open these ports on all nodes:
```bash
sudo ufw allow 6443/tcp      # Kubernetes API
sudo ufw allow 10250/tcp     # Kubelet
sudo ufw allow 2379:2380/tcp # etcd
sudo ufw allow 8472/udp      # Flannel VXLAN
sudo ufw allow 80/tcp        # HTTP (Traefik)
sudo ufw allow 443/tcp       # HTTPS (Traefik)
```

Or disable firewall for homelab:
```bash
sudo ufw disable
```

## Troubleshooting

### Nodes not Ready
```bash
kubectl describe node <node-name>
ssh <node> "sudo journalctl -u k3s -n 100"
```

### Check cluster health
```bash
kubectl get nodes
kubectl get pods -A
kubectl cluster-info
```

## Documentation

- Official K3s HA Setup: https://docs.k3s.io/installation/ha-embedded
- K3s Server CLI: https://docs.k3s.io/cli/server
- Backup & Restore: https://docs.k3s.io/datastore/backup-restore

## Cluster Status

- **Type:** High Availability (3 server nodes)
- **etcd:** Embedded (distributed across all 3 nodes)
- **Ingress Controller:** Traefik (default)
- **Storage:** local-path-provisioner (default)
- **Available Resources:** ~13-15 GB RAM, ~150-200 GB Disk
