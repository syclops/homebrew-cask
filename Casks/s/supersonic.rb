cask "supersonic" do
  version "0.12.0"

  arch arm: "arm64", intel: "x64"
  legacy = MacOS.version <= :catalina ? "legacy-HighSierra-" : ""

  on_arm do
    sha256 "49234f232a4ac8dbcc2ab08b16cfb9efad1434a8660f8880306c184c03066521"
  end
  on_intel do
    on_catalina :or_older do
      sha256 "0ddfbe5497be8a36fb6a4b7fda1c569802d4ab59d50b6fdd6a206fa250b8f7ca"
    end
    on_big_sur :or_newer do
      sha256 "599faa914c03dd408ab00e1c87188f593c2c789d5d117f8cc39c3080165ae526"
    end
  end

  url "https://github.com/dweymouth/supersonic/releases/download/v#{version}/Supersonic-#{version}-mac-#{legacy}#{arch}.zip"
  name "supersonic"
  desc "A lightweight desktop client for Subsonic and Jellyfin music servers"
  homepage "https://github.com/dweymouth/supersonic"

  # Stick with the default livecheck.

  depends_on macos: ">= :high_sierra"

  app "Supersonic.app"

  zap trash: "~/Library/Application Support/supersonic"
end
