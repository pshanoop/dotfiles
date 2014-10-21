#!/bin/sh

if [ $(hostname -s) != hyperion ]; then exit 1; fi;

cd /srv/http/default/archlinux
/usr/bin/repose --files hugo.db *.xz
