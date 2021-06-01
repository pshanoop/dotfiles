#!/bin/sh
#
# Mark all package that are listed here as "installed as dependency".
# This helps keep the output of "explicitly installed packages" nice and short.

set -xe

# shellcheck disable=SC2046
sudo pacman -D --asdeps $(pacman -Qi whynothugo-desktop | grep "Depends On" | cut -d: -f2)
