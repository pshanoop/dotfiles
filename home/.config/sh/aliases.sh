#
# ~/.aliases
#

if ls --color > /dev/null 2>&1; then
  alias ls='ls -Fh --color=auto'
else
  alias ls='ls -Fh'
fi
alias ll='ls -l'
alias la='ls -la'
alias grep="grep --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
alias sudo='/usr/bin/sudo '
alias vte='vte --reverse -f "Droid Sans Mono" -D'
alias clock='/usr/bin/tty-clock -s -c -C 7'
alias readcd='readcd -dev=/dev/sg1 -f '
alias tree='tree -C'
alias less='less -rX'
alias open='xdg-open'
alias fmt='fmt -w 79'
alias sessionctl='echo Please use \`supervisorctl\` instead.'
alias supervisorctl="/usr/bin/supervisorctl -c $HOME/.config/supervisor/supervisord.conf"
alias tree='tree -C'
alias irssi='/usr/bin/irssi --home=~/.config/irssi'
