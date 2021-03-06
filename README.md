# ~/.dotfiles

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

I use my own script (see `sync.py`) to keep this repository in sync with my
actual dotfiles using symlinks.

## Tools I use

- `sway`: desktop compositor
- `waybar`: system status bar
- `neovim`: code editor (using LSP, tree-sitter, and quite a few plugins)
- `zsh`: shell and main working environment (it's designed for interactive use)
- `alacritty`: very fast OpenGL terminal emulator in Rust
- `gammastep`: screen colour temperature based on sunrise and sundown
- `darkman`: automatic dark mode based on sundown and sunrise

I try to keep my setup as a reproducible one, so in case of breakage it's
possible to roll back and forth in time between settings.

I try to upstream any fixes, tweaks and improvements whenever possible, and
limit this repository to customisations and very opinionated settings only.

## Sysconfig

I also keep my system-wide configuration settings in this repository. See
[sysconfig/README.md](sysconfig/README.md) for more details on that.

## Documentation

I try to keep things relatively well documented. Some settings or overrides
require attention only once every couple of years (e.g.: Firefox style
overrides), and keeping comments around lets me figure out what existing code
does, and where I got it from.

Git blame should generally be rather useful too.

## LICENCE

Copyright 2012-2021, Hugo Osvaldo Barrera <hugo@barrera.io>  
This repository is licensed under the ISC licence. See LICENCE for details.
