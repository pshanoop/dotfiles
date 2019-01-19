#!/bin/sh

if [ -f /etc/X11/xorg.conf.d/90-egpu.conf ]; then
  # If using the eGPU, the display is DP-0.
  xrandr --output DP-0 --primary
else
  # Otherwise, it's the builtin display.
  xrandr --output eDP-1 --primary --mode 1920x1080
fi
# Use 144, 168 or 192
xrandr --dpi 144

# Enable click-to-tap:
xinput set-prop "1A586757:00 06CB:8323 Touchpad" "libinput Tapping Enabled" 1

# Increase touchpad sensibility:
xinput set-prop "1A586757:00 06CB:8323 Touchpad" "Coordinate Transformation Matrix" 2 0 0 0 2 0 0 0 1
