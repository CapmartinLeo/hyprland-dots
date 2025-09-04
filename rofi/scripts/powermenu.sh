#!/bin/sh

lock=" Lock"
exit="󰈆 Exit"
reboot="󰑓 Reboot"
shutdown=" Shutdown"
suspend="󰏦 Suspend"

theme="~/.config/rofi/themes/powermenu.rasi"

obtions="$lock\n$exit\n$shutdown\n$reboot\n$suspend"
chosen=$(echo -e "$obtions" | rofi -dmenu -i -p "Power Menu" -theme $theme)

case $chosen in
	$lock)
		hyprlock
		;;
	$exit)
		hyprctl dispatch exit
		;;
	$shutdown)
		systemctl poweroff
		;;
	$reboot)
		systemctl reboot
		;;
	$suspend)
		systemctl suspend
		;;
esac
