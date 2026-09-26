# The tap `seal-hq/tap` (repository seal-hq/homebrew-tap) is this
# directory. The archives are the ones install.sh fetches from seal.net
# (dev_runbook.md §6); the release writes each one's sha256 here from the
# SHA256SUMS published beside them.
class Seal < Formula
  desc "Large files and secrets between people and agents, never through the chat"
  homepage "https://seal.net/cli"
  version "1.4.0"

  on_macos do
    on_arm do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "5db6635bb7606a7ce215a68cba2fe9b0a12655e3b33963d5059ff7e26cc6f032"
    end
    on_intel do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "15ca43bdf15e1df92f472b72899cbd0717879a468d518a591ecb657bfe3383b0"
    end
  end

  on_linux do
    on_arm do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "27fb0a01af8aa28d21dda4cf5804cbb2c6ff39d6d3458bc456a687e2371f18f5"
    end
    on_intel do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e66ee3c9ecbe24b26a8583ccd4ec056d805b537f34f10b004c7f3442cca2f1c5"
    end
  end

  def install
    bin.install "seal"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seal --version")
  end
end
