#!/bin/sh
#
# Backs up photos into the fileserver.
#
# Pre-existing files are hardlinked to yesterday's copy, so the size
# increase equals the size of new files, while keeping daily snapshots.
 
set -e

if [ $(hostname -s) != hyperion ]; then exit 1; fi;

REMOTE=backup@hades.barrera.io
TODAY=$(date -I)

# Using -H is too expensive, and I don't use hardlinks in this directory.
# Use -x to avoid copying .enc.mount directories (fuse-mounted encrypted
# data).

# Sync the files:
rsync -aqx /home/hugo/photos/ $REMOTE:data/photos/$TODAY/ --link-dest=../latest/

# Link today's as latest:
ssh $REMOTE "rm data/photos/latest &&
             ln -sf data/photos/$TODAY data/photos/latest"
