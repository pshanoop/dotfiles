#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=$(find $HOME/.bin/ -type d -exec printf "{}:" \;):$PATH
export PATH

export EDITOR="vi"
export VISUAL="vi"

export WINEARCH=win32

export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BROWSER=firefox
export SSH_ASKPASS=/usr/lib/ssh/gnome-ssh-askpass2

function __git_wd {
  ruby -e "print (%x{git branch 2>/dev/null}.each_line.grep(/^\*/).first || '').gsub(/^\* (.+)$/, ':\1')"
}
export PS1="[\u@\h \W\[\033[01;32m\]\$(__git_wd)\[\033[0m\]]$\[\033[00m\] "

. ~/.aliases

export SDL_AUDIODRIVER=alsa
