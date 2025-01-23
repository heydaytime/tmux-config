#!/bin/bash

# File path to your SSH config
SSH_CONFIG=~/.ssh/config

# Parse the SSH config to extract Host, HostName, and IdentityFile
commands=$(awk '
  /^Host / { 
    host = $2 
  }
  /HostName / { 
    hostname = $2 
  }
  /IdentityFile / { 
    identity = $2 
    if (host && hostname && identity) {
      print "ssh -i " identity " " host "@" hostname
      host = ""
      hostname = ""
      identity = ""
    }
  }
' "$SSH_CONFIG")

# Use fzf to let the user select a command, and then execute it
selected_command=$(echo "$commands" | fzf)

# If a command is selected, execute it
if [[ -n "$selected_command" ]]; then
    eval "$selected_command"
else
   tmux kill-window 
fi
