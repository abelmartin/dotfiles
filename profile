if [ -f ~/.profile_private ]; then
  source ~/.profile_private
fi

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias r187='rvm ruby-1.8.7-p334' #An easy way to use the version of 1.8.7 that i've already started working with

# Display the current git branch that you're working on.
export PS1='\[\033[00;35m\]\w\[\033[00m\][\d | \t]\[\033[01;33m\]`git branch 2>/dev/null|cut -f2 -d\* -s`\[\033[00m\]$ '

# Apache
alias apars='sudo apachectl graceful' #Graceful Apache restart
alias apast='sudo apachectl stop'
alias apago='sudo apachectl start'
alias apaec='sudo mvim /etc/apache2/httpd.conf'
alias apate='tail -f /private/var/log/apache2/error_log'
alias apatl='tail -f /private/var/log/apache2/access_log'

# Untaring.  I hate forgetting this command.  now I won't. :)
function utar
{
  dest='./'
  if [ $2 ] ; then 
    dest="$2"
    if [ -d $dest ]; then 
      echo "DIRECTORY $dest EXISTS"
    else
      echo "CREATING DIRECTORY $dest"
      mkdir -p $dest
    fi
  fi

#Finally, we perform the un-taring
  tar -C $dest -zxvf $1
  echo "UNTARRED $1 INTO $dest"
}

# Memcache
alias memgo='memcached -d -p 22212'
alias memst='memcached --stop'

# Sphinx
alias srcgo='sudo searchd -c /usr/local/sphinx/etc/sphinx_localhost.conf'
alias srcst='sudo searchd --stop -c /usr/local/sphinx/etc/sphinx_localhost.conf' #Now you can start searchd AFTER you you perform step #1. STEP #2
alias idxgo='sudo indexer --all -c /usr/local/sphinx/etc/sphinx_localhost.conf' #You must run this with searchd off. STEP #1
alias idxro='sudo indexer --rotate --all -c /usr/local/sphinx/etc/sphinx_localhost.conf' #Rotate actions are only allowed when searchd is running.

# Git
alias gl='git log -p --raw --summary --color -B -M --ignore-space-at-eol -b --ignore-space-change -w --ignore-all-space'
alias gs='git status -s'
alias gd='git diff'
alias gdc='git diff --cached'
alias gac='git add -A; git commit -m'
alias gpo='git push origin'
alias gpob="git push origin `git branch 2>/dev/null|cut -f2 -d\* -s|sed -e "s/^ *//g;"`"
alias gco='git checkout'
alias gcom='gco master'

#If I'm just commiting before pushing the code up, I want to do all of it in 1 action.
function gacp()
{
  git add -A; 
  git commit -m "$1";
  git push;
}

#I don't delete tags often...but when I do, I use this.
function gdt()
{
  git push origin :refs/tags/$1;
}

#Creates a new Git branch, pushes it to the remote repo, and checks it out.
function gcn()
{
  git branch $1;
  git push origin $1;
  git branch --set-upstream $1 origin/$1;
  git checkout $1;
}

#Checks out an exising Git remote branch, pushes it to the remote repo, and checks it out.
function gce()
{
  git checkout --track -b $1 origin/$1;
}

# Rails
alias rc='rails console'
alias rss='rails console --sandbox'

# Bash
alias cdu='cd ..' #An easy way to move up in a directory
alias ll='ls -laFGh'
alias llg='ls -laFOG | xargs -0 grep -n'
alias prf='sudo mvim ~/.profile'
alias srl='source ~/.profile && echo shell reloaded'
alias psg='ps aux | grep' #Checking for processes made easy
alias ulct='/usr/libexec/locate.updatedb' #Updates the 'locate' database on command.  This should happen automatically, but JIC.
alias faf="find . -type f -iname "

#Easily run PRY with your rails env
alias pryr='pry -r ./config/environment'

export MAGICK_HOME="/usr/local"
PATH=/opt/local/bin:/opt/local/bin:/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/mongodb/bin:/opt/local/bin:/usr/local/git/bin:/usr/local/rvm/bin
export NODE_PATH=/usr/local/lib/node_modules

#Make pushing to heroku easy
alias gph='git push heroku'

# Deploys whatever branch you're currently in to staging.  The 'sed' command at the end strips out the leading space from the 'cut' command
alias cds='cap deploy DEPLOY="staging" BRANCH="`git branch 2>/dev/null|cut -f2 -d\* -s|sed -e "s/^ *//g;"`"'
alias cdp='env DEPLOY='PRODUCTION' cap deploy'
