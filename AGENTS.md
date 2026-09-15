# sushilk1991/tap

Cask: `Casks/velora.rb`. Token `brew` commands load `$(brew --repo sushilk1991/tap)`, a different clone than a git worktree of this repo.

## Commands

```sh
brew style --except-cops=Style/FrozenStringLiteralComment ./Casks/velora.rb
brew fetch --cask sushilk1991/tap/velora
brew livecheck --cask sushilk1991/tap/velora
brew audit --cask --strict --online --git sushilk1991/tap/velora
```

`brew style --cask ./Casks/velora.rb` and `brew audit ./Casks/velora.rb` are rejected: this tree is not the installed tap. Style this tree by file path (drop `--cask`; keep the `except-cops` flag or RuboCop demands a frozen-string comment Homebrew casks do not use). Fetch, livecheck, and audit take the token.

## Version bump

Change only `version` and `sha256` in `Casks/velora.rb`. Commit subject: `Update Velora to <version>`.

```sh
shasum -a 256 path/to/Velora-<version>.dmg
```

Write that digest into `sha256`. Keep the existing `url` interpolation.

## Guardrails

- Style this tree with the file-path command. Run fetch/livecheck/audit by token only when `$(brew --repo sushilk1991/tap)/Casks/velora.rb` matches this file.
- Edit `Casks/velora.rb` in this git checkout. `brew bump-cask-pr` writes the installed tap and opens a PR from there.
- Keep `sha256` as a hex digest from `shasum -a 256` of that version's `.dmg`.

## Done

All four commands above. Style: `1 file inspected, no offenses detected`. Fetch: `✔︎ Cask velora (<version>)`. Livecheck: `velora: <version> ==> <version>`. Audit: silent, exit 0.

## Maintaining this file

Keep this file for knowledge useful to almost every future agent session in this project.
Do not repeat what the codebase already shows; point to the authoritative file or command instead.
Prefer rewriting or pruning existing entries over appending new ones.
When updating this file, preserve this bar for all agents and keep entries concise.
