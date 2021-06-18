#
# ~/.profile
#

source $HOME/.config/sh/exports.sh

if [ "$(tty)" = "/dev/tty1" ]; then
  # https://github.com/systemd/systemd/issues/14489
  # Affects apps like older Qts, etc.
  export XDG_SESSION_TYPE=wayland

  # This will be imported into the systemd user session by sway:
  export XDG_CURRENT_DESKTOP=sway

  /usr/bin/sudo /usr/bin/plymouth quit --retain-splash
  WLR_DRM_NO_MODIFIERS=1 systemd-cat --identifier=sway sway
elif case $(tty) in /dev/tty*) ;; *) false;; esac; then
  exec bash
fi
