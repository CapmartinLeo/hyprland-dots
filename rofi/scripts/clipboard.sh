#!/bin/sh

theme="$HOME/.config/rofi/themes/launcher.rasi"


cliphist list | ONLY_LIST="true" rofi -dmenu -theme "$theme" | cliphist decode | wl-copy

