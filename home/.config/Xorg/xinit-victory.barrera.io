#!/bin/sh

xrandr --output eDP-1 --primary
xrandr --dpi 160

# Enable click-to-tap:
xinput set-prop "1A586757:00 06CB:8323 Touchpad" "libinput Tapping Enabled" 1

# Swap alt and super, which are physically swapped:
setxkbmap -option altwin:swap_alt_win
