class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.14.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.14.0/tenax-darwin-arm64"
      sha256 "ab8bb1902d0e66bbe78804eb6ebf6b681b5d9f4d027608d53c4e277d8a458db5"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.14.0/tenax-darwin-amd64"
      sha256 "44177c6d72f1a74ff765c896b3ff231f1956cf796c61b9de898b7643751855eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.14.0/tenax-linux-arm64"
      sha256 "acc044ba806058566cd59168b02e54a3a13cdd0b6f6604b00a5086dce278da03"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.14.0/tenax-linux-amd64"
      sha256 "893a10781742ee047b14a330ed0ad2c728eaf00d98aca43cfac26f964550aa9a"
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
