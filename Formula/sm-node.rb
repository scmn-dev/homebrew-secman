class SmNode < Formula
  desc "node.js dependency for secman"
  homepage "https://secman.dev/docs/cli"
  url "https://nodejs.org/download/release/v16.13.0/node-v16.13.0.tar.gz"
  version "16.13.0"
  sha256 "9c00e5b6024cfcbc9105f9c58cf160762e78659a345d100c5bd80a7fb38c684f"
  keg_only "sm-node"

  def install
    bin.install buildpath/"bin/node"
  end

  def test
    output = system bin/"node", "version"
    assert output.strip == "v#{version}"
  end
end
