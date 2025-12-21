#!/usr/bin/env bash

# Get wireless interface (first wlan interface found)
IFACE=$(iw dev | awk '$1=="Interface"{print $2; exit}')

if [[ -z "$IFACE" ]]; then
    echo "No WiFi interface"
    exit 1
fi

# Get SSID
SSID=$(iw dev "$IFACE" link | awk -F': ' '/SSID/{print $2}')

# Get IP address
IP=$(hostname -I | awk '{print $1}')

echo "$SSID $IP"
