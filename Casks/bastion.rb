cask "bastion" do
  version "0.1.1"
  sha256 "6ba9b9cba8af7fc9d1dded63566d651c5468d7a4fdb860044cab5567706786c9"

  url "https://github.com/tacoda/bastion/releases/download/v0.1.1/bastion-desktop-#{version}-aarch64-apple-darwin.zip"
  name "Bastion"
  desc "Watch and steer the Bastion software factory"
  homepage "https://tacoda.github.io/bastion/"

  depends_on arch: :arm64
  depends_on macos: :ventura
  # The CLI and the server come from the formula, so they are on the path once.
  depends_on formula: "tacoda/bastion/bastion"

  app "Bastion.app"
  binary "#{appdir}/Bastion.app/Contents/MacOS/bastion-desktop"

  # Not signed with a Developer ID yet, and Homebrew dropped --no-quarantine:
  # the download is pinned to its signed sum, so the quarantine mark goes.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Bastion.app"]
  end
end
