class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.13.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.13.0/tenax-darwin-arm64"
      sha256 "7482c0da53cb2fe6e0afcdabc2231386d3f931305f8880a5cfc71b099f8a47b0"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.13.0/tenax-darwin-amd64"
      sha256 "430b3741a92042076bf71fabb0f967a7f281d528d97dc66cec1e03a6213d307f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.13.0/tenax-linux-arm64"
      sha256 "b59b78cf7b661f0968d9a59d2066dc24717384f5845c8e6273aa5cd5577b4766"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.13.0/tenax-linux-amd64"
      sha256 "128269baf696a479f13cc1359639a33f55944062e2a9979451178ae89fcc1f9c"
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
