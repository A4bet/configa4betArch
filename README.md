archinstall script, must use "xorg server" profile and set youur graphics drivers, audio pipewire, grub bootloader

COMMAND:
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf && sudo pacman -Syu && sudo pacman -S qtile lxappearance nitrogen thunar firefox vim neofetch fastfetch alacritty picom ufw archlinux-wallpaper lightdm lightdm-gtk-greeter alsa-utils keepassxc intel-ucode flatpak git pacman-contrib xbindkeys && sudo systemctl enable ufw && sudo sed -i 's/^GRUB_TIMEOUT_STYLE=menu/GRUB_TIMEOUT_STYLE=hidden/' /etc/default/grub && sudo grub-mkconfig -o /boot/grub/cfg && git clone https://aur.archlinux.org/yay.git && cd yay/ && makepkg -si && cd .. && sudo systemctl enable paccache.timer && sudo systemctl enable lightdm.service && cd ~/.config && rm -rf ~/.config/qtile && git clone https://github.com/A4bet/configa4betArch.git && sudo mv configa4betArch/* ~/.config && mv .xbindkeysrc ~ && sudo rm -rf /etc/xdg/picom.conf && sudo mv picom.conf /etc/xdg/picom.conf && sudo rm -rf configa4betArch && reboot


Yay installs Golang (self note)
