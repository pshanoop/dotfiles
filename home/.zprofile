#
# ~/.profile
#

source $HOME/.config/sh/exports.sh

if [ "$(tty)" = "/dev/tty1" ]; then
  # https://github.com/systemd/systemd/issues/14489
  # Affects apps like older Qts, etc.
  export XDG_SESSION_TYPE=wayland

  # systemctl --user import-environment
  exec systemd-cat --identifier=sway sway
elif case $(tty) in /dev/tty*) ;; *) false;; esac; then
  exec bash
fi
