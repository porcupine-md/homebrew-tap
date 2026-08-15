class AnoaBrowserLinux < Formula
  desc "Headless browser built on Qt6/QWebEngine with CDP support"
  homepage "https://github.com/porcupine-md/anoa-browser"
  version "0.7.2"
  license "MIT"

  # Two bundles, picked by the machine doing the installing. Before this, an
  # arm64 Linux got the x86_64 tarball and a binary it could not exec.
  on_intel do
    url "https://github.com/porcupine-md/anoa-browser/releases/download/v#{version}/anoa-linux-x86_64.tar.gz"
    sha256 "b13d570d1d98bb29a76e34f7d9b4ef4c6f6e9eee29f9a210f0ff34c3952f9249"
  end

  on_arm do
    url "https://github.com/porcupine-md/anoa-browser/releases/download/v#{version}/anoa-linux-aarch64.tar.gz"
    sha256 "f7f1f5a44b881bf15aca61dd8ca76f5e668521e132b6b3bc1e3d006012c28714"
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
