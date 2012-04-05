#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#sudo /sbin/bootchartd stop
if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
  exec startx # >.xsession-log 2>.xsession-errors
fi
