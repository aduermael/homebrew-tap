class Wb < Formula
  desc "macOS web browser for agents"
  homepage "https://github.com/aduermael/wb"
  version "0.1.2"

  depends_on :macos

  on_macos do
    depends_on macos: :tahoe
  end

  if Hardware::CPU.arm?
    url "https://github.com/aduermael/wb/releases/download/v0.1.2/wb-macos-arm64.tar.gz"
    sha256 "06b73a95d39978d809227adb8a7733fac2aba2ce21ad831f7a6b29849d6c4657"
  elsif Hardware::CPU.intel?
    url "https://github.com/aduermael/wb/releases/download/v0.1.2/wb-macos-x86_64.tar.gz"
    sha256 "eca3ff7d023559da0a1a79e0aae2e2f83db214602711d2b1fae45f63e4d95211"
  end

  def install
    bin.install "wb"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/wb --help")
  end
end
