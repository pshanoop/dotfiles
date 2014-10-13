#!/bin/sh
#
# Jolla saves sent mail in the Sent mailbox, and this is not configurable. This
# script moves those email into the INBOX.

# Avoid this running on more than one host, to avoid possible duplications,
# etc.
if [ $(hostname -s) != hyperion ]; then exit 1; fi;

if [ $(ls -1 .local/share/maildir/Personal/Sent/cur/ | wc -l) != 0 ]; then
  mv $HOME/.local/share/maildir/Personal/Sent/cur/* \
    $HOME/.local/share/maildir/Personal/INBOX/cur/
fi;

