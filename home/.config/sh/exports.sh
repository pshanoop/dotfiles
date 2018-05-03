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
# Groovy/grails requires this:
export JAVA_HOME=/usr/lib/jvm/java-default-runtime/

# This is the default, but some non-gtk apps won't use it without setting
# this variable. I'm looking at you, eclipse.
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# This is used by qt5.
export QT_STYLE_OVERRIDE=gtk
# This should make qt apps use the gtk icon theme
export DESKTOP_SESSION=gnome

# Other defaults
export TERMINAL=termite
export BROWSER=firefox
export SSH_ASKPASS=/usr/lib/ssh/gnome-ssh-askpass

export SDL_AUDIODRIVER=alsa

# Fix scrolling with a mouse on GTK3 apps
export GDK_CORE_DEVICE_EVENTS=1

# makepkg settings
export PKGDEST=$HOME/workspace/Build/packages
export SRCDEST=$HOME/workspace/Build/src
export AURDEST=$HOME/workspace/Build/aurdata
export PACKAGER="Hugo Osvaldo Barrera <hugo@barrera.io>"

export EMAIL="hugo@barrera.io"

# Make pass copy into the primary/default X selection:
export PASSWORD_STORE_X_SELECTION=primary

export ANDROID_HOME=/opt/android-sdk

export WORKON_HOME=$HOME/.local/share/virtualenvs

export FZF_DEFAULT_COMMAND='ag -g ""'

# httpie places it's config in $HOME by default :(
export HTTPIE_CONFIG_DIR=$HOME/.config/httpie/

export WEECHAT_HOME=$HOME/.config/weechat/

# Make Qt apps honour DPI settings.
QT_AUTO_SCREEN_SCALE_FACTOR=1
