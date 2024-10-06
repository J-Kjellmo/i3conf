Remove packages:
    i3lock

Packages requirement:
    git
    yay
    feh
    i3lock-color (AUR)
    lxappearance
    materia-gtk-theme (change in lxappearance)
    papirus-icon-theme (change in lxappearance)
    ttf-font-awesome
    ttf-ubuntu-font-family
    ttf-droid
    zsh
    oh-my-zsh

TLDR cmdlets (in order)
    pacman -Syu
    pacman -S --needed-base-devel git
    pacman -R i3lock
    git clone https://aur.archlinux.org/yay.git
        cd yay
            makepkg -si
    yay -S i3lock-color
    pacman -S feh lxappearance materia-gtk-theme papirus-icon-theme ttf-font-awesome ttf-ubuntu-font-family ttf-droid zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    source ~/.config/i3/.zshrc

REMEMBER!
    run this command for each file/script in the "scripts" directory:
        sudo chmod +x .config/scripts/<script>
    run this command to change the ownership of the i3status.conf file:
        sudo chown $USER:$USER ~/.config/i3/i3status/i3status.conf
    Source .zshrc in i3 config.
    open lxappearance and change icons to what is desired
