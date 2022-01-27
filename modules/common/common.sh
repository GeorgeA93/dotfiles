#!/bin/bash

curl -fLo $HOME/dotfiles/build/vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

touch $HOME/dotfiles/modules/common/common.tmux.private

mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

mkdir -p $HOME/dotfiles/build/vim/swapfiles
