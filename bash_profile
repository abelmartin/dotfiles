. ~/.bash/completion/git-completion.bash
. ~/.bash/aliases
. ~/.bash/config

test -f ~/.localrc  && . ~/.localrc
. ~/.profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*