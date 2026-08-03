cask "velora" do
  version "0.11.0"
  sha256 "ca853dc9362d400ba5fb5175094608af0bd22ff9ca4628bc615ead9ce08d8deb"

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
    "~/Library/Application Support/Sublime Text/Packages/VeloraVoiceEdit",
    "~/Library/Application Support/Velora",
    "~/Library/Preferences/com.velora.app.plist",
  ]
end
