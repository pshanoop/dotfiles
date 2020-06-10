# Add ~/.bin and all subdirectories to PATH
PATH=$(find $HOME/.local/bin/ -type d -exec printf "{}:" \;)$PATH
export PATH

export HISTSIZE=1000
export HISTFILESIZE=2000

# Use neovim instead of vi.
export EDITOR=nvim
export VISUAL=nvim
export PAGER="less -rX"
export LESS='--mouse'

# Prevent wine from creating Desktop Entry files for wine's
# notepad/iexplore/etc.
export WINEDLLOVERRIDES=winemenubuilder.exe=d

# Make Java applications use font antialiasing
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export _JAVA_OPTIONS="-Dswing.aatext=true"


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

export WORKON_HOME=$HOME/.local/share/virtualenvs

# Use ripgrep with fzf (this includes inside Vim)
export FZF_DEFAULT_COMMAND='rg --files'

# Make Qt apps honour DPI settings.
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# Make Qt apps use the GTK3 filepicker.
export QT_QPA_PLATFORMTHEME=gtk3

eval "$(starship init zsh)"

# Flatpak
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/:/var/lib/flatpak/exports/share:/home/hugo/.local/share/flatpak/exports/share

# Make Qt apps use wayland by default.
# Breaks binaries where upstream neglects to build properly.
export QT_QPA_PLATFORM=wayland

export DOCKER_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"/docker
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME:-$HOME/.config}"/ripgrep.conf

# Keep the history for some apps out of my home.
export PSQL_HISTORY=$HOME/.local/share/psql_history
export LESSHISTFILE=$HOME/.local/share/less_history
export IPYTHONDIR=$HOME/.local/share/ipython/
export CARGO_HOME=$HOME/.cache/cargo

# Wayland/Sway-specific =======================================================

# Older versions of Qt always show window decorations. To hide them:
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
# Some Java AWT apps would not display properly unless you set the following:
export _JAVA_AWT_WM_NONREPARENTING=1
# Firefox doesn't use wayland by default yet:
export MOZ_ENABLE_WAYLAND=1
