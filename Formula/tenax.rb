class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.8.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.8.1/tenax-darwin-arm64"
      sha256 "1184513e7b4903b7fe5885f07862367679e356838b4f5d3f54e6df449e946921"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.8.1/tenax-darwin-amd64"
      sha256 "18dea065d1f9b3446048ffe5523b88b3fbd55577bc477aef34055d0f1ac2c26c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.8.1/tenax-linux-arm64"
      sha256 "c86537ef06f745700714a684ee367fe02804bf0f6f034764fd4ce0668f588858"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.8.1/tenax-linux-amd64"
      sha256 "ef592b977ae0d4e31707ebea024a31799250de36c12e261e7f21eba3bf370f49"
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
