alias notes="tmux split-window 'cd ${HOME}/Documents/notes; ${EDITOR} .'"

alias vim=nivm
alias v=nvim

# Navigation
alias dev="cd ~/dev"
alias dotfiles="cd ~/dotfiles"

# System
alias ls="ls -alhG"

# Shell Config
alias zshr="source ~/.zshrc"

# Git
alias g=git
alias gap="git add -p"
alias gco="git checkout"
alias gs="git status -u"
alias gd="git diff"
alias gds="git diff --cached"
alias gcl="git clone"
alias gb="git branch"

# Ruby
alias be="bundle exec"
alias ber="bundle exec rspec"
alias berc="CAPYBARA_DRIVER=selenium_chrome bundle exec rspec"
alias bec="bundle exec rails console"

# The Silver Searcher
alias ag='ag --hidden' # Searh hidden files by default. See ~/.agignore for excluded files

# Yarn
alias ytd="DEBUG_PRINT_LIMIT=100000 yarn test"
