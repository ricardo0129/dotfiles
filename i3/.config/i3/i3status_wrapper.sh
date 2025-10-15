#!/bin/bash

# Start i3status and pipe its output
i3status | while read line; do
    # Add your custom text here. Example:
    bat=$(cat /sys/class/power_supply/macsmc-battery/capacity)
    echo "bat $bat% | $line" || exit 1
done
