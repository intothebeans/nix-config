#!/usr/bin/env bash
FOLDER_PATH="/home/beans/Pictures/wallpaper/"
LIST=($(ls $FOLDER_PATH | shuf))
for image in "${LIST[@]}"; do
    sleep 1h
    set_background.sh "$FOLDER_PATH/$image"
done
