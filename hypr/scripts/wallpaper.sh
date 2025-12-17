#!/bin/sh

wallpaper="$1"

hyprpanel sw "$wallpaper" 
code="$?"

while [ "$code" -ne 0 ]; do
	sleep 0.5
	hyprpanel sw "$wallpaper" 2> /tmp/hyprpanel.log
	code="$?"
done

ln -sf ~/.cache/matugen/theme.conf ~/.config/hypr/config/theme.conf
ln -sf ~/.cache/matugen/colors.rasi ~/.config/rofi/themes/colors.rasi
ln -sf ~/.cache/matugen/Colors.qml ~/.config/quickshell/Style/Colors.qml

notify-send -i "$wallpaper" "colors updated" 
