# The tap `seal-hq/tap` (repository seal-hq/homebrew-tap) is this
# directory. The archives are the ones install.sh fetches from seal.net
# (dev_runbook.md §6); the release writes each one's sha256 here from the
# SHA256SUMS published beside them.
class Seal < Formula
  desc "Large files and secrets between people and agents, never through the chat"
  homepage "https://seal.net/cli"
  version "2.5.6"

  on_macos do
    on_arm do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f4b09e5cec213fc59d9c1bb346fcc3082463fc4f293f45eee601045627db1591"
    end
    on_intel do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "abbb6f9ba3a2c9c46661ea2a8e330c6ea5e65be7bd4c10dd7d7e9134713e5464"
    end
  end

  on_linux do
    on_arm do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cc5cff9c2c70fac35daf4cd6490507a1704b2b3fccf2b03d937b0ec37c4e5740"
    end
    on_intel do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eebf62e0820f98b4efe94b3ff0f3b415be41f155bf471a9331dc59b96d26afde"
    end
  end

  def install
    bin.install "seal"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seal --version")
  end
end
