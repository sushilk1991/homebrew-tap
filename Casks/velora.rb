cask "velora" do
  version "0.33.0"
  sha256 "a73ca5747f01c88375ec706a44610b137d40d4ecf95f1379f5737b36b61b4dba"

  url "https://github.com/sushilk1991/velora/releases/download/v#{version}/Velora-#{version}.dmg"
  name "Velora"
  desc "Local-first, on-device dictation"
  homepage "https://github.com/sushilk1991/velora"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Velora.app"

  # First launch bootstraps the Python engine and downloads models (~6 GB) to
  # Application Support with visible progress; nothing here to pre-stage.
  zap trash: [
    "~/.velora",
    "~/Library/Application Support/Sublime Text/Packages/VeloraVoiceEdit",
    "~/Library/Application Support/Velora",
    "~/Library/Preferences/com.velora.app.plist",
  ]
end
