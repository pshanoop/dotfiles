#!/bin/sh
#
# ~/.xinitrc
#
# Last reviewed 2015-03-07

if [ -n $DISPLAY ]; then
  xrdb -merge $HOME/.config/Xresources/main
  xrandr --dpi 106
  xset b 20 6 100

  ssh-agent | head -n 2 > ~/.cache/ssh-agent
  . ~/.cache/ssh-agent

  if [ $(hostname) = hyperion.barrera.io ]; then
    numlockx on &
  fi;

  mkdir -p "$HOME/.cache/supervisor"
  dbus-launch supervisord -c "$HOME/.config/supervisor/supervisord.conf"
fi;

# Never give up, never surrender!
while [ true ]; do sleep 1d; done;
