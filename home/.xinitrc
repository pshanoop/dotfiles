#!/bin/sh
#
# ~/.xinitrc

if [ -n $DISPLAY ]; then
  xrdb -merge $HOME/.config/Xresources/main
  xrandr --dpi 106
  xset b 20 6 100

  # Natural scrolling:
  # NOTE: requires GNU grep:
  PERFORMANCE_MX=$(xinput | grep -Po 'Performance MX\s+id=\K(\d+)')
  if [ $? = 0 ]; then
    xinput set-button-map $PERFORMANCE_MX 1 2 3 5 4 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
  fi;

  if [ $(hostname) = hyperion.barrera.io ]; then
    numlockx on &
  fi;

  mkdir -p "$HOME/.cache/supervisor"
  dbus-launch supervisord -c "$HOME/.config/supervisor/supervisord.conf"

  # Run a per-host script for varying configurations.
  HOST_INIT=$HOME/.config/Xorg/xinit-$(hostname)
  if [ -x $HOST_INIT ]; then
    $HOST_INIT
  fi;
fi;

# Never give up, never surrender!
while [ true ]; do sleep 1d; done;
