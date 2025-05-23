# .config/zsh/prompt.zsh - Simple Prompt with AWS Info

# Enable git info in prompt
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst

# Configure git info format
zstyle ':vcs_info:git:*' formats ' (%b)'
zstyle ':vcs_info:*' enable git

# AWS profile info for prompt
aws_prompt_info() {
  if [[ -n "$AWS_PROFILE" ]]; then
    echo " ☁️ $AWS_PROFILE"
  fi
}

# Simple, clean prompt
PROMPT='%F{blue}%n@%m%f %F{yellow}%~%f%F{green}${vcs_info_msg_0_}%f%F{cyan}$(aws_prompt_info)%f
%F{white}❯%f '