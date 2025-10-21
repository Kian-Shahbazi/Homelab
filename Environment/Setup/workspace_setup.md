Setup work environment
===============
This will be a guide to setting up the desired work environment.

Note
===============
For installing the tools, use these scripts → **[apt_tools.sh](./Environment/Automation/Scripts/apt_tools.sh)** or **[brew_tools.sh](./Environment/Automation/Scripts/brew_tools.sh)**.

Possible Prefix Installations
===============
1. Kubectl -> [dotfiles/Setup.mdKubectl Installation](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

Install ZShell
===============
1. Install Zsh
```bash
sudo apt update && sudo apt install zsh -y
```
2. Verify version
```bash
zsh --version
```
3. Set Zsh as Default Shell
```bash
chsh -s $(which zsh)
```
4. Install Oh My Zsh and Plugins
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
5. Insert the finished zshell file to ~/home/$USER
[.zshrc](https://github.com/Kian-Shahbazi/Scripts/blob/main/dotfiles/tmux_setup/tmux.conf)

Install starship
===============
1. Install Starship
```bash
brew install starship
```
2. Copy the [starship.toml](https://github.com/Kian-Shahbazi/Scripts/blob/main/dotfiles/starship_setup/starship.toml)
and place it into  	`~/.config/starship/starship.toml`

3. Install Nerd-Fonts if necessary -> [Nerd-Fond](https://www.nerdfonts.com/#home)

Install tmux
===============
Note: For the theme to work a minimal tmux version of tmux 3.4 is required!
---
1. Install tmux
```bash
brew install tmux
```
2. Create folders and config file
```bash
mkdir ~/.config/tmux
touch .tmux.conf
```
3. Now create a Symlink for the config script
```bash
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
```
4. Install tmux plugin tpm
```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```
5. Follow installation guide for [catppucin](https://github.com/catppuccin/tmux?tab=readme-ov-file)

6. After the config Script is finished you can Install it.
```bash
präfix + I to Install or tmux source-file ~/.config/tmux/tmux.conf
```
Install lazyvim
===============
1. Install Neovim
```bash
brew install neovim
```
2. add lazyvim git repo
```bash
git clone git@github.com:Kian-Shahbazi/lazyvim.git ~/.config/nvim
```
3. Launch it!
```bash
nvim
```
4. Ensure LazyGit
```bash
mkdir -p ~/.config/lazygit
touch ~/.config/lazygit/config.yml
```
Other doings
===============
1. Only one time - Create ssh-key and lock root-user login access
```bash
ssh-keygen -t ed25519 -C "dhlcl-master-key" -f ~/.ssh/dhlcl_master_key
#In /etc/ssh/sshd_config
PermitRootLogin no
DenyUsers root
```
2. On every new vm you created - Generate new host keys and enable ssh service
```bash
sudo ssh-keygen -A
sudo systemctl start ssh.service
sudo systemctl enable ssh.service
```
3. On every new vm you created - Set a new hostname for the vm
```bash
sudo hostnamectl set-hostname new-name
#Also change /etc/hosts to the new name
debian.local = FQDN
debian = shortname
```
4. Connect host to the ansible host - Ansible infrastrucutre
```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub user@ip
```
