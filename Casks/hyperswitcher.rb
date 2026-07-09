cask "hyperswitcher" do
  version "1.3.0"
  sha256 "1bb6b86a64f1811bfd9fd776e37b90615acea718961e38a1294bf1a152c7a40b"

  url "https://downloads.hyperswitcher.app/releases/HyperSwitcher-#{version}.dmg",
      verified: "downloads.hyperswitcher.app/"
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

  uninstall quit:       "dev.swiftedmind.HyperSwitcher",
            login_item: "HyperSwitcher"

  zap trash: [
    "~/.config/HyperSwitcher",
    "~/Library/Application Support/HyperSwitcher",
    "~/Library/Caches/dev.swiftedmind.HyperSwitcher",
    "~/Library/HTTPStorages/dev.swiftedmind.HyperSwitcher",
    "~/Library/Preferences/dev.swiftedmind.HyperSwitcher.plist",
    "~/Library/Saved Application State/dev.swiftedmind.HyperSwitcher.savedState",
  ]
end
