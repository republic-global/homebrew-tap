class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.19.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.19.0/tenax-darwin-arm64"
      sha256 "cce0b350f4359df0327d7b93fa018694b8ec9f95937a77b8df6299c457d1e464"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.19.0/tenax-darwin-amd64"
      sha256 "20f4f079d8a4301d64eef1e55fd79dc27d4bf3483cf822701dcfb245f00dc5ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.19.0/tenax-linux-arm64"
      sha256 "a44f0564baef05feb92d3b6ed21c0dac2f0722395750651c3eb4812a52dee83b"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.19.0/tenax-linux-amd64"
      sha256 "04602a150e893fd045e91e444d42ccfaae856b35d506158143d5f482c8ab239a"
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
