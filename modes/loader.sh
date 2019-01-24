#!/bin/bash

export DOTFILES=$HOME/dotfiles
modedir=$DOTFILES/modes
modulebase=$DOTFILES/modules
modename="$1"
skip_deps="$2"
only_changed="$3"
os=""

build=$DOTFILES/build
vimrc=$build/vim/vimrc
i3=$build/i3/config
polybar=$build/polybar/config
vimplugins=$build/vim/vimplugins
tmux=$build/tmux/tmux
zshrc=$build/zsh/zshrc
aliases=$build/zsh/aliases
brewfile=$build/brew/Brewfile
aptfile=$build/apt/aptfile
aptrepos=$build/apt/aptrepos
agentconf=$build/gpg/agentconf
gitconfig=$build/git/gitconfig

hot_build_path_for_ext() {
  case "$1" in
    vim)
      hot_build_path=$vimrc
      ;;
    i3)
      hot_build_path=$i3
      ;;
    polybar)
      hot_build_path=$polybar
      ;;
    vimplug)
      hot_build_path=$vimplugins
      ;;
    tmux)
      hot_build_path=$tmux
      ;;
    zsh)
      hot_build_path=$zshrc
      ;;
    gpg)
      hot_build_path=$agentconf
      ;;
    git)
      hot_build_path=$gitconfig
      ;;
    aliases)
      hot_build_path=$aliases
      ;;
    *)
      echo $"Extension $1 not found. Quiting"
      exit 1
  esac
}

setup_build_output() {
  mkdir -p $build
  mkdir -p $build/vim
  mkdir -p $build/vim/swapfiles
  mkdir -p $build/i3
  mkdir -p $build/polybar
  mkdir -p $build/tmux
  mkdir -p $build/zsh
  mkdir -p $build/brew
  mkdir -p $build/apt
  mkdir -p $build/gpg
  mkdir -p $build/git

  setup_config_file $vimrc
  setup_config_file $i3
  setup_config_file $polybar
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

  private_extension=$extension.private
  private_sources=$dir/*$private_extension
  if [ $(ls $private_sources 2> /dev/null | wc -c) -ne 0 ]; then
    cat $private_sources >> $destination
  fi
}

determine_os

echo "Loading $modename mode for $os"

# This reloads only changed files e.g. if you only change vimrc or i3 config you
# don't want to relaod everything else. The caveat thus far is that it won't
# reload any dependencies e.g. if you add a new apt dependency you will need to
# re-run the whole setup to get that loaded properly.
if [ "$only_changed" -eq "1" ]; then
  printf "Only building changed files\n"

  changed_files=$(git diff --name-only | grep modules)
  printf "\nFiles that have changed: \n$changed_files \n\n"

  for changed_file in $changed_files
  do
    extension=$(echo $changed_file | cut -d '.' -f 2)
    hot_build_path_for_ext $extension
    grep -vxf $hot_build_path $changed_file > $hot_build_path
  done

  exit
fi

setup_build_output

while read -r line
do
    modulename="$line"
    moduledir="$modulebase/$modulename"
    echo "Building dependencies for module $modulename"

    concat_config $moduledir brew $brewfile
    concat_config $moduledir apt $aptfile
    concat_config $moduledir apt-repos $aptrepos
done < "$modedir/$modename"

if [ "$skip_deps" -eq "0" ]; then
  ./modes/dependencies.sh
else
  echo "Skipping dependencies"
fi

while read -r line
do
    modulename="$line"
    moduledir="$modulebase/$modulename"
    echo "Building module $modulename"

    concat_config $moduledir vim $vimrc
    concat_config $moduledir i3 $i3
    concat_config $moduledir polybar $polybar
    concat_config $moduledir vimplug $vimplugins
    concat_config $moduledir tmux $tmux
    concat_config $moduledir zsh $zshrc
    concat_config $moduledir aliases $aliases
    concat_config $moduledir gpg $agentconf
    concat_config $moduledir git $gitconfig

    run_scripts $moduledir
done < "$modedir/$modename"
