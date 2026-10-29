# Render with scripts/homebrew-formula.sh; copy to homebrew-tap/Formula/baton.rb.
class Baton < Formula
  desc "Queue heavy jobs from agents and terminals on one machine"
  homepage "https://github.com/sushilk1991/baton"
  license "Apache-2.0"

  # Each host uses its cgo-free release archive and exact manifest digest.
  on_macos do
    on_arm do
      url "https://github.com/sushilk1991/baton/releases/download/v0.1.1/baton_darwin_arm64.tar.gz"
      sha256 "3104f0e49a7f26a9ab2299b3e7f068c2dbb9b57b3cba079e666aefec5e657457"
    end
    on_intel do
      url "https://github.com/sushilk1991/baton/releases/download/v0.1.1/baton_darwin_amd64.tar.gz"
      sha256 "53739fcf23c04adac36ce28863f6acf92de559feeb866ce5c410e05756f1a196"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sushilk1991/baton/releases/download/v0.1.1/baton_linux_arm64.tar.gz"
      sha256 "07dc0ae4a7526471e6421bf107d6f4ea4de6599586948318ddef1140ead736ff"
    end
    on_intel do
      url "https://github.com/sushilk1991/baton/releases/download/v0.1.1/baton_linux_amd64.tar.gz"
      sha256 "e4a782b1474ecc6d63981c5f1546cd1d2b2a8f94f158aac2bfb8199018f63599"
    end
  end

  # Install one binary; the formula never modifies agent or shell settings.
  def install
    bin.install "baton"
  end

  # Use private test paths and real command execution without pressure admission.
  test do
    ENV.keys.grep(/^XDG_/).each { |key| ENV[key] = (testpath/key).to_s }
    ENV["HOME"] = testpath.to_s
    ENV["USERPROFILE"] = testpath.to_s
    %w[XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_STATE_HOME
       XDG_RUNTIME_DIR XDG_CONFIG_DIRS XDG_DATA_DIRS].each do |key|
      ENV[key] = (testpath/key).to_s
    end
    ENV["BATON"] = "off"
    assert_match "Usage: baton", shell_output("#{bin}/baton help")
    assert_equal "baton-test\n", shell_output("#{bin}/baton run -- /bin/echo baton-test")
  end
end
