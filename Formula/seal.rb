# The tap `seal-hq/tap` (repository seal-hq/homebrew-tap) is this
# directory. The archives are the ones install.sh fetches from seal.net
# (dev_runbook.md §6); the release writes each one's sha256 here from the
# SHA256SUMS published beside them.
class Seal < Formula
  desc "Large files and secrets between people and agents, never through the chat"
  homepage "https://seal.net/cli"
  version "1.1.0"

  on_macos do
    on_arm do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4aff1d5d5c085d1a7f612439571b169c9f5f9c68af45086a552b9ad969ef4cb8"
    end
    on_intel do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "8a015fd0d9ba7eaf56c27a692fa0b46689c4a874597ae2f1cda59e9cd1dce4fd"
    end
  end

  on_linux do
    on_arm do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "995242862bffa945a24aaa6859657cc0f3aaceddea440aa96153bb8514d33b8a"
    end
    on_intel do
      url "https://seal.net/releases/download/v#{version}/seal-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "14629f9cd66fe54fb4ec9ca9746ca3651204d72f0153972f217ddabd5d60801d"
    end
  end

  def install
    bin.install "seal"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seal --version")
  end
end
