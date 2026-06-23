class Wb < Formula
  desc "macOS web browser for agents"
  homepage "https://github.com/aduermael/wb"
  version "0.1.3"

  depends_on :macos

  on_macos do
    depends_on macos: :tahoe
  end

  if Hardware::CPU.arm?
    url "https://github.com/aduermael/wb/releases/download/v0.1.3/wb-macos-arm64.tar.gz"
    sha256 "08fa622e5d6ffcef211457d85e4f13a3d93786aced34569a1442cae1d410551d"
  elsif Hardware::CPU.intel?
    url "https://github.com/aduermael/wb/releases/download/v0.1.3/wb-macos-x86_64.tar.gz"
    sha256 "756479e246019a3e5cf3c46e775f4e8bd4ac8c6a04ad0c9a65fc1e22f0d1c086"
  end

  def install
    bin.install "wb"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/wb --help")
  end
end
