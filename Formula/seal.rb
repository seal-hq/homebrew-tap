# The tap `seal-hq/tap` (repository seal-hq/homebrew-tap) is this
# directory. The archives are the ones install.sh fetches from seal.net
# (dev_runbook.md §6); the release writes each one's sha256 here from the
# SHA256SUMS published beside them.
class Seal < Formula
  desc "Large files and secrets between people and agents, never through the chat"
  homepage "https://seal.net/cli"
  version "2.1.0"

  on_macos do
    on_arm do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "33fd17d1824965eea3c736d999d8a6192c9ab7fd3cc2f8fe4a43d1959e882e79"
    end
    on_intel do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "31770a3da76e5187e9ddce937b3bc7b299c699c488e9ce7674a116e1e186f054"
    end
  end

  on_linux do
    on_arm do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d026471c79939647607f9a88072b162a36bc70a0e95c16d4745b5b494f7ca30"
    end
    on_intel do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af6dc951c960bf61bf57476034dfd17e75e65146a0c205ec801c8803c9043028"
    end
  end

  def install
    bin.install "seal"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seal --version")
  end
end
