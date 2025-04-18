#!/bin/bash

IMAGE=$(find ~/Pictures/wallpaper -type f \( -iname '*.jpg' -o -iname '*.png' \) | shuf -n 1)

swaybg -i "$IMAGE" -m fill &

convert "$IMAGE" -resize 25% -blur 0x8 -resize 400% ~/.cache/blurry_wallpaper.png
