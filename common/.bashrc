#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=$HOME/.bin:$HOME/.gem/ruby/1.9.1/bin:$HOME/.bin.local:$PATH
export PATH
export EDITOR="vi"
export WINEARCH=win32
export JAVA_OPTS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"

export BROWSER=firefox
export SSH_ASKPASS="zenity --password"

PS1='[\u@\h \W]\$ '

export LC_ALL=
export LC_COLLATE="C"
export LANG="en_US.UTF-8"
export LC_TIME="en_DK.utf8"

source ~/.aliases

export SDL_AUDIODRIVER=alsa
