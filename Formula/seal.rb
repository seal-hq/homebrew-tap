# The tap `seal-hq/tap` (repository seal-hq/homebrew-tap) is this
# directory. The archives are the ones install.sh fetches from seal.net
# (dev_runbook.md §6); the release writes each one's sha256 here from the
# SHA256SUMS published beside them.
class Seal < Formula
  desc "Large files and secrets between people and agents, never through the chat"
  homepage "https://seal.net/cli"
  version "2.3.5"

  on_macos do
    on_arm do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3fbe587924b641c5769e0e55de521d05f296cdc21481e150e3ee8c96820c8334"
    end
    on_intel do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "8b7f3d110ea71cb6b1a5bb94ff1c923f206d53aa9ac0cc23671b1bb027909d3e"
    end
  end

  on_linux do
    on_arm do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f59408b9326efa9e8c24d85cc1efb9ece69202e748e00edfcb355a46c067a6a"
    end
    on_intel do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "45d113eeaf7c02a2a75020f6be21674616cf8c8872829598c75e74a1103854da"
    end
  end

  def install
    bin.install "seal"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seal --version")
  end
end
