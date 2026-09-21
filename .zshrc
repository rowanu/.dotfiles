autoload -Uz compinit && compinit
setopt auto_cd
setopt hist_ignore_all_dups     # drop older duplicates, keep history clean
setopt hist_ignore_space        # commands starting with a space aren't recorded
setopt hist_reduce_blanks       # normalise whitespace before saving
setopt hist_verify              # expand !! etc. onto the line instead of running blind
setopt append_history           # append to file, don't overwrite
setopt inc_append_history       # write each command immediately (crash-safe)
unsetopt share_history          # bash-like: do NOT import other sessions' commands
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
bindkey '^R' history-incremental-search-backward

# Environment
export EDITOR=nvim
export VISUAL=nvim
bindkey -v '^?' backward-delete-char
bindkey -M viins 'jk' vi-cmd-mode

# Homebrew setup
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f "/usr/local/bin/brew" ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Load configuration modules
[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh
[[ -f ~/.config/zsh/functions.zsh ]] && source ~/.config/zsh/functions.zsh
[[ -f ~/.config/zsh/aws.zsh ]] && source ~/.config/zsh/aws.zsh
[[ -f ~/.config/zsh/prompt.zsh ]] && source ~/.config/zsh/prompt.zsh
[[ -f ~/.config/zsh/local.zsh ]] && source ~/.config/zsh/local.zsh

# Node.js
eval "$(fnm env --use-on-cd --shell zsh)"

# Python (pyenv)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# AWS CLI completion
if command -v aws >/dev/null 2>&1; then
  autoload bashcompinit && bashcompinit
  autoload -Uz compinit && compinit
  complete -C "$(which aws_completer)" aws
fi
