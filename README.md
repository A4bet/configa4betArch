archinstall script (just run "archinstall" after booted into the iso), must use "xorg server" profile and set youur graphics drivers, audio pipewire, grub bootloader

COMMAND:
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf && sudo pacman -Syu && sudo pacman -S qtile lxappearance nitrogen thunar firefox vim neofetch fastfetch alacritty picom ufw archlinux-wallpaper lightdm lightdm-gtk-greeter alsa-utils keepassxc intel-ucode flatpak git pacman-contrib xbindkeys && sudo systemctl enable ufw && sudo sed -i 's/^GRUB_TIMEOUT_STYLE=menu/GRUB_TIMEOUT_STYLE=hidden/' /etc/default/grub && sudo grub-mkconfig -o /boot/grub/cfg && git clone https://aur.archlinux.org/yay.git && cd yay/ && makepkg -si && cd .. && sudo systemctl enable paccache.timer && sudo systemctl enable lightdm.service && cd ~/.config && rm -rf ~/.config/qtile && git clone https://github.com/A4bet/configa4betArch.git && sudo mv configa4betArch/* ~/.config && mv xbindkeysrc ~/.xbindkeysrc && sudo rm -rf /etc/xdg/picom.conf && sudo mv picom.conf /etc/xdg/picom.conf && sudo rm -rf configa4betArch && reboot


!! DISCLAIMER !!
PEOPLE WITH ONE OR 3 OR MORE MONITORS: vim into ~/.config/qtile/config.py remove the 2nd "screen ( .. )" (in the "screens = [ ... ]" varible) and make sure the first one has a "," after it if you dont have a 2nd monitor, if you have more than 3 monitors copy and paste the 2nd "screen(..)" because its configured to not be pimary

if you have only one monitor delete the line under the autostart() func that includes nitrogen "--head=1", or if you have more than 3 or more monitors copy and paste that line (--head=0 is monitor 1, --head=1 is monitor 2, etc)  


--------------------------------
note to myself: Yay installs Golang
