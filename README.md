# whynothugo-desktop

This meta-package carrier my system configuration and pulls in packages I rely
on.

## System configuration

Altering files outside of `$HOME` is problematic. When upgrading, they may be
overwritten by a new version, and introduce subtle breakage that's very hard to
pinpoint. OTOH, some are not replaced when upgrading, and those might be
problematic if they're incompatible with the new upgrade (and again, a hard to
pinpoint issue).

This repository contains all files outside of `$HOME` that are not owned by any
package. Basically, the package manager keeps track of ALL my system files.

Files inside this repository are all copied into a package, and that's
installed via pacman. Essentially, my configuration is simply contained inside
this package.

Finally, note that some of the files here are pacman hooks, which get run
whenever pacman installs some package. These are ideal if a file needs to be
modified, but will get overwritten by updates.

Note that this repository **only** contain configuration files that need
to be installed as root. User-level settings are via [homesick][homesick]
Check out my [dotfiles][dotfiles] repository if you're interested in those.

[homesick]: https://github.com/technicalpickles/homesick
[dotfiles]: https://gitlab.com/WhyNotHugo/dotfiles

## Extra manual notes

`$USER` needs to be in group `video` to be able to control laptop backlight.

# Packages

This meta-package also depends on packages that are part of my desktop:
the compositor, browser, code editor, and all sorts of development tool.

While I often install and un-install packages via my package manager, many times
they're for a short time, or I'm testing something. When I want to commit
something and also make sure it's in all my systems, I list in as a dependency
here.

A nice side effect of this, is that I can merely install this package onto a
new system to have it up and ready to go with all my applications.

It also serves as a pseudo-documentation of what's installed and why.
