sysconfig
=========

I don't like editing files outside my `$HOME`. Since it later becomes
impossible to keep track of what changed and why. Altering a package's file
also results in it quickly being overwritten after an update, and setting up
new devices becomes a pain, since I'd have to figure out how I configured
everything.

This repository contains all files outside of `$HOME` that are not owned by any
package. Basically, the package manager keeps track of all system files.

Files inside this repository are all copied into a package, and that's
installed via pacman. Essentially, my configuration is simply a system package.

Finally, note that some of the files here are pacman hooks, which get run
whenever pacman installs some package. These are ideal if a file needs to be
modified, but will get overwritten by updates.

Note that this repository **only** contain configuration files that need
to be installed as root. User-level settings are via [homesick][homesick]
Check out my [dotfiles][dotfiles] repository if you're interested in those.

[homesick]: https://github.com/technicalpickles/homesick
[dotfiles]: https://gitlab.com/WhyNotHugo/dotfiles

# Other notes

`$USER` needs to be in group `video` to be able to control laptop backlight.
