#!/bin/sh

# This script will add all my remotes to git, and set their master
# branch as the default (so `git pull --all` will pull from all (available)
# remotes.
# People who reuse homesync.py and bootstrap.sh shouldn't run this. It's
# just for me :)

git remote add hyperion hyperion.local:/home/hugo/.homes
git remote add hermes   hermes.local:/home/hugo/.homes
git remote add ares     ares.local:/home/hugo/.homes
git remote add github	git@github.com:hobarrera/dotfiles.git
git remote add elysion	elysion:/home/hugo/git/homes.git
