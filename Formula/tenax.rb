class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.8.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.8.0/tenax-darwin-arm64"
      sha256 "dcdbdac87a38672271d2a821a2104d354683757e9812c251f946fd6960403519"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.8.0/tenax-darwin-amd64"
      sha256 "604d60d0ab38a2dfecf6e35ac50b65b37ebd40658794954815beb4d7a76801bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.8.0/tenax-linux-arm64"
      sha256 "d13bee9f4044148e5274bb56ff26fad72187ac82b3aeaa589b2c953d31a077da"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.8.0/tenax-linux-amd64"
      sha256 "d2a1e57d2e001340a65fac968fa94faa11b8af418c2f99beef93ffc478918efb"
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
