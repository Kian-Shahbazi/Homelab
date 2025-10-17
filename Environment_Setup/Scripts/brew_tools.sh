#!/bin/bash

set -e

echo "🔍 Checking for Homebrew..."

# Check if brew is already installed
if ! command -v brew &> /dev/null; then
    echo "🍺 Homebrew not found. Installing Homebrew for Linux..."

    # Install dependencies for Homebrew
    sudo apt update
    sudo apt install -y build-essential procps curl file git

    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for current and future sessions
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
    echo "✅ Homebrew is already installed."
fi

# Ensure brew is available in the current session
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Tools to install via brew
BREW_PACKAGES=(
    tmux
    neovim
    git
    rsync
    fzf
    neofetch
    lazygit
    lazydocker
    starship
    k9s
)

echo "📦 Installing Brew packages: ${BREW_PACKAGES[*]}"
brew install "${BREW_PACKAGES[@]}"

echo "🎉 All Brew tools installed successfully."
