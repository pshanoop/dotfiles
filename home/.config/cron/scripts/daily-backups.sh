
#!/bin/sh
#
# Performs several backup tasks (into tarsnap)

set -e
set -u

if [ $(hostname -s) != hyperion ]; then exit 1; fi;

CACHE_DIR=/home/hugo/.local/share/tarsnap/cache
KEY=/home/hugo/priv/keys/tarsnap/barrera.io/hyperion.w.key

SHARED_FLAGS="--print-stats --humanize-numbers --one-file-system"
COMMAND="tarsnap -c --keyfile $KEY --cachedir $CACHE_DIR $SHARED_FLAGS"

WHEN=$(date +%Y-%m-%dT%H%M%S%z)

(
# ~~~Photos~~~
  echo -e "\n~~~ Photos ~~~"
  FILE=photos

  cd $HOME
  $COMMAND -f photos-$WHEN \
    --exclude Canvas \
    --exclude Unsorted \
    --exclude Jolla \
    $FILE

# ~~~Bitcoin~~~
  echo -e "\n~~~ Bitcoin Wallet ~~~"
  FILE=wallet.dat

  cd $HOME/.bitcoin/
  $COMMAND -f bitcoin-$WHEN $FILE

# ~~~Mailbox~~~
  echo -e "\n~~~ Mailbox ~~~"
  FILE=maildir

  cd $HOME/.local/share/
  $COMMAND -f maildir-$WHEN \
    --exclude .notmuch \
    --exclude INBOX.Trash \
    --exclude INBOX.IDF \
    $FILE

) 2>&1 | mail -s "Backup summary for hyperion.barrera.io" hugo@barrera.io
