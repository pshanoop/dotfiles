#!/bin/sh
#
# ~/.xinitrc
#

/usr/bin/xrdb -merge ~/.Xresources
eval $(gpg-agent --daemon)
eval $(ssh-agent)

if [ $(hostname) = hyperion.ubertech.com.ar ]; then
	/usr/bin/numlockx on &
fi;

dbus-launch usrc startup

# Never give up, never surrender!
while [ true ]; do sleep 1d; done;
