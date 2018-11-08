#!/bin/sh

xrandr --output eDP-1 --primary
# Use 144, 168 or 192
xrandr --dpi 168

# Enable click-to-tap:
xinput set-prop "1A586757:00 06CB:8323 Touchpad" "libinput Tapping Enabled" 1

# Swap alt and super, which are physically swapped:
setxkbmap -option altwin:swap_lalt_lwin

# Increase touchpad sensibility:
xinput set-prop "1A586757:00 06CB:8323 Touchpad" "Coordinate Transformation Matrix" 2 0 0 0 2 0 0 0 1
