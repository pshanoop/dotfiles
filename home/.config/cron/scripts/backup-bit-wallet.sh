#!/bin/sh

set -e
set -u

if [ $(hostname -s) != hyperion ]; then exit 1; fi;

(
  FILE=$HOME/.bitcoin/wallet.dat
  CACHE_DIR=/home/hugo/.local/share/tarsnap/cache
  WHEN=$(date +%Y-%m-%dT%H%M%S%z)
  KEY=/home/hugo/priv/keys/tarsnap/barrera.io/hyperion.w.key

  tarsnap -c --keyfile $KEY --cachedir $CACHE_DIR -f bitcoin-$WHEN \
    --print-stats --humanize-numbers $FILE
) 2>&1 | mail -s "Bitcoin Wallet Backup" hugo@barrera.io
