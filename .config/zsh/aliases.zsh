# .config/zsh/aliases.zsh - Essential Aliases

# General shortcuts
alias l='ls'
alias ll='ls -al'

# Git essentials
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gcmam='git commit --amend'
alias gcmm='git commit -m'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdw='git diff --ignore-space-change'
alias gf='git fetch'
alias gl='git hist'
alias gmv='git mv'
alias gp='git push'
alias gpu='git pull'
alias grm='git rm'
alias gs='git status'
alias gst='git stash'
alias gt='git tag'
alias gundo='git reset --soft HEAD~1'

# Utilities
alias simplehttpserver='python3 -m http.server'
alias rsyncssh='rsync --archive --compress --progress --rsh=ssh'