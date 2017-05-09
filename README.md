My dotfiles
===========

This repository contains a great deal of my dotfiles and configurations.
This repo is used to:

 - Sync configurations between my machines.
 - Keep a backup of my configurations.
 - Keep old revisions of my configurations.
 - Quickly configure new machines (after installing a certain list of
 packages, syncing this repo should have a new desktop just I like it).

I decided to make these public, for three reasons:

 - Some of the applications I use have few examples. Google will surely
 point users seeking more here.
 - To share yet another "perfect mutt setup", which uses
 mutt+offlineimap+notmuch+opensmtpd.
 - The quickly share config files with friends who are curious on how
 I achieved something.

I use [homesick](https://github.com/technicalpickles/homesick) to keep this
repository in sync with my actual dotfiles using symlinks.

Feel free to reuse these files as you see fit. I don't think most they
even qualify as "software" for them to actually require a license, if you
think they do, feel free to reuse them under the terms of the BSD license.

Configurations
--------------

### Mutt + offlineimap + notmuch + opensmtpd + vdirsyncer.

I use [mutt-kz](https://github.com/karelzak/mutt-kz) for viewing and composing
email, which [offlineimap](http://offlineimap.org/) syncs locally.
[Notmuch](http://notmuchmail.org/) indexes emails for faster searches, and
[opensmtpd](https://opensmtpd.org/) relays outgoing emails, algo keeping them
in queue if I'm offline and auto-delivering when I re-gain internet connection.

The entire setup provides very fast access to my entire mailbox - even offline,
while keeping everything synced as much as possible.

Finally, [vdirsyncer](https://github.com/untitaker/vdirsyncer) syncs contact
data from my [CardDav server](http://radicale.org/), and I use a [glue
script](https://github.com/hobarrera/dotfiles/blob/master/home/.bin/muttcards) to
access them when composing from mutt.

### Desktop

I use systemd to manage my X or Wayland sessions. It starts various
applications (eg: window manager, offlineimap, sxhkd,
[caffeine-ng](https://github.com/hobarrera/caffeine-ng)), monitors them, and
restarts them in case of failure.

My WM of choice is [i3](http://i3wm.org/), and I use it along with
[i3pystatus](https://github.com/enkore/i3pystatus) to keep some useful data on
my statusbar (along with a view of all my active desktops).  

I use [sxhkd](https://github.com/baskerville/sxhkd) for global keybindings.
I've chosen it due to it's simple configuration syntax, simplicity, and
lightweightness. I prefer not to use my WM for global keybindings, since using
something like sxhkd allows me to swich WM easier if I choose to do so.

Copyright (c) 2013-2017, Hugo Osvaldo Barrera &lt;hugo@barrera.io&gt;
