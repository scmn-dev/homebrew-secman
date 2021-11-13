class Secman < Formula
  desc "The Password Manager of your dreams"
  homepage "https://secman.dev/docs/cli"
  url "https://cli-files.secman.dev/secman-v6.0.7/secman-v6.0.7.tar.gz"
  sha256 "afbc6976bd1affc9daf059ee04bef04c04c02aebf73c5bbc569f4f81e4f1cebe"
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
