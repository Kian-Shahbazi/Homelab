#!/bin/bash

set -e

echo "🔧 Updating APT and installing base system tools..."

# Update and upgrade
sudo apt update && sudo apt upgrade -y

# Tools to install via apt
APT_PACKAGES=(
    curl
    htop
    zip
    unzip
    ncdu
    tree
    openssh-client
    net-tools
    dnsutils
    iptables
    ufw
    iftop
    lsof
    mtr
    vim
    zsh
)

# Install all packages
echo "📦 Installing packages: ${APT_PACKAGES[*]}"
sudo apt install -y "${APT_PACKAGES[@]}"

echo "✅ APT tools installed successfully."
