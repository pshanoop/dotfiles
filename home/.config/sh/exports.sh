export PATH=$HOME/.local/bin/:$PATH

# Use neovim instead of vi.
export EDITOR=nvim
export VISUAL=nvim
export PAGER="less -rX"
export LESS='--mouse'

# Coloured man page
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Prevent wine from creating Desktop Entry files for wine's
# notepad/iexplore/etc.
export WINEDLLOVERRIDES=winemenubuilder.exe=d

# Make Java applications use font antialiasing
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export _JAVA_OPTIONS="-Dswing.aatext=true"

# xdg-desktop-portal will use the right backed if this is exported:
# "GNOME" is required for GTK applications to work in flatpak and alike.
# See https://github.com/flatpak/flatpak/issues/2861#issuecomment-735476004
export XDG_CURRENT_DESKTOP=sway;GNOME

# Other defaults
export BROWSER=firefox

# SSH-agent
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.sock

export SDL_AUDIODRIVER=alsa

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

# Data dirs
export DOCKER_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"/docker
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME:-$HOME/.config}"/ripgrep.conf

# Keep the history for some apps out of my home.
export PSQL_HISTORY=$HOME/.local/share/psql_history
export LESSHISTFILE=$HOME/.local/share/less_history
export IPYTHONDIR=$HOME/.local/share/ipython/

# Disposable data
export CARGO_HOME=$HOME/.cache/cargo
export WORKON_HOME=$HOME/.cache/virtualenvs

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
