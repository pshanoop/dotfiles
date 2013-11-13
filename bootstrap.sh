#!/bin/sh

# This script will enable some basic (and not-so-basic) systemd service
# so as to have a running X enviroment. Once it has started, you can run
# `systemctl --user enable` ??.services to enable more services.  I use
# this script to get new installations (new machine) up and running quicky
# after cloning my home repo, and symlinking everything using homesync.py.

mkdir -p "$HOME/.local/share/maildir/Personal"
mkdir -p "$HOME/.local/share/urxvt"
pacaur -S python2-docopt
