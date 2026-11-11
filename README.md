# Bastion for Homebrew

```sh
brew install tacoda/bastion/bastion                     # the server and the CLI
brew install --cask --no-quarantine tacoda/bastion/bastion  # Bastion.app, which holds them too
```

Bastion's stack runs on iii 0.25.0, installed on its own. The app is not signed
with a Developer ID yet, so the cask needs `--no-quarantine`, or one right-click
Open. Each release's formula and cask come from its signed `SHA256SUMS`, written by
`scripts/brew.sh` in [tacoda/bastion](https://github.com/tacoda/bastion).
