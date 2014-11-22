#
# ~/.profile
#

source $HOME/.config/sh/exports.sh

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
  exec startx
fi
