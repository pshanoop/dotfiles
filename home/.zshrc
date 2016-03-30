# Start tmux and exit. If alreay inside tmux, skips this line.
[ -z $TMUX ] && exec tmux -f ~/.config/tmux/tmux.conf

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="hob"
# oneline: miloshadzic robbyrussell
# twoline: amuse avit bira fino gnzh

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.config/zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# zsh-syntax-highlighting needs to be last.
plugins=(pass sprunge gpg-agent ssh-agent wd virtualenv zsh-syntax-highlighting)
# virtualenv? Needs theme support?

source $ZSH/oh-my-zsh.sh

source $HOME/.config/sh/exports.sh
source $HOME/.config/sh/aliases.sh

# export MANPATH="/usr/local/man:$MANPATH"

# Load virtualenvwrapper
source /usr/bin/virtualenvwrapper_lazy.sh

# fzf plugin
source /etc/profile.d/fzf.zsh

autoload zmv
autoload zcalc

if [ -d $HOME/.rvm ]; then
  export rvm_ignore_gemrc_issues=1
  export PATH="$PATH:$HOME/.rvm/bin"
  source "$HOME/.rvm/scripts/rvm"
fi
