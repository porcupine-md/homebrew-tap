cask "anoa-browser" do
  version "0.3.0"
  sha256 "57224f7c5c940abaf1c74db97c99735e8d24e1aceaed6c0654d73e0709655e10"

  # Universal (x86_64 + arm64) build — one archive for Intel and Apple Silicon.
  url "https://github.com/porcupine-md/anoa-browser/releases/download/v#{version}/anoa-browser-macos-universal.tar.gz"
  name "Anoa Browser"
  desc "Headless browser built on Qt6/QWebEngine with CDP support"
  homepage "https://github.com/porcupine-md/anoa-browser"

  depends_on macos: ">= :monterey"

  app "anoa-browser.app"

  binary "#{appdir}/anoa-browser.app/Contents/MacOS/anoa-browser"
  binary "anoa-term"

  caveats <<~EOS
    The app is ad-hoc signed, not notarized. If Gatekeeper blocks the first
    launch, reinstall with quarantine disabled:
      brew reinstall --cask --no-quarantine anoa-browser
    or clear the attribute manually:
      xattr -dr com.apple.quarantine "#{appdir}/anoa-browser.app"
  EOS

  zap trash: [
    "~/Library/Caches/anoa-browser",
    "~/Library/Preferences/com.porcupine-md.anoa-browser.plist",
  ]
end
