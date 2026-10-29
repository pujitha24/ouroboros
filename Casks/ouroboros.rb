# Written by scripts/promote_stable.py into main's promotion commit for this
# Stable release, from its published proof. Do not edit by hand.
cask "ouroboros" do
  version "7.8.0"
  sha256 "41b9a8901d29c9a9b5dfdda8780d9317c441ba8c2941d949041c15abae0eff57"

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
  caveats do
    <<~EOS
      In 7.8.0, finish Setup before the first Quit (including a Homebrew upgrade).
      Quitting earlier can make a new data folder refuse initialization (#2412).
      If affected, back up the data folder and diagnose it before changing anything.
      Use Reset runtime data only for a confirmed empty new installation.
      Guidance: https://github.com/razzant/ouroboros/blob/ouroboros/README.md#homebrew-on-macos
    EOS
  end

end
