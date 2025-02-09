#!/bin/bash
options="Shutdown
Reboot
Logout"

selection=$(echo "$options" | rofi -dmenu -p "Choose an option:")

case "$selection" in
  "Shutdown") systemctl poweroff ;;
  "Reboot") systemctl reboot ;;
  "Logout") qtile cmd-obj -o cmd -f shutdown ;;
esac
