My dotfiles
===========

This repository contains a great deal of my dotfiles and configurations.  This repo is used to:

 - Sync configurations between my machines.
 - Keep a backup of my configurations.
 - Keep old revisions of my configurations.
 - Quickly configure new machines (after installing a certain list of packages, syncing this repo should have a new desktop just I like it).

I decided to make these public, for three reasons:

 - Some of the applications I use have few examples. Google will surely point users seeking more here.
 - To share yet another "perfect mutt setup", which uses mutt+offlineimap+notmuch+opensmtpd.
 - The quickly share config files with friends who are curious on how I achieved something.

There's a related ``homesync.py`` script (still WIP) that creates symlinks in the proper locations to the files inside this repo. I don't use  ~ as a git repo because that makes ``git status`` way too slow and unreadable.
At some point, I hope that ``homesync.py`` might be used by many others - or inspire derivates :).

Feel free to reuse these files as you see fit. I don't think most they even qualify as "software" for them to actually require a license, if you think they do, feel free to reuse them under the terms of the BSD license.

2013, Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
