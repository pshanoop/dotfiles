#!/bin/sh
alias supervisorctl='/usr/bin/supervisorctl -c /home/hugo/.config/supervisor/supervisord.conf'

# The kernel driver ignores this setting if present in Xorg.conf:
xrandr --output eDP1 --primary
xrandr --output eDP1 --dpi 160
xrdb -merge $HOME/.config/Xorg/athena.barrera.io.Xresources

xmodmap $(dirname $0)/athena.xmodmap
