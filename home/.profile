#
# ~/.profile
#

source $HOME/.config/sh/exports.sh
eval "$(rbenv init - --no-rehash)"

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
  exec startx
fi
