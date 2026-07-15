cask "hyperswitcher" do
  version "1.5.0"
  sha256 "b563231727506657813dd6095f6ba0a8c029cde8430dd8f57b67d2b578c6b4fb"

  url "https://downloads.hyperswitcher.app/releases/HyperSwitcher-#{version}.dmg"
  name "HyperSwitcher"
  desc "Fixed-key app and window switcher"
  homepage "https://hyperswitcher.app/"

  livecheck do
    url "https://downloads.hyperswitcher.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "HyperSwitcher.app"

  uninstall quit: "dev.swiftedmind.HyperSwitcher"

  zap trash: [
    "~/.config/HyperSwitcher",
    "~/Library/Application Support/HyperSwitcher",
    "~/Library/Caches/dev.swiftedmind.HyperSwitcher",
    "~/Library/HTTPStorages/dev.swiftedmind.HyperSwitcher",
    "~/Library/Preferences/dev.swiftedmind.HyperSwitcher.plist",
    "~/Library/Saved Application State/dev.swiftedmind.HyperSwitcher.savedState",
  ]
end
