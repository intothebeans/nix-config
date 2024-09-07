#!/usr/bin/env sh
$(swww kill && swww init) || swww init
IMG_NAME=$(ls /home/beans/Pictures/wallpaper/ | shuf -n 1)
IMG_PATH_FULL=$HOME"/Pictures/wallpaper/"$IMG_NAME
/home/beans/.config/hypr/scripts/set_background.sh "$IMG_PATH_FULL"
/home/beans/.config/hypr/scripts/wall_schedule.sh &
