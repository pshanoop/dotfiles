#!/bin/sh
#
# ~/.xinitrc
#

/usr/bin/start-pulseaudio-x11
/usr/bin/xrdb -merge ~/.Xresources
dbus-launch ssh-agent systemd --user
