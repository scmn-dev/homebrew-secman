class Secman < Formula
  desc "The Password Manager of your dreams"
  homepage "https://secman.dev/docs/cli"
  url "https://cli-files.secman.dev/secman-v6.0.71/secman-v6.0.71.tar.gz"
  sha256 "2a9c03df9b444e9c110b640c2e22ef4db147623cb728f7b2c68f2bc488d0e230"
  depends_on "scmn-dev/secman/sm-node" => "16.13.0"

  def install
    inreplace "bin/secman", /^CLIENT_HOME=/, "ENV SECMAN_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/secman", "\"$DIR/node\"", Formula["sm-node"].opt_bin/"node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/secman"
    system("ENV SM_PROVIDER=brew")
  end

  test do
    system bin/"secman", "-v"
  end
end
