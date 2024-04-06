#! /usr/bin/env bash

base="#f7820c"
surface="#f7820c"
overlay="#f7820c"
muted="#f7820c"
subtle="#f7820c"
text="#f7820c"
love="#f7820c"
gold="#f7820c"
rose="#f7820c"
pine="#f7820c"
foam="#f7820c"
iris="#c4a7e7"
highlight_low="#f7820c"
highlight_med="#f7820c"
highlight_high="#f7820c"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"
   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

# Status
set "status" "on"
set "monitor-activity" "on"
set "status-justify" "left"
set "status-position" "bottom"
set "status-left-length" "100"
set "status-right-length" "100"
set "status-style" "fg=$iris,bg=$base,bold"

rosepine_time_format=$(get "@time_format" "%R")
rosepine_date_format=$(get "@date_format" "%d/%m/%Y")

datetime_block="#[fg=$gold,bg=$base] ${rosepine_time_format} ${rosepine_date_format}"
host_block="#[fg=$iris,bg=$base] #h "
set "status-right" "${datetime_block} ${host_block}"
set "status-left" "#[fg=$iris,bg=$base] #S "

setw "window-status-separator" ""
setw "window-status-style" "fg=$rose,bg=$base"
setw "window-status-current-style" "fg=$love,bg=$base"
setw "window-status-activity-style" "fg=$base,bg=$rose"
set "window-status-format" "#[fg=$rose,bg=$base] #I: #W "
set "window-status-current-format" "#[fg=$love,bg=$base] #I: #W "

# Pane
set "pane-border-style" "fg=$highlight_low"
set "pane-active-border-style" "fg=$highlight_high"
set "display-panes-colour" "$text"
set "display-panes-active-colour" "$gold"

# Message
set "message-style" "fg=$base,bg=$gold"
set "message-command-style" "fg=$base,bg=$gold"
