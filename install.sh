set -x

if [[ ! -d $HOME/bin ]]; then
  mkdir $HOME/bin
fi

stow --target=$HOME zsh vim git tmux

# This is a bit special as we might have machine specific files here already
stow --target=$HOME/bin -R bin
