class AnoaBrowserLinux < Formula
  desc "Headless browser built on Qt6/QWebEngine with CDP support"
  homepage "https://github.com/porcupine-md/anoa-browser"
  version "0.7.3"
  license "MIT"

  # Two bundles, picked by the machine doing the installing. Before this, an
  # arm64 Linux got the x86_64 tarball and a binary it could not exec.
  on_intel do
    url "https://github.com/porcupine-md/anoa-browser/releases/download/v#{version}/anoa-linux-x86_64.tar.gz"
    sha256 "3a3532561c86547c5f5d746d05ff26ac332ae7648cbd43070b43fd62d847f737"
  end

  on_arm do
    url "https://github.com/porcupine-md/anoa-browser/releases/download/v#{version}/anoa-linux-aarch64.tar.gz"
    sha256 "59ce9f0053a093aaa0a3c4fdd4d914f61b7d67f1013722ed7bc28aed5a2cd58b"
  end

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
