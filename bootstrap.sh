#!/bin/sh

# set link for platform specific files
rm -f platform
if [[ `uname` -eq "Darwin" ]] ; then
    ln -s osx platform
else
    ln -s linux platform
fi

cd $HOME

files="\
aliases\
bash_profile\
bash_prompt\
bashrc\
bash_logout\
emacs\
emacs.d\
exports\
gitconfig\
hushlogin\
inputrc\
screenrc\
wgetrc"

for l in $files ; do
  if [[ -h .$l ]] ; then
    rm .$l
  elif [[ -f .$l || -d .$l ]] ; then
    mkdir -p tmp
    mv .$l tmp/
  fi
  ln -s dotfiles/.$l .$l
done

