# Velora Homebrew tap

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
