#!/bin/bash

usage() {
  echo "Usage: setup.sh [-d] [-m]"
  exit 1
}

skip_deps=0
while getopts ":d:m:" o; do
  case "${o}" in
    d)
      skip_deps=$OPTARG
      ;;
    m)
      mode=$OPTARG
      ;;
    \?)
      usage
      ;;
  esac
done

if [[ -z "$mode" ]]; then
  usage
fi

./modes/loader.sh $mode $skip_deps
builddir=$HOME/dotfiles/build

# VIM
ln -svfn $builddir/vim ~/.vim
vim +PlugInstall +:qa # Install plugins

# I3
mkdir -p ~/.config
mkdir -p ~/.config/i3
ln -svf $builddir/i3/config ~/.config/i3/config

# ZSH
ln -svf $builddir/zsh/zshrc ~/.zshrc
ln -svf $builddir/zsh/aliases ~/.aliases
source ~/.zshrc

# TMUX
ln -svf $builddir/tmux/tmux ~/.tmux.conf

# GPG
mkdir -p ~/.gnupg
ln -svf $builddir/gpg/agentconf ~/.gnupg/gpg-agent.conf

# GIT
ln -svf $builddir/git/gitconfig ~/.gitconfig


# OH MY ZSH
git clone https://www.github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
  chsh -s $(grep /zsh$ /etc/shells | tail -1)
fi
