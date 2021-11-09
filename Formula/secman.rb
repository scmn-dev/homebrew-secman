class Secman < Formula
  desc "The Password Manager of your dreams"
  homepage "https://secman.dev/docs/cli"
  url "https://cli-files.secman.dev/secman-v6.0.5/secman-v6.0.5.tar.gz"
  sha256 "cd02c4ac6c77b376f31d16280153b7f566116dca308495883fc2abb444145400"
  depends_on "secman/sm-node" => "16.13.0"

  def install
    inreplace "bin/secman", /^CLIENT_HOME=/, "export SECMAN_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/secman", "\"$DIR/node\"", Formula["sm-node"].opt_bin/"node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/secman"
    system("export SM_PROVIDER=brew")
  end

  test do
    system bin/"secman", "-v"
  end
end
