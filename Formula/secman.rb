class Secman < Formula
  desc "The Password Manager of your dreams"
  homepage "https://secman.dev/docs/cli"
  url "https://cli-files.secman.dev/secman-v6.0.61/secman-v6.0.61.tar.gz"
  sha256 "56c031f5b19182d2ca7b48e8def49b8832f5e54d9240ccb6ed2b95d9b5cc98b3"
  depends_on "scmn-dev/sm-node" => "16.13.0"

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
