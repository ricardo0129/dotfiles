#!/usr/bin/env bash

vol=$(amixer get Master | awk -F'[][]' 'END{print $2}')
mute=$(amixer get Master | awk -F'[][]' 'END{print $4}')

if [[ "$mute" == "off" ]]; then
    echo "$vol"
else
    echo "$vol"
fi

