#!/bin/bash

dir=~/dotfiles

# Vim
echo "Setting up vim"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  ln -svf $dir/vim ~/.vim
elif [[ "$OSTYPE" == "darwin"* ]]; then
  ln -svfh $dir/vim/vimrc ~/.vimrc
fi
vim +PlugInstall +:qa # Install plugins

# zsh
echo "Setting up zsh"
ln -svf $dir/zsh/zshrc ~/.zshrc
ln -svf $dir/zsh/aliases ~/.aliases

# tmux
echo "Setting up tmux"
ln -svf $dir/tmux/tmuxconf ~/.tmux.conf

echo "Installing oh-my-zsh"
git clone https://www.github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
  chsh -s $(grep /zsh$ /etc/shells | tail -1)
fi
