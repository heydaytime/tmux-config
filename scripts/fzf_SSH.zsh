#!/bin/bash

# File path to your SSH config
SSH_CONFIG=~/.ssh/config


commands=$(
awk '
  /^Host / {
    host = $2
  }
  /HostName/ {
    hostname = $2
    if (host && hostname) {
      command = "ssh " host "@" hostname
      print command
      host = ""
      hostname = ""
    }
  }
' "$SSH_CONFIG")

# Use fzf to let the user select a command, and then execute it
selected_command=$(echo "$commands" | fzf)
# If a command is selected, execute it
if [[ -n "$selected_command" ]]; then
    server_name=$(echo "$selected_command" | awk -F'@' '{print $2}')
    eval tmux rename-window "$server_name"
    eval "$selected_command"
    eval tmux kill-window
else
   tmux kill-window 
fi
