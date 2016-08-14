#!/bin/sh
alias supervisorctl='/usr/bin/supervisorctl -c /home/hugo/.config/supervisor/supervisord.conf'

# The kernel driver ignores this setting if present in Xorg.conf:
xrandr --output eDP1 --primary
