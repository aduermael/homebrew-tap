class Wb < Formula
  desc "macOS web browser for agents"
  homepage "https://github.com/aduermael/wb"
  version "0.1.1"

  depends_on :macos

  on_macos do
    depends_on macos: :tahoe
  end

  if Hardware::CPU.arm?
    url "https://github.com/aduermael/wb/releases/download/v0.1.1/wb-macos-arm64.tar.gz"
    sha256 "fe6478f16e3672936fa6a387ddad4fa299727b165cf9dc98faad1283e91ac93a"
  elsif Hardware::CPU.intel?
    url "https://github.com/aduermael/wb/releases/download/v0.1.1/wb-macos-x86_64.tar.gz"
    sha256 "8e2b1651e884a505753e5faef0db9aa83fd928a6b87c5bf96c45d267ddb9c0ed"
  end

  def install
    bin.install "wb"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/wb --help")
  end
end
