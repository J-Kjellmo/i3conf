# I3wm configuration
### Remove packages:
* i3lock

### Packages required:
* terminator
* git
* yay
* feh
* i3lock-color (AUR)
* picom
* lxappearance
* materia-gtk-theme (change in lxappearance)
* papirus-icon-theme (change in lxappearance)
* ttf-font-awesome
* ttf-ubuntu-font-family
* ttf-droid
* zsh
* ripgrep
* flameshot
* oh-my-zsh

## TLDR cmdlets (in order)
```
pacman -Syu
pacman -S --needed-base-devel git
pacman -R i3lock
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
yay -S i3lock-color
pacman -S terminator feh lxappearance picom materia-gtk-theme papirus-icon-theme ttf-font-awesome ttf-ubuntu-font-family ttf-droid zsh ripgrep flameshot
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```


### Recommended packages:
* nerd-fonts
   1. Jetbrains
   2. IBMplex
    
## REMEMBER!
* run this command for each file/script in the "scripts" directory:
   1. sudo chmod +x .config/scripts/<script>
   2. Look in i3blocks.conf file, run command mentioned above for all scripts used
* run this command to change the ownership of the i3status.conf file:
   * sudo chown $USER:$USER ~/.config/i3/i3status/i3status.conf
* open lxappearance and change icons to what is desired
* Change theme in .zshrc, agnoster is favorable

Recommended packages:
    nerd-fonts
        Jetbrains
        IBMplex
