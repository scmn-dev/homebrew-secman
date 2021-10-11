VER = "v5.3.8"
BIN = "secman"
PROJECT = "scmn-dev/#{BIN}"
SHA256 = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

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
