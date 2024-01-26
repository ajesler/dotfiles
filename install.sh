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

stow --target=$HOME zsh nvim git tmux pry ag || failure

# This is a bit special as we might have machine specific files here already
stow --target=$HOME/bin -R bin || failure

if ! type brew &> /dev/null; then
  echo "Please install homebrew (https://brew.sh/) and run this again"
  exit 1
fi

brew bundle
