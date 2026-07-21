cask "hyperswitcher" do
  version "1.6.0"
  sha256 "9fe5a7b81ddefb6b57a0199615a9ae1fe5d2228e6afa10e211ba7b6917257fa7"

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
