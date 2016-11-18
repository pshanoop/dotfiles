#!/bin/sh
#
# Performs several backup tasks (into tarsnap)

set -e
set -u

echo "Backup summary for backup performed on $(hostname) at $WHEN:"

# ~~~Photos~~~
if [ $HOSTNAME == hyperion ]; then
  echo -e "\n~~~ Photos ~~~"
  FILE=photos

  cd $HOME
  $COMMAND -f photos-$WHEN \
    --exclude Canvas \
    --exclude Unsorted \
    --exclude iPhotos \
    $FILE
fi;

# ~~~Mailbox~~~
if [ $HOSTNAME == hyperion ]; then
  echo -e "\n~~~ Mailbox ~~~"
  FILE=maildir

  cd $HOME/.local/share/
  $COMMAND -f maildir-$WHEN \
    --exclude .notmuch \
    --exclude "INBOX.Junk Mail" \
    --exclude INBOX.Lists \
    --exclude RSS \
    --exclude Trash \
    $FILE
fi
