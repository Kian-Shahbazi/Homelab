Setup work environment
===============
This will be a guide to setting up the desired work environment.

Note
===============
For installing the tools, use these scripts → **[apt_tools.sh](/environment/automation/scripts/apt_tools.sh)** or **[brew_tools.sh](/environment/automation/scripts/brew_tools.sh)**.

Tool Install
===============
1. Use install scripts
```bash
chmod +x apt_tools.sh brew_tools.sh
```
2. Install brew tools
```bash
./brew_tools.sh
```
3. Install apt tools
```bash
./apt_tools.sh
```

Setup zsh
===============
1. Verify version
```bash
zsh --version
which zsh
```
2. Set Zsh as Default Shell
```bash
chsh -s $(which zsh)
```
3. Install Oh My Zsh and Plugins
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
4. Copy the finished [zshrc](/environment/dotfiles/zshell/zshrc) file to ~/home/$USER
```bash
cp /environment/dotfiles/zshrc ~/.zshrc
```

Setup starship
===============
1. Copy the [starship.toml](/environment/dotfiles/starship.toml)
and place it into  	`~/.config/starship/starship.toml`
```bash
mkdir -p ~/.config/starship
cp /environment/dotfiles/starship/starship.toml ~/.config/starship/starship.toml
```
2. Install Nerd-Fonts -> [Nerd-Font](https://www.nerdfonts.com/#home)
```bash
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh JetBrainsMono
```

Setup tmux
===============
Note: For the theme to work a minimal tmux version of tmux 3.4 is required!
---

1. Check version
```bash
tmux -V
```
2. Create config file
Copy the [tmux.conf](/environment/dotfiles/tmux.conf)
and place it into  	`~/.config/tmux/tmux.conf`
```bash
mkdir -p ~/.config/tmux
cp /environment/dotfiles/tmux.conf ~/.config/tmux/tmux.conf
```
2. Now create a Symlink for the config script
```bash
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
```
3. Install tmux plugin tpm
```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```
4. Follow installation guide for [catppucin](https://github.com/catppuccin/tmux?tab=readme-ov-file)
```bash
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```
5. Add this line to the end of your ~/.config/tmux/tmux.conf
```bash
run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux
```
6. After the config Script is finished you can Install it.
```bash
prefix + I to Install or tmux source-file ~/.config/tmux/tmux.conf
```

Setup lazyvim
===============
1. add lazyvim git repo
```bash
git clone git@github.com:Kian-Shahbazi/nvim.git ~/.config/nvim
```
2. Launch it!
```bash
nvim
```
3. Ensure LazyGit
```bash
mkdir -p ~/.config/lazygit
touch ~/.config/lazygit/config.yml
```
