# Add ~/.bin and all subdirectories to PATH
PATH=$(find $HOME/.local/bin/ -type d -exec printf "{}:" \;)$PATH
export PATH

export HISTSIZE=1000
export HISTFILESIZE=2000

# Use vim instead of vi.
export EDITOR=vim
export VISUAL=vim
export PAGER="less -rX"

# Prevent wine from creating Desktop Entry files for wine's
# notepad/iexplore/etc.
export WINEDLLOVERRIDES=winemenubuilder.exe=d

# Make Java applications use font antialiasing
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export _JAVA_OPTIONS="-Dswing.aatext=true"

# This should make qt apps use the gtk icon theme
export DESKTOP_SESSION=gnome

# Other defaults
export TERMINAL=termite
export BROWSER=firefox

# SSH-agent
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.sock

export SDL_AUDIODRIVER=alsa

# Fix scrolling with a mouse on GTK3 apps
export GDK_CORE_DEVICE_EVENTS=1

# makepkg settings
export PKGDEST=$HOME/.cache/makepkg/packages
export SRCDEST=$HOME/.cache/makepkg/src
export AURDEST=$HOME/.cache/makepkg/aurdata
export PACKAGER="Hugo Osvaldo Barrera <hugo@barrera.io>"

export EMAIL="hugo@barrera.io"

export ANDROID_HOME=/opt/android-sdk

export WORKON_HOME=$HOME/.local/share/virtualenvs

export FZF_DEFAULT_COMMAND='ag -g ""'

# httpie places it's config in $HOME by default :(
export HTTPIE_CONFIG_DIR=$HOME/.config/httpie/

# Make Qt apps honour DPI settings.
export QT_AUTO_SCREEN_SCALE_FACTOR=1

eval "$(starship init zsh)"

# Flatpak
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/:/var/lib/flatpak/exports/share:/home/hugo/.local/share/flatpak/exports/share

# Required for GPG to actually work
# https://github.com/keybase/keybase-issues/issues/2798
# export GPG_TTY=$(tty)

# Haven't tried this much yet
QT_QPA_PLATFORM=wayland

export DOCKER_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"/docker
