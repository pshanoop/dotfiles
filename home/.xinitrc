#!/bin/sh
#
# ~/.xinitrc

if [ -n $DISPLAY ]; then
  xrdb -merge $HOME/.config/Xorg/main.Xresources
  xset b 20 6 100

  natural-scrolling

  mkdir -p "$HOME/.cache/supervisor"
  dbus-launch supervisord -c "$HOME/.config/supervisor/supervisord.conf"

  # Run a per-host script for varying configurations.
  HOST_INIT=$HOME/.config/Xorg/xinit-$(hostname)
  if [ -x $HOST_INIT ]; then
    $HOST_INIT
  fi;

  HOST_XRESOURCES=$HOME/.config/Xorg/$(hostname).Xresources
  if [ -f $HOST_XRESOURCES ]; then
    xrdb -merge $HOST_XRESOURCES
  fi;
fi;

# Never give up, never surrender!
while [ true ]; do sleep 1d; done;
