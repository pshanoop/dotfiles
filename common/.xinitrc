#!/bin/sh
#
# ~/.xinitrc
#
# Last reviewed 2014-07-23

if [ -n $DISPLAY ]; then
  xrdb -merge $HOME/.config/Xresources/main
  xrandr --dpi 106
  xset b 20 6 100

  eval $(gpg-agent --daemon)
  ssh-agent | head -n 2 > ~/.cache/ssh-agent
  . ~/.cache/ssh-agent

  if [ $(hostname) = hyperion.barrera.io ]; then
    numlockx on &
  fi;

  dbus-launch usrc startup >> .Xlog 2>&1;
fi;

# Never give up, never surrender!
while [ true ]; do sleep 1d; done;
