#!/bin/sh
#
# ~/.xinitrc

systemctl --user import-environment
systemctl --user start xorg.target

# Just kill the sleep to exit X11
sleep 365d
