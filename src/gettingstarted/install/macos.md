---
title: macOS
parent: Install
grand_parent: Getting started
nav_order: 0
---

# macOS

{: .note }
The macOS version is experimental 🚧

Albert is available via [homebrew](https://brew.sh/) tap.
The package is [built](https://github.com/albertlauncher/albert/actions/workflows/ci.yml)
and [hosted](https://github.com/albertlauncher/albert/releases) on GitHub.
The [homebrew tap](https://github.com/albertlauncher/homebrew-albert) 
provides a [cask](https://github.com/albertlauncher/homebrew-albert/blob/main/Casks/albert.rb) for Albert.
To install Albert via homebrew run the following commands:

```bash
brew tap albertlauncher/albert
brew update
brew install albert
```

`brew update` and `brew upgrade` will keep the app up to date.

Note that the packaged app is *not signed*. 
Read the caveats section of `brew install`.
For convenience the cask creates an ad-hoc signature and disables Gatekeeper for the app.
See the postflight section of the cask.
 