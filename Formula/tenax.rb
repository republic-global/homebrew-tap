class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.22.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.22.2/tenax-darwin-arm64"
      sha256 "1c7cc46d2e457ef18be323891a3d01a711758eee16babf053213102fc0270a11"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.22.2/tenax-darwin-amd64"
      sha256 "26073e09c980d4b381e127315b2bf5301f6da41bea1fc12c03f1bcff08197f2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.22.2/tenax-linux-arm64"
      sha256 "1a6ca9924259e5e222977e1db1a8f60e5536c24867ff573907c6a3b02e57a211"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.22.2/tenax-linux-amd64"
      sha256 "93723fa2cb58c5b778adddad2abd5a1e2e177ab7a501b81ce5957ffdd8fd390e"
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
