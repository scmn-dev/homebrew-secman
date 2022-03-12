# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Secman < Formula
  desc "👊 Human-friendly and amazing TUI secrets manager"
  homepage "https://secman.dev"
  version "6.2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/scmn-dev/secman/releases/download/v6.2.0/secman_macos_v6.2.0_amd64.zip"
      sha256 "d41d0924cabdbf8e08c404af761be369e23de068227a0b91652f5814612a6c19"

      def install
        bin.install "bin/secman"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/scmn-dev/secman/releases/download/v6.2.0/secman_macos_v6.2.0_arm64.zip"
      sha256 "b291dca63dad3e71c1375cc95e509311a63f031ce250bd966e407e65cd00e14a"

      def install
        bin.install "bin/secman"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/scmn-dev/secman/releases/download/v6.2.0/secman_linux_v6.2.0_arm64.zip"
      sha256 "1dbe2269b7a5d70649d6379d7c6f97c2df5160ab948a3840a1173e727f92683f"

      def install
        bin.install "bin/secman"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/scmn-dev/secman/releases/download/v6.2.0/secman_linux_v6.2.0_arm.zip"
      sha256 "9e45b42b039c48fdf3f46954de4ee06188de2dd42b1f772906ca56a671baeac3"

      def install
        bin.install "bin/secman"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/scmn-dev/secman/releases/download/v6.2.0/secman_linux_v6.2.0_amd64.zip"
      sha256 "11d14154b6d9d023eda379a273864a467b077cddc8a15c8e2b304d48025108ea"

      def install
        bin.install "bin/secman"
      end
    end
  end
end
