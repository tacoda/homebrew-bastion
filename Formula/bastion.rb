class Bastion < Formula
  desc "Software factory: agents plan, build and land changes under governance"
  homepage "https://tacoda.github.io/bastion/"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/tacoda/bastion/releases/download/v0.1.1/bastion-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "82eb4f5d65a87feb03804fa1ae4f7065d955d32a59b1c422c931f0d7c82efc5f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tacoda/bastion/releases/download/v0.1.1/bastion-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "752ab40c417d7cd3e8fc41b4d7dea2bd7fe03fdfa7d660cbd8938127e542607c"
    end
    on_arm do
      url "https://github.com/tacoda/bastion/releases/download/v0.1.1/bastion-0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37c5e7fd3f7d4c72e9494e9fffaff3582ee08182fc4eaf8864698f810df9ae6b"
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
