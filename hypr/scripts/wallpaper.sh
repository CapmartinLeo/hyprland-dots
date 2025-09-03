#!/bin/sh

wallpaper="$1"

hyprpanel sw "$wallpaper" 
code="$?"

while [ "$code" -ne 0 ]; do
	sleep 0.5
	hyprpanel sw "$wallpaper" 2> /tmp/hyprpanel.log
	code="$?"
done

ln -sf ~/.cache/matugen/colors.rasi ~/.config/rofi/themes/colors.rasi

notify-send -i "$wallpaper" "colors updated" 
