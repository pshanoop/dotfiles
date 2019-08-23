#!/bin/sh
#
# ~/.xinitrc

/bin/sh ${HOME}/.config/Xorg/configure.sh

systemctl --user import-environment
systemctl --user start xorg.target

/usr/bin/i3 &

# Just kill the sleep to exit X11
sleep 365d
