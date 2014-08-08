#!/bin/sh
#
# ~/.xinitrc
#
# Last reviewed 2014-07-23

if [ -n $DISPLAY ]; then
  /usr/bin/xrdb -merge $HOME/.config/Xresources/main
  # TODO: Have homesync sort these into a single location
  LOCAL_RESOURCES=$HOME/.config/Xresources/$(hostname -s)
  if [ -e $LOCAL_RESOURCES ]; then
    /usr/bin/xrdb -merge $LOCAL_RESOURCES
  fi;
  /usr/bin/xrandr --dpi 106
  /usr/bin/xset b 20 6 100

  eval $(gpg-agent --daemon)
  ssh-agent | head -n 2 > ~/.cache/ssh-agent
  . ~/.cache/ssh-agent

  if [ $(hostname) = hyperion.barrera.io ]; then
  	/usr/bin/numlockx on &
  fi;

  dbus-launch usrc startup >> .Xlog 2>&1;
fi;

# Never give up, never surrender!
while [ true ]; do sleep 1d; done;
