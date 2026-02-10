export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="Dracula"

plugins=()

source $ZSH/oh-my-zsh.sh

fpath=(~/.zsh $fpath)

# Options
setopt auto_cd
setopt no_beep # don't beep on error
setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack
setopt multios # perform implicit tees or cats when multiple redirections are attempted

# History
# setopt inc_append_history # Add comamnds as they are typed, dont wait until shell exit
setopt append_history # Allow multiple terminal sessions to all append to one zsh command history
setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
setopt hist_ignore_space # remove command line from history list when first character on the line is a space
setopt share_history # Share the history between terminals

set editing-mode vi
set keymap vi-command
# stty sane # Fix the thing where enter is sometimes ^M
stty icrnl # Fix the thing where enter is sometimes ^M

# Autoloads
autoload -U colors && colors

# Exports
export LANG="en_US"
export LC_CTYPE=$LANG.UTF-8
export LC_COLLATE=C
export TERM='xterm-256color'

export HISTSIZE=10000
export HISTFILE=~/.zsh_history
export SAVEHIST=$HISTSIZE

export FZF_DEFAULT_COMMAND='ag -g ""'
export BAT_THEME="Dracula"

# Bindings
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^w' backward-kill-word
# bindkey '^r' history-incremental-search-backward

source $HOME/.zsh/prompt.zsh

# Load local config if it exists
[ -e $HOME/.zshrc_local ] && source $HOME/.zshrc_local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(fzf --zsh)"
