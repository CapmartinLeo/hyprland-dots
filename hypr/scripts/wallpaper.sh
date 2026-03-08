#!/bin/sh

wallpaper="$1"

matugen -t scheme-fidelity image "$wallpaper"

ln -sf ~/.cache/matugen/theme.conf ~/.config/hypr/config/theme.conf
ln -sf ~/.cache/matugen/colors.rasi ~/.config/rofi/themes/colors.rasi
ln -sf ~/.cache/matugen/Colors.qml ~/.config/quickshell/Style/Colors.qml

# notify-send -i "$wallpaper" "colors updated"
