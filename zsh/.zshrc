# Interactive shell settings

if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

export LC_ALL="en_US.UTF-8"
export LANG="en_US"

export TERM='screen-256color'
set editing-mode vi
set keymap vi-command

if [[ -d $HOME/bin ]]; then
  export PATH=$HOME/bin;$PATH
fi

if [[ -a $HOME/.zshrc_local ]]; then
  source $HOME/.zshrc_local
fi
