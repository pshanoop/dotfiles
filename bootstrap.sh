#!/bin/sh

# This script will enable some basic (and not-so-basic) systemd service
# so as to have a running X enviroment. Once it has started, you can run
# `systemctl --user enable` ??.services to enable more services.  I use
# this script to get new installations (new machine) up and running quicky
# after cloning my home repo, and symlinking everything using homesync.py.

mkdir -p "$HOME/.config/systemd/user/desktop.target.wants"
mkdir -p "$HOME/.local/share/maildir/Personal"

ln -sf "$HOME/.config/systemd/user/compiz.service" "$HOME/.config/systemd/user/desktop.target.wants/"
ln -sf "$HOME/.config/systemd/user/gtk-window-decorator.service" "$HOME/.config/systemd/user/desktop.target.wants/"
ln -sf "$HOME/.config/systemd/user/lxpanel.service" "$HOME/.config/systemd/user/desktop.target.wants/"
ln -sf "$HOME/.config/systemd/user/offlineimap.service" "$HOME/.config/systemd/user/desktop.target.wants/"
ln -sf "$HOME/.config/systemd/user/parcellite.service" "$HOME/.config/systemd/user/desktop.target.wants/"
ln -sf "$HOME/.config/systemd/user/volctld.service" "$HOME/.config/systemd/user/desktop.target.wants/"
ln -sf "$HOME/.config/systemd/user/wicd-gtk.service" "$HOME/.config/systemd/user/desktop.target.wants/"
ln -sf "$HOME/.config/systemd/user/thunar.service" "$HOME/.config/systemd/user/desktop.target.wants/"
ln -sf "$HOME/.config/systemd/user/xbindkeys.service" "$HOME/.config/systemd/user/desktop.target.wants/"
ln -sf "$HOME/.config/systemd/user/xfce4-notifyd.service" "$HOME/.config/systemd/user/desktop.target.wants/"
ln -sf "$HOME/.config/systemd/user/x11vnc.service" "$HOME/.config/systemd/user/desktop.target.wants/"
ln -sf "$HOME/.config/systemd/user/xfce4-power-manager.service" "$HOME/.config/systemd/user/desktop.target.wants/"
