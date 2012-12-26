#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=$HOME/.bin:$HOME/.bin.local:$PATH
export PATH

export EDITOR="vi"
export VISUAL="vi"

export WINEARCH=win32

export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BROWSER=firefox
export SSH_ASKPASS=/usr/lib/ssh/ssh-askpass

function __git_wd {
  ruby -e "print (%x{git branch 2>/dev/null}.each_line.grep(/^\*/).first || '').gsub(/^\* (.+)$/, ':\1')"
}
#PS1='[\u@\h \W]\$ '
export PS1="[\u@\h \W\[\033[01;32m\]\$(__git_wd)\[\033[0m\]]$\[\033[00m\] "

#export LC_ALL=
#export LC_COLLATE="C"
#export LANG="en_US.UTF-8"
#export LC_TIME="en_DK.utf8"

. ~/.aliases

export SDL_AUDIODRIVER=alsa
