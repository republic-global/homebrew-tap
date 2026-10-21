class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.9.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.9.0/tenax-darwin-arm64"
      sha256 "41891a430892d5a80322df82672781dfd116957e97260ec1b3ad765bc53ea3fa"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.9.0/tenax-darwin-amd64"
      sha256 "9125e9b9af1dd4eb2ce8f19d8cd07345fddf90aed76a63d77b88fc6954241dbd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.9.0/tenax-linux-arm64"
      sha256 "541683f1262c8b927a7a075e70b72b4bac358e978ba6536699ba1336d80d7cc5"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.9.0/tenax-linux-amd64"
      sha256 "ebe58006db67b771e11734cc0fb7c7f2627650aa0cd8b0317bd14c62c8de34a2"
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
