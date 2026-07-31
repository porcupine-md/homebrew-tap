class AnoaBrowserLinux < Formula
  desc "Headless browser built on Qt6/QWebEngine with CDP support"
  homepage "https://github.com/porcupine-md/anoa-browser"
  version "0.3.1"
  sha256 "2b07dc43caf912dfcc9fd4074300cc625e157c492be8b9a642764c5d212e5465"
  license "MIT"

  url "https://github.com/porcupine-md/anoa-browser/releases/download/v#{version}/anoa-browser-linux-x86_64.tar.gz"

  def install
    libexec.install Dir["*"]
    # anoa-browser.sh sets LD_LIBRARY_PATH / QtWebEngine paths relative to its
    # own (symlink-resolved) location, so a plain symlink is enough.
    bin.install_symlink libexec/"anoa-browser.sh" => "anoa-browser"
    bin.install_symlink libexec/"anoa-term"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anoa-browser --version")
  end
end
