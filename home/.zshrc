# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# time that oh-my-zsh is loaded.
# ZSH_THEME="hob"
# oneline: miloshadzic robbyrussell
# twoline: amuse avit bira fino gnzh

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

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
plugins=(vi-mode)

source $ZSH/oh-my-zsh.sh

source $HOME/.config/sh/exports.sh
source $HOME/.config/sh/aliases.sh

# export MANPATH="/usr/local/man:$MANPATH"

# Load virtualenvwrapper
source $(which virtualenvwrapper_lazy.sh)

#Load NVM
if [ -f /usr/share/nvm/init-nvm.sh ]; then
  source /usr/share/nvm/init-nvm.sh
fi

# Configure the delete key to do it's thing:
bindkey '^D' delete-char
bindkey '^[[3~' delete-char
bindkey -a '^[[3~' delete-char

# Use the partial-matching line-up function
bindkey "^[OA" up-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search
bindkey -a "^P" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search
bindkey -a "^N" down-line-or-beginning-search

# Reduce the timout for ESC
export KEYTIMEOUT=1

source /usr/share/fzf/key-bindings.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload zmv
