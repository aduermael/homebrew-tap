class Wb < Formula
  desc "macOS web browser for agents"
  homepage "https://github.com/aduermael/wb"
  version "0.1.0"

  depends_on macos: :tahoe

  if Hardware::CPU.arm?
    url "https://github.com/aduermael/wb/releases/download/v0.1.0/wb-macos-arm64.tar.gz"
    sha256 "70879bf677c99fbf9a73dcfe24fe406ad50b85e7de108610c7efc121e05b42a2"
  elsif Hardware::CPU.intel?
    url "https://github.com/aduermael/wb/releases/download/v0.1.0/wb-macos-x86_64.tar.gz"
    sha256 "c9dd860340d17503409e16f46726cdb218a84a4cf426878eab49e43f4be23f46"
  end

  def install
    bin.install "wb"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/wb --help")
  end
end
