#!/bin/bash
#
ip=$(ipconfig getifaddr en0)
wifi=$(networksetup -getairportnetwork en0 | awk -F': ' '{print $2}')
echo "$ip $wifi"

