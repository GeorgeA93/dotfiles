#!/bin/bash

export DOTFILES=$HOME/dotfiles
modedir=$DOTFILES/modes
modulebase=$DOTFILES/modules
modename="$1"
skip_deps="$2"
skip_scripts="$3"
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

build_output_files=(
  $vimrc $i3 $polybar
  $vimplugins $tmux $zshrc
  $aliases $brewfile $aptfile
  $aptrepos $agentconf $gitconfig
)

scripts_to_run=()

setup_build_output() {
  for build_output_file in ${build_output_files[@]}; do
    rm $build_output_file

    dir=$(dirname $build_output_file)
    mkdir -p $dir
    touch $build_output_file
  done
}

build_path_for_ext() {
  case "$1" in
    vim) build_path=$vimrc ;;
    i3) build_path=$i3 ;;
    polybar) build_path=$polybar ;;
    vimplug) build_path=$vimplugins ;;
    tmux) build_path=$tmux ;;
    zsh) build_path=$zshrc ;;
    gpg) build_path=$agentconf ;;
    git) build_path=$gitconfig ;;
    aliases) build_path=$aliases ;;
    brew) build_path=$brewfile ;;
    apt) build_path=$aptfile ;;
    apt-repos) build_path=$aptrepos ;;
    *) build_path=
      echo $"Extension $1 not found. Quitting"
      exit 1
  esac
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
  if [ "$skip_scripts" -eq "0" ]; then
    for script in ${scripts_to_run[@]}; do
      $script 2> /dev/null
    done
  else
    echo "Not running scripts. Skipping"
  fi
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

build() {
  while read -r line; do
    modulename="$line"
    moduledir="$modulebase/$modulename"
    echo "Building module $modulename"

    module_extensions=$(find $moduledir -not -path '*.sh' | cut -d '.' -f 2 -s | sort | uniq)

    for module_extension in ${module_extensions[@]}; do
      build_path_for_ext $module_extension
      concat_config $moduledir $module_extension $build_path
    done

    scripts=$(find $moduledir -name "*.sh")
    scripts_to_run+=( $scripts )
  done < "$modedir/$modename"
}

install_deps() {
  if [ "$skip_deps" -eq "0" ]; then
    ./modes/dependencies.sh
  else
    echo "Not install dependencies. Skipping"
  fi
}

determine_os
echo "Loading $modename mode for $os"
setup_build_output
build
install_deps
run_scripts
