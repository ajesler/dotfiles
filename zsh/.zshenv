export EDITOR=nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# export PATH="/opt/homebrew/bin:$PATH"

if [[ -d $HOME/bin ]]; then
  export PATH="$PATH:$HOME/bin"
fi

source $HOME/.zsh/functions.zsh
source $HOME/.zsh/aliases.zsh

# Language specific config files
source $HOME/.zsh/ruby.zsh
source $HOME/.zsh/go.zsh

# Load local config if it exists
if [[ -f $HOME/.zshenv_local ]]; then
  source $HOME/.zshenv_local
fi
