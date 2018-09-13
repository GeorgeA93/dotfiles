#!/bin/sh
export DOTFILES=$HOME/dotfiles
modedir=$DOTFILES/modes
modulebase=$DOTFILES/modules
modename="$1"
skip_deps="$2"
os=""

build=$DOTFILES/build
vimrc=$build/vim/vimrc
vimplugins=$build/vim/vimplugins
tmux=$build/tmux/tmux
zshrc=$build/zsh/zshrc
aliases=$build/zsh/aliases
brewfile=$build/brew/Brewfile
aptfile=$build/apt/aptfile
aptrepos=$build/apt/aptrepos
agentconf=$build/gpg/agentconf
gitconfig=$build/git/gitconfig

setup_build_output() {
  mkdir -p $build
  mkdir -p $build/vim
  mkdir -p $build/vim/swapfiles
  mkdir -p $build/tmux
  mkdir -p $build/zsh
  mkdir -p $build/brew
  mkdir -p $build/apt
  mkdir -p $build/gpg
  mkdir -p $build/git

  setup_config_file $vimrc
  setup_config_file $tmux
  setup_config_file $zshrc
  setup_config_file $brewfile
  setup_config_file $aptfile
  setup_config_file $aptrepos
  setup_config_file $agentconf
  setup_config_file $gitconfig
}

setup_config_file() {
  rm $1
  touch $1
}

determine_os() {
  case "$OSTYPE" in
    solaris*) os="SOLARIS" ;;
    darwin*)  os="OSX" ;;
    linux*)   os="LINUX" ;;
    bsd*)     os="BSD" ;;
    msys*)    os="WINDOWS" ;;
    *)        os="unknown: $OSTYPE" ;;
  esac
}

run_scripts() {
  dir=$1
  $dir/*.sh 2> /dev/null
}

concat_config() {
  dir=$1
  extension=$2
  destination=$3
  sources=$dir/*$extension
  if [ $(ls $sources 2> /dev/null | wc -c) -ne 0 ]; then
    cat $sources >> $destination
  fi
}

determine_os

echo "Loading $modename mode for $os"

setup_build_output

while read -r line
do
    modulename="$line"
    moduledir="$modulebase/$modulename"
    echo "Building module $modulename"

    run_scripts $moduledir

    concat_config $moduledir vim $vimrc
    concat_config $moduledir vimplug $vimplugins
    concat_config $moduledir tmux $tmux
    concat_config $moduledir zsh $zshrc
    concat_config $moduledir aliases $aliases
    concat_config $moduledir brew $brewfile
    concat_config $moduledir apt $aptfile
    concat_config $moduledir apt-repos $aptrepos
    concat_config $moduledir gpg $agentconf
    concat_config $moduledir git $gitconfig
done < "$modedir/$modename"

if [ "$skip_deps" -eq "0" ]; then
  ./modes/dependencies.sh
else
  echo "Skipping dependencies"
fi

