cask "hyperswitcher" do
  version "1.4.0"
  sha256 "86fd046546f732f00e363836ce1ac3cc11b56c71f253b210bbdf75d110d4f544"

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
