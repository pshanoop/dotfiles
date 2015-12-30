#!/bin/sh
#
# Back up mailbox into tarsnap.

set -e
set -u

if [ $(hostname -s) != hyperion ]; then exit 1; fi;

(
  PARENT=/home/hugo/.local/share/
  FILE=maildir
  CACHE_DIR=/home/hugo/.local/share/tarsnap/cache
  WHEN=$(date +%Y-%m-%dT%H%M%S%z)
  KEY=/home/hugo/priv/keys/tarsnap/barrera.io/hyperion.w.key

  cd $PARENT
  tarsnap -c --keyfile $KEY --cachedir $CACHE_DIR -f $FILE-$WHEN \
    --exclude .notmuch \
    --exclude INBOX.Trash \
    --exclude INBOX.IDF \
    --one-file-system --print-stats --humanize-numbers $FILE
) 2>&1 | mail -s "Daily Email Backup" hugo@barrera.io
