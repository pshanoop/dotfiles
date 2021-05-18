#!/bin/sh
#
# Shell aliases
#
# A kitchen sink of aliases. These are all used interactively and not for
# scripts.

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

# Nice, short alias.
alias v="nvim"

alias grep="grep --color=auto --exclude-dir=.git"
alias less='less -rX'
alias open='xdg-open'
alias ssh='TERM=xterm-256color ssh'
alias tmux='/usr/bin/tmux -f ~/.config/tmux/tmux.conf'
alias calc="bc -l"

# Git
alias f='git fetch'
alias s='git status'
alias p='git push -u origin HEAD'
alias p1='git push origin HEAD~:refs/heads/$(git branch --show-current)'
alias pt='git push -u origin --tags'
alias u='git fetch && git rebase --autostash origin/$(git branch --show-current)'

alias av="aws-vault exec"

# Shortcut for printing sway logs. Usually used with --this-boot or --follow.
alias swaylogs="journalctl --user --identifier sway"

# === macOS specific
# Brew needs this to work on Big Sur:
alias brew="arch -x86_64 /usr/local/bin/brew "

# === NVM
# Things like NVM have a werid design where they're designed to run every time
# you spawn a new shell, and continuously run different hooks. This is terrible
# design and terrible for performance wise, and also messes up how the shell
# NORMALLY works.
#
# This function is a workaround so that `nvm` can be run explicitly when
# needed, but doesn't bother when not explicitly invoken. Like any other tool.

nvm_on() {
  export NVM_DIR=$HOME/.cache/nvm
  . /usr/share/nvm/init-nvm.sh
  nvm use
}
