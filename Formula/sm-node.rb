class SMNode < Formula
  desc "node.js dependency for secman"
  homepage "https://secman.dev/docs/cli"
  url "https://nodejs.org/download/release/v16.13.0/node-v16.13.0-darwin-x64.tar.gz"
  version "16.13.0"
  sha256 "37e09a8cf2352f340d1204c6154058d81362fef4ec488b0197b2ce36b3f0367a"
  keg_only "sm-node"

  def install
    bin.install buildpath/"bin/node"
  end

  def test
    output = system bin/"node", "version"
    assert output.strip == "v#{version}"
  end
end
