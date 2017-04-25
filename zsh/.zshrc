# Options
setopt auto_cd
setopt no_beep # don't beep on error
setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack
setopt append_history # Allow multiple terminal sessions to all append to one zsh command history
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
setopt hist_ignore_space # remove command line from history list when first character on the line is a space
setopt multios # perform implicit tees or cats when multiple redirections are attempted

set editing-mode vi
set keymap vi-command


# Autoloads
autoload -U colors && colors

# Exports
export LANG="en_US"
export LC_CTYPE=$LANG.UTF-8
export LC_COLLATE=C
export TERM='xterm-256color'
export EDITOR=vim

export HISTSIZE=1000
export HISTFILE=~/.zsh_history
export SAVEHIST=$HISTSIZE

# export PATH="/usr/local/bin:/usr/local/sbin:$PATH" # is this required for homebrew?

if [[ -d $HOME/bin ]]; then
  export PATH="$HOME/bin:$PATH"
fi


# Bindings
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward


source $HOME/.zsh/prompt.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/functions.zsh


# Language specific config files
source $HOME/.zsh/ruby.zsh
source $HOME/.zsh/go.zsh

# Load local config if it exists
[ -e $HOME/.zshrc_local ] && source $HOME/.zshrc_local
