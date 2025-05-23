# .config/zsh/functions.zsh - Helper Functions

# Search history
function hgrep() { 
  history | grep "$@" | grep -v hgrep
}

# Search running processes
function psgrep() { 
  ps -ef | grep "$@" | grep -v grep
}

# Tmux session management
function tm() {
  if [[ -z "$1" ]]; then
    # No argument: attach or create default session
    tmux attach || tmux new -s main
  else
    # Create new session with specified name
    tmux new -s "$1"
  fi
}