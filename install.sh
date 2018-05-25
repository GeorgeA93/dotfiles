#!/bin/bash

dir=~/dotfiles

# brew
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo -n "Install Brew? (y/n)? "
  read answer
  if echo "$answer" | grep -iq "^y" ;then
    brew tap homebrew/bundle
    cd brew
    brew bundle
    cd ..
  fi
fi

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

# kitty
echo -n "Configure Kitty? (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
  echo "Setting up kitty"
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    ln -svf $dir/kitty/kitty.conf ~/.config/kitty/kitty.conf
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    mkdir ~/Library/Preferences/kitty
    ln -svf $dir/kitty/kitty.conf ~/Library/Preferences/kitty/kitty.conf
  fi
fi

echo -n "Configure oh-my-zsh? (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
  echo "Installing oh-my-zsh"
  git clone https://www.github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
  if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
    chsh -s $(grep /zsh$ /etc/shells | tail -1)
  fi
fi

