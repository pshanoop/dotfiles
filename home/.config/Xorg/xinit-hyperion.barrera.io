#!/bin/sh
alias supervisorctl='/usr/bin/supervisorctl -c /home/hugo/.config/supervisor/supervisord.conf'

numlockx on
supervidorctl start deluge
