My dotfiles
===========

This repository contains my dotfiles and configurations.
This repo is used to:

 - Sync configurations between my machines.
 - Keep a backup of my configurations.
 - Keep old revisions of my configurations.
 - Quickly configure new machines (after installing a certain list of
 packages, syncing this repo should have a new desktop just I like it).

I decided to make these public, for three reasons:

 - Some of the applications I use have few examples. Google will surely
   point users seeking more here.
 - It's an easy way to share details about my setup, both when being asked for
   tips, as well ask when asking for help debugging something.
 - The quickly share config files with friends who are curious on how I
   achieved something.

I use [homesick](https://github.com/technicalpickles/homesick) to keep this
repository in sync with my actual dotfiles using symlinks.

Feel free to reuse these files as you see fit. I don't think most they
even qualify as "software" for them to actually require a license, if you
think they do, feel free to reuse them under the terms of the ISC license.

Overview
--------

I use `sway` (i3-like wayland compositor) with `waybar` for my desktop. `Vim`
is my editor of choice, and the terminal (`termite` + `zsh`) is my IDE.

I try to keep my setup as a reproducible one, so in case of breakage it's
possible to roll back and forth in time between settings.

### Vim

You should run `:PlugInstall` to install all vim plugins. Some additional
utilities are required in your `$PATH`, like `flake8` for python, etc.

Manual commands
---------------

The following commands should be run manually *after* symlinking:

```
echo -e ':PlugInstall\n' | nvim
chsh -s $(which zsh)
```

Copyright (c) 2012-2020, Hugo Osvaldo Barrera &lt;hugo@barrera.io&gt;
