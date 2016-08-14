#!/bin/sh
alias supervisorctl='/usr/bin/supervisorctl -c /home/hugo/.config/supervisor/supervisord.conf'

supervidorctl start deluge
supervisorctl start mpd
