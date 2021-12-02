# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/ruby/bin:$PATH"

alias elastic_ec2="ssh -i ~/.ssh/id_mac_rsa ubuntu@ec2-13-209-4-11.ap-northeast-2.compute.amazonaws.com"

alias tunneling_db="echo connecting tunneling Database ....;ssh -i [PEM_KEY] -L [LOCAL_PORT]:[DATABASE_URL]:[DATABASE_PORT] [SSH_USER]@[SSH_HOSTNAME] -N"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PKG_CONFIG_ALLOW_CROSS=1
export EDITOR='vim'


plugins=(
  tmux
)
 
