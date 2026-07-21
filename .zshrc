autoload -Uz compinit && compinit
setopt auto_cd
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history
setopt append_history
HISTSIZE=10000
SAVEHIST=10000
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
