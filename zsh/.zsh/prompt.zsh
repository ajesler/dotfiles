# function get_pwd() {
#   print -D $PWD
# }

# function precmd() {
#   print -rP "%{$fg[yellow]%}$(get_pwd)"
# }

# PROMPT="%{$reset_color%}→ "

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

# export PS1="%1~ (${vcs_info_msg_0_}) $ "
# PROMPT="%1~ (${vcs_info_msg_0_}) $ "
PROMPT='[%1~](${vcs_info_msg_0_}) $ '
