class AnoaBrowserLinux < Formula
  desc "Headless browser built on Qt6/QWebEngine with CDP support"
  homepage "https://github.com/porcupine-md/anoa-browser"
  version "0.10.0"
  license "MIT"

  # Two bundles, picked by the machine doing the installing. Before this, an
  # arm64 Linux got the x86_64 tarball and a binary it could not exec.
  on_intel do
    url "https://github.com/porcupine-md/anoa-browser/releases/download/v#{version}/anoa-linux-x86_64.tar.gz"
    sha256 "ff0fa1bfcd449c99c5d9d883352bcb7240ab67399037b9ea37dc9ee596c707e1"
  end

  on_arm do
    url "https://github.com/porcupine-md/anoa-browser/releases/download/v#{version}/anoa-linux-aarch64.tar.gz"
    sha256 "2f8cab8fce050756fbf09b58424b0e2ac409ed9227a69d68d3dad7a066e3e17c"
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
