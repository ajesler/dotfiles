# dotfiles

Managed with [Stow](https://www.gnu.org/software/stow/).

## Installing

When installing, you'll need to comment out the line 'export ZSH="$HOME/.oh-my-zsh"' in the `zsh/.zshrc` file until you have zsh installed.

Then run `mv ~/.zshrc ~/.zshrc.bak` and `ln -s /Users/ajesler/dev/dotfiles/zsh/.zshrc ~/.zshrc`.

You'll need to manually install the [ZSH dracula theme](https://draculatheme.com/zsh) and [tmux plugin manager](https://github.com/tmux-plugins/tpm?tab=readme-ov-file#installation).


## Inspiration

https://github.com/wohyah/dotfiles
https://github.com/sheerun/dotfiles
https://github.com/grigoryvp/home/blob/master/.vimrc
https://gist.github.com/ericsage/2f805ba43eaeea2335bd
https://github.com/thoughtbot/dotfiles/blob/master/vimrc

