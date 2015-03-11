#!/bin/sh
#
# ~/.xinitrc

if [ -n $DISPLAY ]; then
  xrdb -merge $HOME/.config/Xresources/main
  xrandr --dpi 106
  xset b 20 6 100

  if [ $(hostname) = hyperion.barrera.io ]; then
    numlockx on &
  fi;

  mkdir -p "$HOME/.cache/supervisor"
  dbus-launch supervisord -c "$HOME/.config/supervisor/supervisord.conf"
fi;

# Never give up, never surrender!
while [ true ]; do sleep 1d; done;
