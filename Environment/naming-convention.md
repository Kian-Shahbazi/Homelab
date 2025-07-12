# Naming Convention – Homelab Cluster (Proxmox)

## 🧠 Ziel

Einheitliches, gut strukturiertes Benennungsschema für alle virtuellen Maschinen, Container und Templates im Homelab-Cluster, basierend auf Standort, Rolle und Ressourcentyp.

## 📚 Aufbau der Konvention

<standort><cluster><os><resourcentyp>-<rolle>-<nummer>

### Komponenten im Detail

| Kürzel        | Bedeutung                     | Beispielwert     |
|---------------|-------------------------------|------------------|
| `d`           | Standort (*despia*)           | `d`              |
| `hlc`         | Cluster-Typ (*HomeLabCluster*)| `hlc`            |
| `l` / `w`     | Betriebssystem                | `l` oder `w`     |
| `vm` / `lxc` / `template` | Ressourcentyp     | `vm`, `lxc`, `template` |
| `ctrl`, `dock`, `proxy`, `smarthome`, … | Rollenbezeichnung  | frei wählbar     |
| `1`           | Laufende Nummer (nicht `001`) | `1`, `2`, …       |

---

## 🔤 Beispiele

| Name                     | Zweck                                  |
|--------------------------|----------------------------------------|
| `dhlcl-template-os-base` | Ausgangspunkt für Ubuntu-VMs           |
| `dhlcl-vm-ctrl-1`        | Controller-VM (Ansible, Monitoring)    |
| `dhlcl-vm-dock-1`        | Docker-Host                            |
| `dhlcl-vm-proxy-1`       | Reverse-Proxy (z. B. Traefik/Nginx)    |
| `dhlcl-vm-smarthome-1`   | Home-Automation-System (z. B. HAOS)    |
| `dhlcl-lxc-dhcp-1`       | DHCP-Server als LXC                    |

---

## ✅ Best Practices

- Nummerierung **fortlaufend nach Rolle**, nicht nach Gesamtanzahl.
- Templates eindeutig kennzeichnen mit `template`.
- Bei kritischen Rollen wie Controller (z. B. Ansible-Master) klar benennen (`ctrl`).
- Optionale Erweiterung durch Standortpräfix bei mehreren Standorten (z. B. `b` für *berlin*, `f` für *frankfurt*).
