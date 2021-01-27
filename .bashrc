source ~/.cargo/env
export PATH=$PATH:/usr/local/bin
alias ctags="`brew --prefix`/bin/ctags"
# alias jtags="ctags -R app config lib && sed -i '' -E '/^(if|switch|function|module\.exports|it|describe).+language:js$/d' tags"
alias jtags="ctags -R --exclude=node_modules --exclude=sql --exclude=build --exclude=config . && sed -i '' -E '/^(if|switch|function|module\.exports|it|describe).+language:js$/d' tags"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PKG_CONFIG_ALLOW_CROSS=1
export EDITOR='vim'
