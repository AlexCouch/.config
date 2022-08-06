#!/bin/sh

options=()
#options+='%{F#ab1313}%{F-} Power Off'
options+=(" Power Off")
options+=(" Sleep")
#options+='%{F#d19e30}#{F-} Sleep'
options+=(" Reboot")

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -config $HOME/.config/rofi/power_menu_config.rasi -p "Power Options")
if [ -n "$(echo $choice | grep "Power Off")" ]; then
	shutdown now
elif [ -n "$(echo $choice | grep "Sleep")" ]; then
	systemctl suspend
elif [ -n "$(echo $choice | grep "Reboot")" ]; then
	reboot	
fi
