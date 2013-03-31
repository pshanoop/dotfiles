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

git fetch hyperion
git fetch hermes
git fetch ares
git fetch github
git fetch elysion

git branch -u hyperion/master master
git branch -u hermes/master master
git branch -u ares/master master
git branch -u github/master master
git branch -u elysion/master master
