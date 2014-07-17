#
# ~/.bashrc
#
# Last reviewed 2014-06-17

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add ~/.bin and all subdirectories to PATH
PATH=$(find $HOME/.bin/ -type d -exec printf "{}:" \;)$PATH
export PATH

export HISTSIZE=1000
export HISTFILESIZE=2000

# This is usually the default, but some (crappy) apps open other editors
# by default
export EDITOR="vi"
export VISUAL="vi"
export PAGER=less

# Force wine to run in i686 mode (and not amd64).
export WINEARCH=win32

# Prevent wine from creating Desktop Entry files for wine's
# notepad/iexplore/etc.
export WINEDLLOVERRIDES=winemenubuilder.exe=d

# Make Java applications use font antialiasing
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"

# This is the default, but some non-gtk apps won't use it without setting
# this variable. I'm looking at you, eclipse.
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Other defaults
export TERMINAL=urxvtc
export BROWSER=firefox
export SSH_ASKPASS=/usr/lib/ssh/gnome-ssh-askpass2

# Show the current git branch in PS1
function __git_wd {
  ruby -e "print (%x{git branch 2>/dev/null}.each_line.grep(/^\*/).first || '').gsub(/^\* (.+)$/, ':\1')"
}
# Ditto mercurial
function __hg_wd {
  ruby -e "print (%x{hg branch 2>/dev/null} || '').gsub(/^(.+)$/, ':\1')"
}

export     RED="\[\033[01;31m\]"
export   GREEN="\[\033[01;32m\]"
export    BLUE="\[\033[01;34m\]"
export  PURPLE="\[\033[01;35m\]"
export DEFAULT="\[\033[0m\]"

export PS1="[\u@\h \W$GREEN\$(__git_wd)$BLUE\$(__hg_wd)$DEFAULT]\$ "
export PS1="[\u@\h \w$GREEN\$(__git_wd)$BLUE\$(__hg_wd)$DEFAULT]\n\$ $DEFAULT"

. ~/.aliases

export SDL_AUDIODRIVER=alsa
export RXVT_SOCKET="$HOME/.local/share/urxvt/urxvtd-<nodename>"

# Fix scrolling with a mouse on GTK3 apps
export GDK_CORE_DEVICE_EVENTS=1

# makepkg settings
export PKGDEST=$HOME/workspace/Build/_packages
export PACKAGER="Hugo Osvaldo Barrera <hugo@barrera.io>"

# ssh-agent sharing
. ~/.cache/ssh-agent
ps aux | grep ssh-agent | grep -v grep | awk '{ print "Found agent: " $2 }'
$(ssh-add -l > /dev/null 2>&1)
if [ $? == 0 ]; then
  ssh-add -l | awk '{ print "Loaded key: " $3 }'
else
  ssh-add -l
fi;
printf "\n"

_OUTDATED_PACKAGES=$(pacman -Qqu)
if [ $? == 0 ]; then
  printf "$(echo ${_OUTDATED_PACKAGES} | wc -w) packages are out of date.\n"
fi
