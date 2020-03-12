#
# ~/.profile
#

source $HOME/.config/sh/exports.sh

if [ "$(tty)" = "/dev/tty1" ]; then
  # first import environment variables from the login manager
  systemctl --user import-environment
  # then start the service
  systemctl --wait --user start sway.service
elif case $(tty) in /dev/tty*) ;; *) false;; esac; then
  exec bash
fi
