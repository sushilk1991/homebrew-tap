cask "velora" do
  version "0.10.17"
  sha256 "ce7237d45332755e1d07ead8cae08482f5598cad5bd823c96a63407d46e7eeb9"

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
