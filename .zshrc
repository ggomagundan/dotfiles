# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
eval "$(pyenv init -)"

eval "$(starship init zsh)"

alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
