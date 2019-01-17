#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  cd /tmp
  git clone https://github.com/AuditeMarlow/base16-manager
  cd base16-manager
  sudo make install
fi

# Install base16 packages for theme
base16-manager install chriskempson/base16-shell
base16-manager install chriskempson/base16-vim
base16-manager install 0xdec/base16-rofi
base16-manager install chriskempson/base16-xresources

# Set the theme!
base16-manager set eighties
