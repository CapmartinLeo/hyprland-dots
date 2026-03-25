#!/bin/sh

wallpaper="$1"

matugen -t scheme-fidelity --source-color-index 0 image "$wallpaper"

ln -sf ~/.cache/matugen/theme.conf ~/.config/hypr/config/theme.conf
ln -sf ~/.cache/matugen/colors.rasi ~/.config/rofi/themes/colors.rasi
ln -sf ~/.cache/matugen/Colors.qml ~/.config/quickshell/Style/Colors.qml
