#!/bin/bash

choice=$(cat ~/.config/tofi/powermenu | tofi)

case "$choice" in
  *Reboot*)
    systemctl reboot
    ;;
  *Lock*)
    swaylock -f -e -i ~/.cache/blurry_wallpaper.png
    ;;
  *Power\ Off*)
    systemctl poweroff
    ;;
  *Suspend*)
    systemctl suspend
    ;;
  *)
    exit 0
    ;;
esac

