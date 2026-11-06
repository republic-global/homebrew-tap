class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.18.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.18.0/tenax-darwin-arm64"
      sha256 "1e922d25d605c0bbcd393fea3b08f53dc6566b16ded9a218c570c640daa78031"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.18.0/tenax-darwin-amd64"
      sha256 "5f27689b459bba13c31cebd38fbde01d5cce3f4dad35d45bb0621014b3677aaa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.18.0/tenax-linux-arm64"
      sha256 "b34173dd2e682082e6f6df08585b642b11d26efcc2de3143ddfd4bb962dace35"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.18.0/tenax-linux-amd64"
      sha256 "3f137d02b619c80d71761da7053ddab2da9dd13e4ecd4f6656edb58071afda54"
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
