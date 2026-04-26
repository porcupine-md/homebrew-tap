cask "anoa-browser" do
  version "0.1.0"
  sha256 "08c40ff3aaa9e8f9d219f524d2bff59d2650b184e74ebdf2c4841027dbe1b225"

  url "https://github.com/porcupine-md/anoa-browser/releases/download/v#{version}/anoa-browser-macos.tar.gz"
  name "Anoa Browser"
  desc "Headless browser built on Qt6/QWebEngine with CDP support"
  homepage "https://github.com/porcupine-md/anoa-browser"

  depends_on macos: ">= :monterey"

  app "anoa-browser.app"

  binary "#{appdir}/anoa-browser.app/Contents/MacOS/anoa-browser"

  zap trash: [
    "~/Library/Caches/anoa-browser",
    "~/Library/Preferences/com.porcupine-md.anoa-browser.plist",
  ]
end