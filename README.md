## On a fresh Mavericks install...

### Move existing files to ./.old_dotfiles
```bash
mkdir .old_dotfiles
mv .bash_profile .old_dotfiles/
mv .bashrc .old_dotfiles/
mv .profile .old_dotfiles/
```

### Start a symlinking party!
```bash
ln -s dotfiles/bash .bash
ln -s dotfiles/bash_profile .bash_profile
ln -s dotfiles/profile .profile
ln -s dotfiles/bashrc .bashrc
ln -s dotfiles/inputrc .inputrc
ln -s dotfiles/ackrc .ackrc
```