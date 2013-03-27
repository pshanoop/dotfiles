#!/bin/sh
#
# ~/.xinitrc
#

/usr/bin/xrdb -merge ~/.Xresources
dbus-launch ssh-agent systemd --user
