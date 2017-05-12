#!/bin/sh

xrdb -merge $HOME/.config/Xorg/main.Xresources
xset b 20 6 100

# Run a per-host script for varying configurations.
HOST_INIT=$HOME/.config/Xorg/xinit-$(hostname)
if [ -x $HOST_INIT ]; then
  $HOST_INIT
fi;

# Per host Xresources (like dpi, etc)
HOST_XRESOURCES=$HOME/.config/Xorg/$(hostname).Xresources
if [ -f $HOST_XRESOURCES ]; then
  xrdb -merge $HOST_XRESOURCES
fi;
