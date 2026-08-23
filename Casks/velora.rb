cask "velora" do
  version "0.17.1"
  sha256 "db2e7019da3a856f0a1a299c12fc61dcb7a0e88091c6a536de6bbb2337e3e381"

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
