# whynothugo-desktop

This pseudo-package contains all my desktop system configuration. I've taken a
declarative approach for this; this package depends on others that I want
installed, and includes files to be placed into the root filesystem in order to
achieve the configuration desired.

This includes not only configuration files, but also hooks that are installed
when installing or updating certain other packages.

This allows not only easily replicating my desktop setup, but also results in
much easier to understand history of changes.

## Hooks + Patches

Altering files outside of `$HOME` is highly problematic. If the file is owned
by a package, it will be overwritten on next update, at which point whatever
configuration had been done is lost forever.

Fortunately, a lot of software nowadays supports drop-in files: files that you
place in a defined directory, and are appended to the software's configuration.

For software that _doesn't_ support drop-ins and expects you to edit their
files, I include a pacman hook+patch. The hook runs on each updated, and uses
`patch` to update the provided config file. In case of error, I'm alerted and
likely have to update the `patch` manually, but it's clear what failed and how.

Note that this repository **only** contain configuration files that need
to be installed as root. User-level settings are handled separately in my
[dotfiles][dotfiles] repository.

[dotfiles]: https://git.sr.ht/~whynothugo/dotfiles

## Extra manual notes

`$USER` needs to be in group `video` to be able to control laptop backlight.

# Packages

While I often install and un-install packages via my package manager, many times
they're for a short time, or I'm testing something. When I want to commit
something and also make sure it's in all my systems, I list in as a dependency
here.

A nice side effect of this, is that I can merely install this package onto a
new system to have it up and ready to go with all my applications.

It also allows keeping pacman's "List of explicitly packages" short, since
things that I need as part of my base system is omitted, being a dependency of
this package.

# sudo

`sudo` is configured to allow authenticating by just tapping the Yubikey. This
is very handy since it avoid needing to type the password as much, and allows
disabling sudo tickets.

The authfile is in `/etc/u2f_keys`, and lines for it can be generated using:

    pamu2fcfg -u $(whoami) -opam://$(hostname) -ipam://$(hostname)

# Secure Boot

I use secure boot to harden my desktop. The way this works is:

1. A pair of asymmetric keys is generated.
2. The public key is registered with the BIOS/UEFI/firmware.
3. The firmware is told to **only** boot executables signed with the private
   key.
4. The private key is kept on disk (which is fully encrypted), and used to sign
   new boot images on each update.

## Secure boot setup

### Part 1: prepare the firmware

- Reboot into the firmware/UEFI menu.
- Disable Secure Boot.
- Turn on custom key mode.
- Turn on setup mode.

### Part 2: set up the OS

- Reboot into Arch.
- Enroll keys: `sbctl enroll-key`
- Fill in `/etc/kernel/cmdline`.
- Reinstall this package (to trigger all hooks).

### Part 3:

- Reboot into the firmware/UEFI menu.
- Enable Secure Boot.
- Leave custom key mode on.
- Turn off setup mode.
