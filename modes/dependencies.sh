#!/bin/sh

builddir=$DOTFILES/build

install_brew() {
  echo "Installing brew dependencies"

  brew tap homebrew/bundle
  brew bundle --file=$builddir/brew/Brewfile
}

install_apt() {
  echo "Installing apt dependencies"

  sudo apt-get install $(awk '{print $1'} $builddir/apt/aptfile)
}

install_yum() {
  echo "Installing yum dependencies"
}


if [ -n "$(which brew)" ]; then
  install_brew
elif [ -n "$(which apt)" ]; then
  install_apt
elif [ -n "$(which yum)" ]; then
  install_yum
fi
