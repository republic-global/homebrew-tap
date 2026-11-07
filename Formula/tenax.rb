class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.20.3"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.3/tenax-darwin-arm64"
      sha256 "b0533fbe853c3d1f3587f8fa82cd59242f52967f5a1f9ddd42687fb03f04eeb3"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.3/tenax-darwin-amd64"
      sha256 "32158985cec6d14d2b9e06c5d641ad8fd5d842d6a981c1fad3d82f570f11281d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.3/tenax-linux-arm64"
      sha256 "aeae61f9123d37212885793fa2719c5d8be05a8fdffcff77faae010f478f2cf2"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.3/tenax-linux-amd64"
      sha256 "b593ca9a60a32f473c1b3d71a15e9b27cb0fb8954ef9b2861455c4e3524d3e5c"
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
