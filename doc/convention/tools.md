# Base Tool – Administration – List

## 🧠 Goal
Create a standardized **base tooling list** for a template VM that will serve as the foundation for administration tasks.
This environment should be **fast**, **comfortable**, and easy to maintain.

To achieve this, tools are divided into two categories based on how they are installed and updated:

1. **Base OS Package Manager Tools** – Installed using the system’s native package manager (e.g., `apt`).
   - Stable and reliable.
   - Less frequent updates, ideal for core tools.

2. **Brew-managed Tools** – Installed using [Homebrew](https://brew.sh/) to ensure the latest releases are always available.
   - Useful for rapidly evolving CLI utilities.
   - Easier to keep up-to-date without affecting base OS stability.

---

## 📂 Tool Installation Scripts

Two separate setup scripts handle installation:

- **`apt_tools.sh`**
  - Installs all essential tools that can be managed by the OS package manager (`apt`).
  - Prioritizes stability and compatibility.
  - Ideal for core system administration packages.

- **`brew_tools.sh`**
  - Installs tools that require frequent updates or are not included in OS repositories.
  - Keeps tools on the latest versions without waiting for OS package releases.

---

## ⚙️ Workflow

1. **Provision Base VM** with a clean OS.
2. **Run `apt_tools.sh`** to set up foundational tools.
3. **Run `brew_tools.sh`** to add and update fast-moving utilities.
4. Update scripts periodically to keep the environment fresh and aligned with current needs.

---

## 💡 Benefits of This Approach

- **Predictable base environment** – Core tools remain stable and consistent across machines.
- **Access to latest features** – Cutting-edge utilities are always up to date.
- **Easy maintenance** – Clear separation of concerns between stable and fast-moving packages.
- **Faster rebuilds** – Quickly replicate the same working environment on new VMs.

Base Systemtools
===============

Must have:
----------------------------------------------
* tmux
* vim
* curl
* htop
* unzip/zip
* ncdu
* tree
* openssh-client
* net-tools
* lsb-release/neofetch
* dnsutils
* git
* rsync
* nmap/tcpdump
* iptables/ufw
* iftop
* lsof
* mtr
* kubectl
* helm

For Comfort:
----------------------------------------------
* Full Shell setup (starship + zshell)
* brew
* fzf
* neovim
* lazygit
* lazydocker
* k9s
