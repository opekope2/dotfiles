#!/bin/bash
case $(echo -e "Lock Session\nShut down\nReboot\nExit Hyprland" | rofi -dmenu) in
"Lock Session")
    $HYPRLAND_SCRIPTS/lock.sh
    ;;
"Shut down")
    systemctl poweroff
    ;;
"Reboot")
    systemctl reboot
    ;;
"Exit Hyprland")
    hyprctl dispatch exit
    ;;
esac
