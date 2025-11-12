#! /usr/bin/bash

selected=$(echo -e "poweroff\nreboot\nsuspend\nlogout" | wofi --show dmenu --prompt="Power Menu" --height=220)

if [ -z "$selected" ]; then
    echo "empty command"
elif [ $selected == "poweroff" ]; then
    poweroff
    echo "poweroff"
elif [ $selected == "reboot" ]; then
   reboot
   echo "reboot"
elif [ $selected == "suspend" ]; then
   suspend
   echo "suspend"
elif [ $selected == "logout" ]; then
   hyprctl dispatch exit
   echo "logout"
else
    echo "'$selected' is unknown command."
fi



