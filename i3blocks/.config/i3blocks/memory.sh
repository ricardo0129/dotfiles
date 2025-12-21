#!/usr/bin/env bash

# Read memory in bytes
read -r _ total used free shared buffcache avail <<< \
  $(free -b | awk '/Mem:/ {print $1,$2,$3,$4,$5,$6,$7}')

used_gib=$(awk "BEGIN {printf \"%.2f\", $used/1024/1024/1024}")
total_gib=$(awk "BEGIN {printf \"%.2f\", $total/1024/1024/1024}")
avail_gib=$(awk "BEGIN {printf \"%.2f\", $avail/1024/1024/1024}")

# Main output
echo "$used_gib / $total_gib GiB"

# Degraded state if available < 1 GiB
if (( avail < 1073741824 )); then
    echo
    echo "#ff5555"
fi
