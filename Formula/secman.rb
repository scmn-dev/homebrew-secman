VER = "v5.3.73"
BIN = "secman"
PROJECT = "scmn-dev/#{BIN}"
SHA256 = ""

class Secman < Formula
  desc "Save your passwords and Sync it With GitHub"
  homepage "https://github.com/#{PROJECT}"
  version "#{VER}"

  if OS.mac?
    url "https://github.com/#{PROJECT}/releases/download/#{VER}/#{BIN}-osx"
    sha256 "#{SHA256}"
  elsif OS.linux?
    url "https://github.com/#{PROJECT}/releases/download/#{VER}/#{BIN}-linux"
    sha256 "#{SHA256}"
  end

  def install
    bin.install (OS.linux? ? "#{BIN}-linux" : "#{BIN}-osx") => "#{BIN}"
  end

  test do
    assert_match(shell_output("#{BIN}"))
  end
end
