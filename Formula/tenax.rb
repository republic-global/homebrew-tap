class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.15.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.15.0/tenax-darwin-arm64"
      sha256 "e797af441929f5b927b47374fbc4cadceea508d2654687e6123fc7189dc285c5"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.15.0/tenax-darwin-amd64"
      sha256 "59c34a3fe191dc0825a67c7aa0c262a654363a0ffe0448c90bbf7e7f9b0ad6e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.15.0/tenax-linux-arm64"
      sha256 "13370d4c864ef58387e5051dd6a7460541c9083dab27b72062a2774855f2ae3d"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.15.0/tenax-linux-amd64"
      sha256 "aa4b2804ecbab72e0c0761d878a8e5a94766521c44fc80ebfc77eb20c5813f1a"
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
