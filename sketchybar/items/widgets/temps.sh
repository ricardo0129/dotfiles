#!/bin/bash

# Example command that gets the temperature in Celsius
# Replace this with your actual command
cpu_temp=$(/Users/ricky/.config/sketchybar/helpers/smctemp/smctemp -c)
gpu_temp=$(/Users/ricky/.config/sketchybar/helpers/smctemp/smctemp -g)

to_F() {
  local celsius=$1
  # Convert Celsius to Fahrenheit using bc
  local fahrenheit=$(echo "scale=2; ($celsius * 9/5) + 32" | bc)
  echo $fahrenheit
}

cpu_temp=$(to_F $cpu_temp)
gpu_temp=$(to_F $gpu_temp)
echo "$cpu_temp $gpu_temp"
