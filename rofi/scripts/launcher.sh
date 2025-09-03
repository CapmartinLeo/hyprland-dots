#!/bin/sh

theme_dir="$HOME/.config/rofi/themes"


pkill rofi || rofi -show drun \
	-theme "$theme_dir/launcher.rasi"
