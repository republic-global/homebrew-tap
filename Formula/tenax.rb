class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.16.3"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.16.3/tenax-darwin-arm64"
      sha256 "c279380ef908fc4a9c6fa55d24b0c0756bfc112113384cc624f014abc1f67153"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.16.3/tenax-darwin-amd64"
      sha256 "d3627b087b52278e093940975bdaa4a3aae4606a21dbf7969c82c35b5d005c72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.16.3/tenax-linux-arm64"
      sha256 "a7f445b28ccbb616a0f5990324dc1c8e4b82d58d4ba4f20e4c97aba53cb3f0a0"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.16.3/tenax-linux-amd64"
      sha256 "c21a198bf7c7cb514bf46018fd38030557535bcb03a058a22a38e097181e991e"
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
