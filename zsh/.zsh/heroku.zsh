set_color() {
  local HEX_FG=$1
  local HEX_BG=$2
  local OPACITY=$3

  local FG_R=`echo $HEX_FG | sed 's/../0x&,/g' | awk -F "," '{printf("%d",$1 * 257)}'`
  local FG_G=`echo $HEX_FG | sed 's/../0x&,/g' | awk -F "," '{printf("%d",$2 * 257)}'`
  local FG_B=`echo $HEX_FG | sed 's/../0x&,/g' | awk -F "," '{printf("%d",$3 * 257)}'`
  local BG_R=`echo $HEX_BG | sed 's/../0x&,/g' | awk -F "," '{printf("%d",$1 * 257)}'`
  local BG_G=`echo $HEX_BG | sed 's/../0x&,/g' | awk -F "," '{printf("%d",$2 * 257)}'`
  local BG_B=`echo $HEX_BG | sed 's/../0x&,/g' | awk -F "," '{printf("%d",$3 * 257)}'`

  osascript <<EOF
tell application "iTerm2"
    tell current session of current window
        # set foreground color to {$FG_R, $FG_G, $FG_B}
        set background color to {$BG_R, $BG_G, $BG_B}
        # set transparency to "$OPACITY"
    end tell
end tell
EOF
}

set_name() {
  local NAME=$1

  osascript <<EOF
tell application "iTerm2"
    tell current session of current window
        set name to "$NAME"
    end tell
end tell
EOF
}

reset_colors() {
  set_color ffffff 000000 0
}

hpp() {
    set_color ffffff 330000 0
    set_name "PRODUCTION - Danger, Will Robinson!"
    heroku $@ --app kiwi-harvest
}

hps() {
    set_color ffffff 002900 0
    set_name "its only staging, you'll be fine"
    heroku $@ --app staging-harvest
}
