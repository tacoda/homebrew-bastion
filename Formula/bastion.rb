class Bastion < Formula
  desc "Software factory: agents plan, build and land changes under governance"
  homepage "https://tacoda.github.io/bastion/"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/tacoda/bastion/releases/download/v0.1.0/bastion-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "2ce18f0969a7fb9ff6003e72242be243be33a8f494b8584c4d14f116ff17941c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tacoda/bastion/releases/download/v0.1.0/bastion-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d4f45102679ba881054b681bc3eb2e25be62fbbcf690b1a00c4646d715567f0"
    end
    on_arm do
      url "https://github.com/tacoda/bastion/releases/download/v0.1.0/bastion-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "27406694f3b71b68fac2876a239b5767430a02c532109d460e24c48c8be462fa"
    end
  end

  def install
    # The stack stays beside the binaries, where they look for it.
    libexec.install "bin", "share"
    bin.install_symlink libexec/"bin/bastion", libexec/"bin/bastion-server"
  end

  def caveats
    <<~TEXT
      Bastion's stack runs on iii 0.25.0, installed on its own;
      `bastion-server` checks for it and says how before it starts.
    TEXT
  end

  test do
    assert_match "usage: bastion", shell_output("#{bin}/bastion 2>&1", 1)
  end
end
