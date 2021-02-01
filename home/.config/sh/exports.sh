#                            _
#  _____  ___ __   ___  _ __| |_ ___
# / _ \ \/ / '_ \ / _ \| '__| __/ __|
#|  __/>  <| |_) | (_) | |  | |_\__ \
# \___/_/\_\ .__/ \___/|_|   \__|___/
#          |_|
#
# This file contains shell exports that I want on all my interactive shells.
#
# This file is sourced when creating a new interactive shell.
#
# It's also sourced _before_ starting Wayland, so variables are inhereted from
# there directly.

# Include my local bin in $PATH:
export PATH=$HOME/.local/bin:/home/hugo/.gem/ruby/2.7.0/bin:$PATH

# Use neovim instead of vi.
export EDITOR=nvim
export VISUAL=nvim

# -r sends control characters so it renders colours and stuff.
# -X avoids clearing the screen.
export PAGER="less -rX"

# Enableds mouse scrolling:
export LESS='--mouse'

# Coloured man pages.
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Prevent wine from creating desktop entries for wine's apps (e.g.: notepad).
export WINEDLLOVERRIDES=winemenubuilder.exe=d

# Make Java applications use font antialiasing
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export _JAVA_OPTIONS="-Dswing.aatext=true"

# xdg-desktop-portal will use the right backed if this is exported:
# "sway" is required to screen share and alike (since I'm using sway).
# "GNOME" is required for GTK applications to work in flatpak and alike.
# The naming of the GTK portal is most unfortunate.
# See https://github.com/flatpak/flatpak/issues/2861#issuecomment-735476004
export XDG_CURRENT_DESKTOP="sway"

# Several apps use this. Other use mimeapps.list.
export BROWSER=firefox

# SSH-agent
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.sock

# Fix scrolling with a mouse on GTK3 apps
export GDK_CORE_DEVICE_EVENTS=1

# makepkg settings
export PKGDEST=$HOME/.cache/makepkg/packages
export SRCDEST=$HOME/.cache/makepkg/src
export PACKAGER="Hugo Osvaldo Barrera <hugo@barrera.io>"

export EMAIL="hugo@barrera.io"

# Use ag with fzf (this also applies to fzf-vim).
# This is the command used to generate the list; fzf does the fuzzyness itself.
export FZF_DEFAULT_COMMAND='ag -g .'
# Ask upstream: (Why isn't this the same as FZF_DEFAULT_COMMAND?)
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

# Make Qt apps honour DPI settings.
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# Make Qt apps use the GTK3 filepicker.
export QT_QPA_PLATFORMTHEME=gtk3

# Flatpak
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/:/var/lib/flatpak/exports/share:/home/hugo/.local/share/flatpak/exports/share

# Use rootless docker.
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# XDG dirs ====================================================================
# Many apps don't follow the stadanrd locations for cache and data, and just
# dump stuff into $HOME. This is extremely annoying, since $HOME quickly gets
# littered with junk (e.g.: cached data, internal app state, etc).
#
# These settings override this for applications known to misbehave, so I don't
# have to dig through junk to find my own files.

# Configuration files:
export DOCKER_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"/docker
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME:-$HOME/.config}"/ripgrep.conf

# App data. More "data" than cache, but I find these disposable:
export CARGO_HOME=$HOME/.cache/cargo
export RUSTUP_HOME=$HOME/.cache/rustup
export WORKON_HOME=$HOME/.cache/virtualenvs

# Interactive shell histories:
export PSQL_HISTORY=$HOME/.local/share/psql_history
export LESSHISTFILE=$HOME/.local/share/less_history
export IPYTHONDIR=$HOME/.local/share/ipython/

# For python: https://gist.github.com/viliampucik/8713b09ff7e4d984b29bfcd7804dc1f4

# CJK input ===================================================================
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Wayland/Sway-specific =======================================================

# Make Qt apps use wayland by default.
# Breaks binaries where upstream neglects to build properly.
export QT_QPA_PLATFORM=wayland

# Older versions of Qt always show window decorations. To hide them:
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# Some Java AWT apps would not display properly unless you set the following:
export _JAVA_AWT_WM_NONREPARENTING=1

# Firefox doesn't use wayland by default yet:
export MOZ_ENABLE_WAYLAND=1
