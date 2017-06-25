fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

echo_magenta () {
  echo "$fg_no_bold[magenta]${@}$reset_color"
}

echo_red () {
  echo "$fg_no_bold[red]${@}$reset_color"
}

echo_blue () {
  echo "$fg_no_bold[blue]${@}$reset_color"
}

echo_green () {
  echo "$fg_no_bold[green]${@}$reset_color"
}
