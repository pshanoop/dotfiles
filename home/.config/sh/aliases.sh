#
# ~/.aliases
#

alias ls="lsd"
alias ll="lsd -l"
alias la="lsd -A"
alias l="lsd -A"
alias tree='lsd --tree'

# Git Directory: Change directory into the current repo's root. Use `popd` to
# jump back.
alias gitd='pushd $(git rev-parse --show-toplevel)'

alias vim="nvim"

alias grep="grep --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
alias sudo='/usr/bin/sudo '
alias less='less -rX'
alias open='xdg-open'
alias fmt='fmt -w 79'
alias ssh='TERM=xterm-256color ssh'
alias p='git push -u origin HEAD'
alias u='git fetch && git rebase --autostash origin/$(git branch --show-current)'
alias tmux='/usr/bin/tmux -f ~/.config/tmux/tmux.conf'
alias calc="ipython"
