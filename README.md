# Bastion for Homebrew

```sh
brew install tacoda/bastion/bastion                     # the server and the CLI
brew install --cask tacoda/bastion/bastion  # Bastion.app, and bastion-desktop on the path
```

Bastion's stack runs on iii 0.25.0, installed on its own. The app is not signed
with a Developer ID yet, so the cask clears its quarantine mark after it installs
the app; the download is pinned to its signed checksum. Each release's formula and cask come from its signed `SHA256SUMS`, written by
`scripts/brew.sh` in [tacoda/bastion](https://github.com/tacoda/bastion).
