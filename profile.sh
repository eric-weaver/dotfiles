# Add Brew to path
if [[ -d /opt/homebrew/bin ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi
if [[ -d /opt/homebrew/sbin ]]; then
    export PATH="/opt/homebrew/sbin:$PATH"
fi

# Tab completion
[[ -f "${BREW_PREFIX}/opt/bash-completion/etc/bash_completion" ]] && source "${BREW_PREFIX}/opt/bash-completion/etc/bash_completion"
