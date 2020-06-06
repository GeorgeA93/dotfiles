export ZSH=$HOME/.oh-my-zsh
export DOTFILES=$HOME/dotfiles
export EDITOR='vim'

ZSH_THEME="refined"
KEYTIMEOUT=1

source ~/.aliases

export PATH=""
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/sbin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$DOTFILES/bin"
export PATH="$PATH:/usr/local/sbin"

source $ZSH/oh-my-zsh.sh
