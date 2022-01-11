class Secman < Formula
  desc "👊 Human-friendly and amazing secrets manager"
  homepage "https://secman.dev/docs/cli"
  url "https://cli-files.secman.dev/secman-v6.1.3/secman-v6.1.3.tar.gz"
  sha256 "2803c3c2e2978a0b3c5d62d8e2d7c2504fc832c7ad7adc21790c28ec2d6115fb"
  license "MIT"

  livecheck do
    url :homepage
    regex(/href=.*?aamath[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  depends_on "scmn-dev/secman/sm-node"

  def install
    inreplace "bin/secman", /^CLIENT_HOME=/, "export SECMAN_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/secman", "\"$DIR/node\"", Formula["sm-node"].opt_bin/"node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/secman"
    ENV["SM_PROVIDER"] = "brew"
  end

  test do
    system bin/"secman", "-v"
  end
end
