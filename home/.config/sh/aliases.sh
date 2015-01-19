#
# ~/.aliases
#

alias ls='ls -Fh --color=auto'
alias ll='ls -l --color=tty'
alias la='ls -la'
alias grep="grep --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
alias sudo='/usr/bin/sudo '
alias vte='vte --reverse -f "Droid Sans Mono" -D'
alias clock='/usr/bin/tty-clock -s -c -C 7'
alias readcd='readcd -dev=/dev/sg1 -f '
alias tree='tree -C'
alias diff='colordiff'
alias less='less -rX'
alias open='xdg-open'
alias vi=vim
alias fmt='fmt -w 79'
alias sessionctl="supervisorctl -c $HOME/.config/supervisor/supervisord.conf"
alias tree='tree -C'

alias env='. env/bin/activate'
