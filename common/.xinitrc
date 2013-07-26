#!/bin/sh
#
# ~/.xinitrc
#

/usr/bin/xrdb -merge ~/.Xresources
eval $(gpg-agent --daemon)
eval $(ssh-agent)

dbus-launch $HOME/.xstart

# Never give up, never surrender!
while [ true ]; do sleep 1d; done;
