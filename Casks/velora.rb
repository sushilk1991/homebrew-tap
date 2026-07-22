cask "velora" do
  version "0.10.14"
  sha256 "c795dbe7b440f4a4e4592b92ef4cb25edbe1eb6e0d83b2445702d5e062850eac"

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
