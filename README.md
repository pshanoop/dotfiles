My dotfiles
===========

🏡 My personal dotfiles (i.e.: user-wide configuration for my systems).

Having a history of config files also allows me to be bolder when experimenting
with new features or setups -- if I find anything breaks, it's very simple to
got back to my previous configuration.

Other uses of this repository include:

 - Sync configurations across machines.
 - Keep a backup of my configurations.
 - Keep old revisions of my configurations. (Duh!)
 - Quickly configure new machines. I keep a dump of my installed packages, so
   installing all of them on a new device, and them cloning this repo in should
   be enough to get me up and running!

This repository is public because:

 - There's no reason to keep it secret!
 - It might help other trying to configure things similarly. I document changes
   (since it's very useful for me to know why I changed something a few
   weeks/years back), and this should also be useful to others.
 - It's an easy way to share details about my setup, both when being asked for
   tips, as well ask when asking for help debugging something.
 - The quickly share config files with others who are curious on how I
   achieved something.

I use my own script (see `sync.py`) to keep this repository in sync with my
actual dotfiles using symlinks.

Overview
--------

I use `sway` (i3-like wayland compositor) with `waybar` for my desktop.
`Neovim` is my editor of choice, and the terminal (`alacritty` + `zsh`) is my
IDE.

I try to keep my setup as a reproducible one, so in case of breakage it's
possible to roll back and forth in time between settings.

I used [`darkman`](https://gitlab.com/WhyNotHugo/darkman) to auto-switch into
dark mode on a schedule (based on sundown / sunrise).

### Vim

You should run `:PlugInstall` to install all Vim plugins. Some additional
utilities are required in your `$PATH`, like `flake8` for python, etc.

### Alacritty

Alacritty is a great terminal emulator. It's super lightweight, very
responsive, and has all the features I need. It also has extremely good
defaults.

It's config format is also very readable. Since they provide a sample file, I
just used `vimdiff` to compare my own to the sample one (which has all the
defaults commented out).

The diff makes any settings that I've customised stand out very easily, and
also figuring out if some value is the default or not.

Manual commands
---------------

The following commands should be run manually *after* symlinking:

```sh
nvim -c "PlugInstall|q|q"
chsh -s $(which zsh)
```

LICENCE
-------

Copyright (c) 2012-2020, Hugo Osvaldo Barrera &lt;hugo@barrera.io&gt;  
This repository is licensed under the ISC licence. See LICENCE for details.
