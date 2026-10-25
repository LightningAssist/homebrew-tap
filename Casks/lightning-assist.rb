cask "lightning-assist" do
  version "2.6.7"
  sha256 "c8c82c98db0ea90622baade7f39f802d7f6b0d113f9bf9336e04de055a26567c"

  url "https://lightning-assist-releases.site/releases/#{version}/Lightning-Assist-#{version}-universal-mac.dmg",
      verified: "lightning-assist-releases.site/"
  name "Lightning Assist"
  desc "Text expander with push-to-talk voice typing and AI commands"
  homepage "https://www.lightning-assist.com/"

  livecheck do
    url "https://api.lightning-assist.com/api/v1/app-versions"
    strategy :json do |json|
      json["data"]&.find { |item| item["env"] == "prod" }&.dig("version")
    end
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Lightning Assist.app"

  zap trash: [
    "~/Library/Application Support/Lightning Assist",
    "~/Library/Application Support/lightning-assist",
    "~/Library/Logs/Lightning Assist",
    "~/Library/Logs/lightning-assist",
    "~/Library/Preferences/com.app.LightningAssist.plist",
    "~/Library/Saved Application State/com.app.LightningAssist.savedState",
  ]
end
