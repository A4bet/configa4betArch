archinstall script (just run "archinstall" after booted into the iso), must use "xorg server" profile and set youur graphics drivers, audio pipewire, grub bootloader

![image](https://github.com/user-attachments/assets/2c4dcf7d-d46f-4636-ae86-7d4a615648be)

![image](https://github.com/user-attachments/assets/05cee7c0-f033-422b-83bb-2c6278bdc36c)

![image](https://github.com/user-attachments/assets/03194683-36a2-4504-af99-433c343f6bc0)
![image](https://github.com/user-attachments/assets/5c07b659-7b85-48e1-90b5-0b3fc1e13b81)
![image](https://github.com/user-attachments/assets/8931ad11-479e-48a0-ab2c-fdd6ea44f6b6)
![image](https://github.com/user-attachments/assets/98a3f32c-2bc4-4c56-9b59-ab1235cd360c)


COMMAND:
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf && sudo pacman -Syu && sudo pacman -S qtile lxappearance nitrogen thunar firefox vim nvim neofetch fastfetch alacritty picom ufw archlinux-wallpaper lightdm lightdm-webkit2-greeter alsa-utils keepassxc intel-ucode flatpak git pacman-contrib xbindkeys flameshot ttf-jetbrains-mono-nerd rofi polybar imagemagick xorg-xdpyinfo xautolock && sudo systemctl enable ufw && sudo sed -i 's/^greeter-session=.*/greeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf && sudo sed -i 's/^GRUB_TIMEOUT_STYLE=menu/GRUB_TIMEOUT_STYLE=hidden/' /etc/default/grub && sudo grub-mkconfig -o /boot/grub/cfg && git clone https://aur.archlinux.org/yay.git && cd yay/ && makepkg -si && cd .. && yay -S i3lock-color && sudo systemctl enable paccache.timer && sudo systemctl enable lightdm.service && cd ~/.config && rm -rf ~/.config/qtile && git clone https://github.com/A4bet/dotfiles.git && sudo mv dotfiles/* ~/.config && mv xbindkeysrc ~/.xbindkeysrc && sudo rm -rf /etc/xdg/picom.conf && sudo mv picom.conf /etc/xdg/picom.conf && git clone https://github.com/NvChad/starter ~/.config/nvim && sudo rm -rf dotfiles && sudo rm -rf README.md && reboot

listed:
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

sudo pacman -Syu

sudo pacman -S qtile lxappearance nitrogen thunar firefox vim neofetch fastfetch alacritty picom ufw archlinux-wallpaper lightdm lightdm-webkit2-greeter alsa-utils keepassxc intel-ucode flatpak git pacman-contrib xbindkeys flameshot ttf-jetbrains-mono-nerd rofi polybar imagemagick xorg-xdpyinfo xautolock

sudo systemctl enable ufw

sudo sed -i 's/^#greeter-session=.*/greeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf

sudo sed -i 's/^GRUB_TIMEOUT_STYLE=menu/GRUB_TIMEOUT_STYLE=hidden/' /etc/default/grub

sudo grub-mkconfig -o /boot/grub/cfg

git clone https://aur.archlinux.org/yay.git

cd yay/

makepkg -si

cd ..

yay -S i3lock-color

sudo systemctl enable paccache.timer

sudo systemctl enable lightdm.service

cd ~/.config

rm -rf ~/.config/qtile

git clone https://github.com/A4bet/dotfiles.git

sudo mv dotfiles/* ~/.config

mv xbindkeysrc ~/.xbindkeysrc

sudo rm -rf /etc/xdg/picom.conf

sudo mv picom.conf /etc/xdg/picom.conf

git clone https://github.com/NvChad/starter ~/.config/nvim

sudo rm -rf dotfiles

sudo rm -rf README.md

reboot

--

you may need to chmod the shell/bash scripts (ie. chmod +x script.sh)

I recommend installing pamixer & playerctl if you're using xbindkeys since my config has them, and I also recommend XClip or XSel to make the clipboard with vim & neovim work with other programs. 

add "transparency = true," to .config/nvim/lua/chadrc.lua in the M.base46 section to make neovim transparent(under the theme to make sure it overrides the theme if theres a conflict).

--

Tap(on the trackpad) to click for laptop ( /etc/X11/xorg.conf.d/40-libinput.conf ):
```
Section "InputClass"
    Identifier "libinput touchpad"
    MatchIsTouchpad "on"
    Driver "libinput"
    Option "Tapping" "on"
    Option "ClickMethod" "clickfinger"
    Option "NaturalScrolling" "on"
EndSection
```
```
sudo systemctl restart display-manager
```
---

to enable goimports-reviser and gofumpt in nvchad 
install the plugins witth mason (`:MasonInstall NAME` in neovim), then `go install mvdan.cc/gofumpt@latest` `go install github.com/incu6us/goimports-reviser@latest`
add
(conform.lua)
```
local options = {
  formatters = {
    gofumpt = {
      command = vim.fn.expand("$HOME/go/bin/gofumpt"),     -- Adjust if needed
    },
    goimports_reviser = {
      command = vim.fn.expand("$HOME/go/bin/goimports-reviser"),   -- Adjust if needed
      args = { "-rm-unused", "-set-alias", "-format" }
    },
  },
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports-reviser", "gofumpt" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    --  These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
```
and (options.lua)
```
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("conform").format({async = false})
  end,
})
```

---
!! DISCLAIMER !!
PEOPLE WITH ONE OR 3 OR MORE MONITORS: vim into ~/.config/qtile/config.py remove the 2nd "screen ( .. )" (in the "screens = [ ... ]" varible) and make sure the first one has a "," after it if you dont have a 2nd monitor, if you have more than 3 monitors copy and paste the 2nd "screen(..)" because its configured to not be pimary

if you have only one monitor delete the line under the autostart() func that includes nitrogen "--head=1", or if you have more than 3 or more monitors copy and paste that line (--head=0 is monitor 1, --head=1 is monitor 2, etc)  


--------------------------------
note to myself: Yay installs Golang
