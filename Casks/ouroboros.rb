# Written by scripts/promote_stable.py into main's promotion commit for this
# Stable release, from its published proof. Do not edit by hand.
cask "ouroboros" do
  version "7.9.0"
  sha256 "9ced70d812a1c4b3eb6f03d8166571aa14e816b9e876e9373ba681a0de7b3157"

  url "https://github.com/razzant/ouroboros/releases/download/v#{version}/Ouroboros-#{version}.dmg"
  name "Ouroboros"
  desc "Self-creating AI agent"
  homepage "https://ouroboros-agent.ai/"

  # A plain `brew upgrade` first compares the installed app's own version.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Ouroboros.app"

  # Asks a running app to quit before an upgrade or uninstall. No launchctl or
  # zap: launchctl also runs on upgrade and would drop the sign-in registration,
  # and ~/Ouroboros holds the owner's repository, memory and projects.
  uninstall quit: "com.ouroboros.agent"

end
