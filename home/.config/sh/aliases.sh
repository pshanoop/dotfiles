#
# ~/.aliases
#

alias ls="lsd"
alias ll="lsd -l"
alias la="lsd -A"
alias l="lsd -1"

alias grep="grep --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
alias sudo='/usr/bin/sudo '
alias tree='tree -C'
alias less='less -rX'
alias open='xdg-open'
alias fmt='fmt -w 79'
alias ssh='TERM=xterm-256color ssh'
alias tree='tree -C'
alias p='git push -u origin HEAD'
alias u='git fetch && git rebase --autostash origin/$(git branch --show-current)'
alias tmux='/usr/bin/tmux -f ~/.config/tmux/tmux.conf'
