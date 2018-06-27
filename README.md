# dotfiles

Install with:

```
git clone https://github.com/GeorgeA93/dotfiles.git
cd dotfiles
install.sh
```

If you need private stuff. Stick it in `~/.private-env` and it will be sourced for you.

For private tmux configuration. e.g. keybindings on a specific machine, place it inside /tmux/tmuxconf.private and it will be source automagically by tmux.

`sandbox-create` will create a docker container environment for sandbox/development use.
`sandbox` will connect you to said container
