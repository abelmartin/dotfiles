if [ -f ~/.profile_private ]; then
  source ~/.profile_private
fi

# Display the current git branch that you're working on.
export PS1='\[\033[00;35m\]\w\[\033[00m\][\d | \t]\[\033[01;33m\]`git branch 2>/dev/null|cut -f2 -d\* -s`\[\033[00m\]$ '

function gbda
{
  git branch -D $1
  git push origin --delete $1
}

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

function gpa()
{
  gp
  gph
}

#export MAGICK_HOME="/usr/local"
#PATH=/opt/local/bin:/opt/local/bin:/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/mongodb/bin:/opt/local/bin:/usr/local/git/bin:/usr/local/rvm/bin
export NODE_PATH=/usr/local/lib/node_modules



export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#export PATH=$PATH:/usr/local/opt/go/bin
#export GOPATH=/usr/local/opt/go/bin
#export GOBIN=/usr/local/opt/go/bin
