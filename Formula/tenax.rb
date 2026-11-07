class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.20.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.2/tenax-darwin-arm64"
      sha256 "e5805af1d9a91261cf05746e0bdef979eabe13cf9d23d164ff29394757b6933f"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.2/tenax-darwin-amd64"
      sha256 "612b88a83762b89fdb1635759a76a0ca99249395259a671bfa160f1de9aace56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.2/tenax-linux-arm64"
      sha256 "69cdadf0881024594077e1895ff8e4799c09468dd74f19345bb55719c43aa505"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.2/tenax-linux-amd64"
      sha256 "ce25dff2b3c8bcc3e74a5c3b20e2697bb0e3291104352848541dd58aa783c6f7"
    end
  end

  def install
    binary = Dir["tenax-*"].first
    chmod 0755, binary
    bin.install binary => "tenax"
    generate_completions_from_executable(bin/"tenax", "completion")
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/tenax version")
  end
end
