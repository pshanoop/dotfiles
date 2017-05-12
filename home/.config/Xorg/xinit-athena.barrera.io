#!/bin/sh

# The kernel driver ignores this setting if present in Xorg.conf:
xrandr --output eDP1 --primary
xrandr --output eDP1 --dpi 160

xmodmap $(dirname $0)/athena.xmodmap
