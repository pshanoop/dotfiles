# History =====================================================================
HISTFILE=~/.local/share/zsh/history
SAVEHIST=100000
HISTSIZE=100000
setopt inc_append_history  # Write lines as commands are executed.
setopt hist_ignore_dups  # Collapse two consecutive idential commands.
setopt hist_find_no_dups  # Ignore duplicates when searching history.
setopt share_history  # Read lines other shells write too.
setopt hist_ignore_space  # Lines that begin with space are not recorded.
setopt hist_verify  # Don't auto-execute selected history entry.

# Additional shell settings (not zsh-specific) ================================
source $HOME/.config/sh/exports.sh
source $HOME/.config/sh/aliases.sh

# Shell plugins ===============================================================

# Shell prompt
eval "$(starship init zsh)"

# Load virtualenvwrapper
source $(which virtualenvwrapper_lazy.sh)
source /usr/share/fzf/key-bindings.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Keybindings =================================================================

# Configure the delete key to do it's thing:
bindkey '^D' delete-char
bindkey '^[[3~' delete-char
bindkey -a '^[[3~' delete-char

# These are emacs keybindings, but I've just gotten used to them.
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

# Reduce the timout for ESC
export KEYTIMEOUT=1

# History navigation
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

# Window titles ===============================================================
precmd () {
  print -Pn "\e]0;alacritty [%~]\a"
}
preexec () {
  print -Pn "\e]0;alacritty [%~]: $1\a"
}

# ls colours ==================================================================
export LSCOLORS=Gxfxcxdxbxegedabagacad
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"

# Autocompletion ==============================================================
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.cache/zsh_completion
# Make completion match at any part of the string (not just the beggining).
# (Note this isn't fuzzy though; it looks for an exact match).
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
# Shift tab to navigate backwards
bindkey '^[[Z' reverse-menu-complete
