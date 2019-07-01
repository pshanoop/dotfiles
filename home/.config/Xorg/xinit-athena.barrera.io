#!/bin/sh

# Use 144, 168 or 192
xrandr --dpi 144

# Enable click-to-tap:
xinput set-prop "DELL08AF:00 06CB:76AF Touchpad" "libinput Tapping Enabled" 1

# Increase touchpad sensibility:
xinput set-prop "DELL08AF:00 06CB:76AF Touchpad" "Coordinate Transformation Matrix" 2 0 0 0 2 0 0 0 1
