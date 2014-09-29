#
# ~/.bash_profile
#
# Last reviewed 2014-06-17

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
  exec startx
fi
