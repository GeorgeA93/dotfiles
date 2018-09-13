# dotfiles

Install with:

```
git clone https://github.com/GeorgeA93/dotfiles.git
cd dotfiles
./setup.sh -m <mode>
```

To ignore deps use:

`./setup.sh -m <mode> -d 1`

If you need private stuff. Stick it in `modules/<module>/<module>.<type>.private` and it will be sourced for you.

`sandbox-create` will create a docker container environment for sandbox/development use.
`sandbox` will connect you to said container
