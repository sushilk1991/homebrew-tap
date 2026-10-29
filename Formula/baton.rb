# Render with scripts/homebrew-formula.sh; copy to homebrew-tap/Formula/baton.rb.
class Baton < Formula
  desc "Queue heavy jobs from agents and terminals on one machine"
  homepage "https://github.com/sushilk1991/baton"
  version "0.1.0"
  license "Apache-2.0"

  # Each host uses its cgo-free release archive and exact manifest digest.
  on_macos do
    on_arm do
      url "https://github.com/sushilk1991/baton/releases/download/v0.1.0/baton_darwin_arm64.tar.gz"
      sha256 "86e1d0bf4bd3104b197e4e7dfd04eeff702d331b410d6ae785a7c3909604c30c"
    end
    on_intel do
      url "https://github.com/sushilk1991/baton/releases/download/v0.1.0/baton_darwin_amd64.tar.gz"
      sha256 "15431a4cae58ea56db781c4c4819f4ccda86dfeffa011f5501f5e8506bfff749"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sushilk1991/baton/releases/download/v0.1.0/baton_linux_arm64.tar.gz"
      sha256 "613830cc758778c7ba15654dd1dd906f354527ee9ebe2dacd1287d32400d7b62"
    end
    on_intel do
      url "https://github.com/sushilk1991/baton/releases/download/v0.1.0/baton_linux_amd64.tar.gz"
      sha256 "9e00ef80b52a08fa69e62ae451af8a4afb49001a2d0c17f49ccfc4fde4097c02"
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
