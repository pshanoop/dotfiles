#!/bin/sh
export MOUNTPATH=~/mount/files.barrera.io
mkdir -p ${MOUNTPATH}
sshfs hades.barrera.io:/var/www/http/files.barrera.io ${MOUNTPATH}
