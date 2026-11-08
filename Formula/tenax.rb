class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.22.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.22.1/tenax-darwin-arm64"
      sha256 "2671242cd148e0d6f7e1c7e9b450a24826b16999fa46d5df3aaf4307ba6cad87"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.22.1/tenax-darwin-amd64"
      sha256 "ce43622e83dce46ceb6028e1d230c65aa4aab364aa88a5a034c7280f434aefd1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.22.1/tenax-linux-arm64"
      sha256 "9e92b271370f16b6977fac0ab0d6e621ac191b8f2437c7d86b32da89b75a27fb"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.22.1/tenax-linux-amd64"
      sha256 "8baa6f5e1942376480e685757619726c283dcb30786d3fab634aa62c6f76371f"
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
