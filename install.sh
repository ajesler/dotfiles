set -x

function failure() {
  set +x
  # TODO Make this red
  echo "Installation failed!"
  exit 1
}

if [[ ! -d $HOME/bin ]]; then
  mkdir $HOME/bin || failure
fi

stow --target=$HOME zsh nvim git tmux || failure

# This is a bit special as we might have machine specific files here already
stow --target=$HOME/bin -R bin || failure
