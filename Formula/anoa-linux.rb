class AnoaBrowserLinux < Formula
  desc "Headless browser built on Qt6/QWebEngine with CDP support"
  homepage "https://github.com/porcupine-md/anoa-browser"
  version "0.6.0"
  sha256 "c0010c29d19666e3870f481d9e171a0d298c853b1c8664857332b2dc422a993f"
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
