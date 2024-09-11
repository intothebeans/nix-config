#!/usr/bin/env sh
cliphist list | rofi -dmenu -theme $HOME/.config/rofi/style-clipboard.rasi | cliphist decode | wl-copy
