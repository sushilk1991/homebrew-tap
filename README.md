# sushilk1991 Homebrew tap

## Velora

Homebrew cask for [Velora](https://github.com/sushilk1991/velora) — local-first,
on-device dictation for macOS.

```sh
brew install --cask sushilk1991/tap/velora
```

Or:

```sh
brew tap sushilk1991/tap
brew install --cask velora
```

Apple Silicon + macOS 14 (Sonoma) or later. The download is Developer ID-signed
and notarized, so it opens normally through Gatekeeper. First launch downloads
the speech and cleanup models (~6 GB) with visible progress; after that
everything runs offline.

## baton

Formula for [baton](https://github.com/sushilk1991/baton): queue heavy jobs
from every agent and terminal on one machine.

```sh
brew install sushilk1991/tap/baton
```

macOS and Linux, arm64 and amd64. Installs one binary and changes no agent or
shell settings.
