#!/bin/sh
#
# ~/.xinitrc
#

ck-launch-session dbus-launch ssh-agent systemd --user
