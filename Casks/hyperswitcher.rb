cask "hyperswitcher" do
  version "1.8.0"
  sha256 "0590e978dfcb0188ed4efecc4961c14b057f2c63e0503422b7798f259f165e38"

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
