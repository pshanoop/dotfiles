# OMZ/Antigen plugin that loads rvm if it's locally available

if [ -d $HOME/.rvm ]; then
  export rvm_ignore_gemrc_issues=1
  export PATH="$PATH:$HOME/.rvm/bin"
  source "$HOME/.rvm/scripts/rvm"
fi
