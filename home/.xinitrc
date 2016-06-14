#!/bin/sh
#
# ~/.xinitrc

if [ -n $DISPLAY ]; then
  xrdb -merge $HOME/.config/Xresources/main
  xrandr --dpi 106
  xset b 20 6 100

  # Natural scrolling:
  # NOTE: requires GNU grep:
  natural-scrolling || true

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
