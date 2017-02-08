#!/bin/sh
alias supervisorctl='/usr/bin/supervisorctl -c /home/hugo/.config/supervisor/supervisord.conf'

# The kernel driver ignores this setting if present in Xorg.conf:
xrandr --output eDP1 --primary
xrandr --output eDP1 --dpi 160
echo Xft.dpi: 160 | xrdb -merge  # Actual MBP dpi is 221

# < and ª and swapped for some inexplicable reason
xmodmap athena.xmodmap
