#!/bin/bash

mkdir -p $HOME/Dev
cd $HOME/Dev
git clone --recursive https://github.com/jaagr/polybar.git
cd polybar
sudo ./build.sh -3 -p -n -m -c -i -I
