class Wb < Formula
  desc "macOS web browser for agents"
  homepage "https://github.com/aduermael/wb"
  version "0.1.4"

  depends_on :macos

  on_macos do
    depends_on macos: :tahoe
  end

  if Hardware::CPU.arm?
    url "https://github.com/aduermael/wb/releases/download/v0.1.4/wb-macos-arm64.tar.gz"
    sha256 "68728ef0c9d4709a3780d0e5d2f8290ddab699f16e2077478caa3e850d99c6f7"
  elsif Hardware::CPU.intel?
    url "https://github.com/aduermael/wb/releases/download/v0.1.4/wb-macos-x86_64.tar.gz"
    sha256 "aef0c857cdf57e61b177166026c7bb1f58e5cd70946bc31e3731b9ce38fe4360"
  end

  def install
    bin.install "wb"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/wb --help")
  end
end
