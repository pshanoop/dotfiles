#!/bin/sh
#
# Wraps around the actual script that does the backsups, provising common
# variable and emailing the result.

set -e
set -u

HOSTNAME=$(hostname -s)
CACHE_DIR=/home/hugo/.local/share/tarsnap/cache
KEY=/home/hugo/priv/keys/tarsnap/barrera.io/$(hostname -s).w.key

SHARED_FLAGS="--print-stats --humanize-numbers --one-file-system"
COMMAND="tarsnap -c --keyfile $KEY --cachedir $CACHE_DIR $SHARED_FLAGS"

WHEN=$(date +%Y-%m-%dT%H%M%S%z)

REALSCRIPT=$(realpath $(dirname $0))/_daily-backups.sh

export HOSTNAME CACHE_DIR KEY SHARED_FLAGS COMMAND WHEN

sh $REALSCRIPT 2>&1 | mail -s "Backup summary for $(hostname)" hugo@barrera.io
