#!/bin/zsh

PREZTO_HOME=~/Code/prezto
PREZTO_REPO=https://github.com/bdhess/prezto 

if [ -d $PREZTO_HOME ]; then
  pushd $PREZTO_HOME
  git pull --rebase origin master
  git submodule update --recursive
  popd
else
  git clone --recursive $PREZTO_REPO $PREZTO_HOME
  ln -fs $PREZTO_HOME "${ZDOTDIR:-$HOME}/.zprezto"
fi

setopt EXTENDED_GLOB
for rcfile in "${PREZTO_HOME}"/runcoms/^README.md(.N); do
  ln -fs "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

sudo chsh -s /bin/zsh $USER
