#!/bin/bash
# Beep when the keyboard layout is changed
# Linux Mint 21.3
# Dependencies: xkblayout-state

path_to_folder="/home/pi/Misc/SwitchLangBeep/"

# Path to the xkblayout-state tool
xkblayout_state_path="$path_to_folder/xkblayout-state/xkblayout-state"

# Initial layout
layout=$($xkblayout_state_path print "%s")

while true; do
    # Current layout
    new_layout=$($xkblayout_state_path print "%s")

    # If the layout has changed, beep and update the layout variable
    if [ "$layout" != "$new_layout" ]; then
        # echo "Layout changed to $new_layout"
        layout=$new_layout
        aplay "$path_to_folder/switch.wav" 2>/dev/null
    fi

    # Wait for 0.1 second before checking again
    sleep 0.1
done
