#!/bin/sh
#
# ~/.xinitrc
#

/usr/bin/start-pulseaudio-x11
/usr/bin/xrdb -merge ~/.Xresources
eval $(gpg-agent --daemon)
eval $(ssh-agent)
dbus-launch /usr/lib/systemd/systemd --user
