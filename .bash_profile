# General
export EDITOR=vim
set -o vi

# Search history
function hgrep() { history|`which grep` $@|grep -v hgrep; }
# Running processes
function psgrep() { ps -ef|`which grep` $@|grep -v hgrep; }

# Get aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Login local configuration and settings
if [ -f ~/.bash_login ]; then
  . ~/.bash_login
fi

# Non-login local configuration and settings
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.git-copmletion.bash ]; then
  . ~/.git-completion.bash
fi

function awsprofile() { export AWS_DEFAULT_PROFILE=$@; export AWS_PROFILE=$@; }
if command -v aws > /dev/null; then
  complete -C `which aws_completer` aws
fi

# Machine-specific setup below

# export PYTHONPATH=`brew --prefix`/lib/python2.7/site-packages:$PYTHONPATH

# eval "$(rbenv init -)"

export GOPATH=$(go env GOPATH)
export PATH=node_modules/.bin:$GOPATH/bin:$PATH:$HOME/bin
export AWS_PAGER=""
