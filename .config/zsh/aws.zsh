# .config/zsh/aws.zsh - AWS Configuration

# Disable AWS pager for cleaner output
export AWS_PAGER=""

# Simplified AWS profile switcher
function awsp() {
  if [[ -z "$1" ]]; then
    echo "Current AWS Profile: ${AWS_PROFILE:-default}"
    echo "Available profiles:"
    aws configure list-profiles 2>/dev/null | sed 's/^/  /'
  else
    export AWS_PROFILE="$1"
    echo "Switched to AWS profile: $1"
  fi
}

# Show current AWS profile info
function awsinfo() {
  echo "Profile: ${AWS_PROFILE:-default}"
  echo "Region:  ${AWS_DEFAULT_REGION:-$(aws configure get region)}"
  echo "Account: $(aws sts get-caller-identity --query Account --output text 2>/dev/null || echo 'Unknown')"
}