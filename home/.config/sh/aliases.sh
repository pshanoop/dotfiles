#
# Shell aliases
#
# This file contains a kitchen sink of aliases. They're exclusively aliases I
# use interactively, and no scripts depend on them.

# Directory listing aliases.
alias l="lsd -A"
alias ls="lsd"
alias ll="lsd -l"
alias tree='lsd --tree'

# Git Directory: Change directory into the current repo's root. Use `popd` to
# jump back.
alias gitd='pushd $(git rev-parse --show-toplevel)'

# Show system info.
alias 🐼=neofetch

# Memory muscle. Also "nvim" is too long.
alias vim="nvim"

alias grep="grep --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
alias less='less -rX'
alias open='xdg-open'
alias ssh='TERM=xterm-256color ssh'
alias p='git push -u origin HEAD'
alias u='git fetch && git rebase --autostash origin/$(git branch --show-current)'
alias tmux='/usr/bin/tmux -f ~/.config/tmux/tmux.conf'
alias calc="bc -l"

alias av="aws-vault exec"

# Shortcut for printing sway logs. Usually used with --this-boot or --follow.
alias swaylogs="journalctl --user --identifier sway"

# === macOS specific
# Brew needs this to work on Big Sur:
alias brew="arch -x86_64 /usr/local/bin/brew "

# === End macOS specific
