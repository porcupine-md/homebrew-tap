class AnoaBrowserLinux < Formula
  desc "Headless browser built on Qt6/QWebEngine with CDP support"
  homepage "https://github.com/porcupine-md/anoa-browser"
  version "0.5.0"
  sha256 "f017cd8f26ad0a990485f4ba7f2d4c40d702bec1542fb6802394f274ddfa3d8b"
  license "MIT"

  url "https://github.com/porcupine-md/anoa-browser/releases/download/v#{version}/anoa-linux-x86_64.tar.gz"

  def install
    libexec.install Dir["*"]
    # anoa.sh sets LD_LIBRARY_PATH / QtWebEngine paths relative to its
    # own (symlink-resolved) location, so a plain symlink is enough. The
    # terminal viewer is a subcommand of the same binary (`anoa
    # terminal`), so this is the only launcher the bundle needs.
    bin.install_symlink libexec/"anoa.sh" => "anoa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anoa --version")
  end
end
