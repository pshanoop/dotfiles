#!/bin/sh
#
# ~/.xinitrc
#

if [ -e $HOME/.Xresources ]; then
  /usr/bin/xrdb -merge $HOME/.Xresources
fi;

eval $(gpg-agent --daemon)
ssh-agent | head -n 2 > ~/.cache/ssh-agent
. ~/.cache/ssh-agent

if [ $(hostname) = hyperion.ubertech.com.ar ]; then
	/usr/bin/numlockx on &
fi;

dbus-launch usrc startup >> .Xlog 2>&1

# Never give up, never surrender!
while [ true ]; do sleep 1d; done;
