class Secman < Formula
  desc "The Password Manager of your dreams"
  homepage "https://secman.dev/docs/cli"
  url "https://cli-files.secman.dev/secman-v6.0.61/secman-v6.0.61.tar.gz"
  sha256 "dbb53beaf763bf30c9d4909bab68e2f14c1c63e5300f44de8d1ab6fe11c96e8c"
  depends_on "scmn-dev/secman/sm-node" => "16.13.0"

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
