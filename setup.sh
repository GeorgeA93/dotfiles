#!/bin/bash

builddir=$HOME/dotfiles/config

# VIM
ln -svfn $builddir/vim ~/.vim
vim +PlugInstall +:qa > /dev/null 2>&1 # Install plugins

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

# OH MY ZSH only if it doesn't exist already
zsh_dir=$HOME/.oh-my-zsh
if [[ ! -d "$zsh_dir" ]]; then
  git clone https://www.github.com/robbyrussell/oh-my-zsh.git $zsh_dir
  TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
  if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
    chsh -s $(grep /zsh$ /etc/shells | tail -1)
  fi
fi
