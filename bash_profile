. ~/.bash/completion/git-completion.bash
. ~/.bash/aliases
. ~/.bash/config

test -f ~/.localrc  && . ~/.localrc
. ~/.profile

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="/Users/amartin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvmexport PATH="/usr/local/opt/mongodb@3.2/bin:$PATH"
