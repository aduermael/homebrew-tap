class Wb < Formula
  desc "macOS web browser for agents"
  homepage "https://github.com/aduermael/wb"
  version "0.1.5"

  depends_on :macos

  on_macos do
    depends_on macos: :tahoe
  end

  if Hardware::CPU.arm?
    url "https://github.com/aduermael/wb/releases/download/v0.1.5/wb-macos-arm64.tar.gz"
    sha256 "0c5987da2db8050bede9e3bb49d4a2085ea781acf12df03b1a39df349bb3ffd9"
  elsif Hardware::CPU.intel?
    url "https://github.com/aduermael/wb/releases/download/v0.1.5/wb-macos-x86_64.tar.gz"
    sha256 "f4477f5ebe6d9a813bd46da023ab3734620d57eb7958511a9211a4f64107691c"
  end

  def install
    bin.install "wb"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/wb --help")
  end
end
