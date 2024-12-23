#!/bin/bash

MAX_LENGTH=20

player_status=$(playerctl status 2>/dev/null)

truncate() {
    local input="$1"
    local max_length="$2"
    if [ "${#input}" -gt "$max_length" ]; then
        echo "${input:0:max_length}..."
    else
        echo "$input"
    fi
}

if [ "$player_status" == "Playing" ]; then
    icon="󰏤"
elif [ "$player_status" == "Paused" ]; then
    icon=""
else
    icon="  󰎊  "
    echo "$icon"
    exit 0
fi

artist=$(truncate "$(playerctl metadata artist 2>/dev/null)" "$MAX_LENGTH")
title=$(truncate "$(playerctl metadata title 2>/dev/null)" "$MAX_LENGTH")

echo "$icon   $artist - $title"
