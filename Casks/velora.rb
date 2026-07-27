cask "velora" do
  version "0.10.18"
  sha256 "440c6823e96d4e00a7b09a2762366695b7eccf01e7c71ae91af9fb10bdfa2c5f"

  url "https://github.com/sushilk1991/velora/releases/download/v#{version}/Velora-#{version}.dmg"
  name "Velora"
  desc "Local-first, on-device dictation"
  homepage "https://github.com/sushilk1991/velora"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Velora.app"

  # First launch bootstraps the Python engine and downloads models (~6 GB) to
  # Application Support with visible progress; nothing here to pre-stage.
  zap trash: [
    "~/.velora",
    "~/Library/Application Support/Velora",
    "~/Library/Preferences/com.velora.app.plist",
  ]
end
