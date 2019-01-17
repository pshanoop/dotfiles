#
# ~/.profile
#

source $HOME/.config/sh/exports.sh

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
  sudo plymouth quit --retain-splash
  exec startx
fi
