#!/bin/bash
options="Shutdown
Reboot
Lockscreen
Logout"

selection=$(echo "$options" | rofi -dmenu -p "Choose an option:")

case "$selection" in
  "Shutdown") systemctl poweroff ;;
  "Reboot") systemctl reboot ;;
  "Lockscreen") /home/$USER/.config/qtile/lock.sh ;;
  "Logout") qtile cmd-obj -o cmd -f shutdown ;;
esac
