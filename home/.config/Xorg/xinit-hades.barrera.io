#!/bin/sh

xrandr --output Virtual1 --primary
xrandr --output Virtual1 --dpi 160

# Configure the keyboard layout.
setxkbmap -layout us -variant intl

vmware-user-suid-wrapper
