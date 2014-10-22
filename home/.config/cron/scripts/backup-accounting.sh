#!/bin/sh

if [ $(hostname -s) != athena ]; then exit 1; fi;

cd /home/hugo/accounting/

if [ $(git status --porcelain homebank.xhb | wc -l) == 1 ]; then
  git commit -qm 'Automatic cron commit (homebank only).' homebank.xhb
fi
