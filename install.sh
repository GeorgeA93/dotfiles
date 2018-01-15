#!/bin/bash

dir=~/dotfiles

# Vim
echo "Setting up vim"
ln -svfh $dir/vim ~/.vim
ln -svf $dir/vim/vimrc ~/.vimrc
vim +PlugInstall +:qa # Install plugins

# zsh
echo "Setting up zsh"
ln -svf $dir/zsh/zshrc ~/.zshrc
ln -svf $dir/zsh/aliases ~/.aliases

echo "Installing oh-my-zsh"
git clone https://www.github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
  chsh -s $(grep /zsh$ /etc/shells | tail -1)
fi
