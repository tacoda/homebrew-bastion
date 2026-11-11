cask "bastion" do
  version "0.1.0"
  sha256 "143696364f1db0fc24f4823c93d23279800d793814766f66609581589b38719c"

  url "https://github.com/tacoda/bastion/releases/download/v0.1.0/bastion-desktop-#{version}-aarch64-apple-darwin.zip"
  name "Bastion"
  desc "Watch and steer the Bastion software factory"
  homepage "https://tacoda.github.io/bastion/"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"
  conflicts_with formula: "bastion"

  app "Bastion.app"
  binary "#{appdir}/Bastion.app/Contents/MacOS/bastion"
  binary "#{appdir}/Bastion.app/Contents/MacOS/bastion-server"

  caveats <<~TEXT
    Bastion.app is not signed with a Developer ID yet. Install it with
      brew install --cask --no-quarantine tacoda/bastion/bastion
    or open it once with right-click, Open.
  TEXT
end
