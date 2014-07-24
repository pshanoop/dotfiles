#!/bin/sh
#
# Creates empty directories which need to exists but apps won't
# auto-create.
#

mkdir -p "$HOME/.local/share/maildir/Personal"
mkdir -p "$HOME/.local/share/urxvt"
mkdir -p "$HOME/.cache/ssh"
