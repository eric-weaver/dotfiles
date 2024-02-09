export EDITOR='subl -w'

# Add Brew to path
if [[ -d /opt/homebrew/bin ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi
if [[ -d /opt/homebrew/sbin ]]; then
    export PATH="/opt/homebrew/sbin:$PATH"
fi

# Cache brew prefix
BREW_PREFIX=$(brew --prefix)

# Tab completion
[[ -f "${BREW_PREFIX}/opt/bash-completion/etc/bash_completion" ]] && source "${BREW_PREFIX}/opt/bash-completion/etc/bash_completion"

function epoch-to-human ()
{
  EPOCH="$1";
  if [ -n "$EPOCH" ]; then
      echo "$(gdate -d @"${EPOCH:0:10}" --utc --iso=s | cut -d '+' -f 1).${EPOCH:10}+00:00"
  fi
}

function utc-now {
   gdate -u +%FT%TZ
}

function sdiff-curl {
  sdiff -s <(curl -sfS "$1") <(curl -sfS "$2")
}

function sdiff-curl-jq {
  sdiff -s <(curl -sfS "$1" | jq .) <(curl -sfS "$2" | jq .)
}

alias docker-clean='docker rm $(docker stop $(docker ps -aq))'

# jenv
if type -p jenv > /dev/null 2>&1; then
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
fi

# pyenv
if type -p pyenv > /dev/null 2>&1; then
    eval "$(pyenv init -)"
    type -p pyenv-virtualenv-init > /dev/null 2>&1 && eval "$(pyenv virtualenv-init -)"
fi
