export TERM=xterm-256color

BASE16_SHELL=$HOME/.base16-manager/chriskempson/base16-shell
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
