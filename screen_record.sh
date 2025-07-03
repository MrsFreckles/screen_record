#!/bin/env bash
if pgrep -x "wf-recorder" > /dev/null; then
    pkill -INT -x wf-recorder
    notify-send -h string:wf-recorder:record -t 1000 "Finished Recording"
    exit 0
fi

output_lines=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')
selected_output=$(echo "$output_lines" | wofi --dmenu --prompt="Pick Monitor")

[ -z "$selected_output" ] && notify-send "Recording Cancelled" && exit 1

notify-send -h string:wf-recorder:record -t 1000 "Recording Started"
dateTime=$(date +%m-%d-%Y-%H:%M:%S)
wf-recorder --output "$selected_output" --bframes max_b_frames -f "$HOME/Videos/Recordings/$dateTime.mp4"
