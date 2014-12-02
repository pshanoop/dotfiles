# Add ~/.bin and all subdirectories to PATH
PATH=$(find $HOME/.bin/ -type d -exec printf "{}:" \;)$PATH
export PATH

export HISTSIZE=1000
export HISTFILESIZE=2000

# Use vim instead of vi.
export EDITOR=vim
export VISUAL=vim
export PAGER="less -rX"

# Force wine to run in i686 mode (and not amd64).
export WINEARCH=win32

# Prevent wine from creating Desktop Entry files for wine's
# notepad/iexplore/etc.
export WINEDLLOVERRIDES=winemenubuilder.exe=d

# Make Java applications use font antialiasing
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export _JAVA_OPTIONS="-Dswing.aatext=true"

# This is the default, but some non-gtk apps won't use it without setting
# this variable. I'm looking at you, eclipse.
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# This is used by qt5.
export QT_STYLE_OVERRIDE=gtk
# This should make qt apps use the gtk icon theme
export DESKTOP_SESSION=gnome

# Other defaults
export TERMINAL=urxvtc
export BROWSER=firefox
export SSH_ASKPASS=/usr/lib/ssh/gnome-ssh-askpass2

export SDL_AUDIODRIVER=alsa
export RXVT_SOCKET="$HOME/.local/share/urxvt/urxvtd.sock"

# Fix scrolling with a mouse on GTK3 apps
export GDK_CORE_DEVICE_EVENTS=1

# makepkg settings
export PKGDEST=$HOME/workspace/Build/_packages
export PACKAGER="Hugo Osvaldo Barrera <hugo@barrera.io>"

# Needed for webcams to work?
# https://bbs.archlinux.org/viewtopic.php?pid=1474864
if [ -x /usr/lib/libv4l/v4l2convert.so ]; then
  export LD_PRELOAD=/usr/lib/libv4l/v4l2convert.so
fi
