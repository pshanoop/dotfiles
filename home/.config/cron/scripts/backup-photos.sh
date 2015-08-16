#!/bin/sh
#
# Backs up photos into tarsnap.
#
# Also keeps a local index of files uploaded on each backup, so finding
# deletions/moves should be easier. Note that this does not log file
# modifications.

set -e
set -u

if [ $(hostname -s) != hyperion ]; then exit 1; fi;

(
  FILE_DIR=/home/hugo/photos
  META_DIR=/home/hugo/.local/share/tarsnap/index
  CACHE_DIR=/home/hugo/.local/share/tarsnap/cache
  WHEN=$(date +%Y-%m-%dT%H%M%S%z)
  KEY=/home/hugo/priv/keys/tarsnap/barrera.io/hyperion.w.key

  # Update the file index.
  find $FILE_DIR | sort > $META_DIR/photos
  # TODO: Only commit if there's changes. Also, do a log --stat.
  git -C $META_DIR add $META_DIR/photos
  git -C $META_DIR commit -m "Update photos index file for $WHEN." \
    > /dev/null || true

  # Perform the backup itself.
  cd $FILE_DIR/..
  tarsnap -c --keyfile $KEY --cachedir $CACHE_DIR -f photos-$WHEN \
    --exclude Canvas --exclude Unsorted --exclude Jolla --one-file-system \
    --print-stats --humanize-numbers photos
) 2>&1 | mail -s "Daily Photo Backup" hugo@barrera.io
