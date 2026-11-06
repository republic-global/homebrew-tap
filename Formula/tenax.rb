class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.17.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.17.0/tenax-darwin-arm64"
      sha256 "a287225862d441d96247cf9a3f2b941f1abd96a4a57c92892ad833dabaac601d"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.17.0/tenax-darwin-amd64"
      sha256 "cb01361d94817f133c9a05aa4222a80bc6d494927013c8ae5a755bbe7708f2c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.17.0/tenax-linux-arm64"
      sha256 "66b8a5654998da439d81cddd87129fa264cdb3942e08bdb4a1e92bf375e96107"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.17.0/tenax-linux-amd64"
      sha256 "f3476285b16609cb30c607eefcf560cfe670f69b010f23831e30b41551ff8df6"
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
