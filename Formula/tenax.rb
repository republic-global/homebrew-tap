class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.20.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.1/tenax-darwin-arm64"
      sha256 "777291103d206838c5f829f47a3d4d512a962106220b1bbe3f1456d0e94c4313"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.1/tenax-darwin-amd64"
      sha256 "cab9ae1cce10da6f675deeb66f4ac7bba4c3caa01ae174a52ab70d47a82a22a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.1/tenax-linux-arm64"
      sha256 "bcc6a4c4db5f93d3c36a65715425fa072f9f152c66dcefef2606e5cacf3d3cd4"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.1/tenax-linux-amd64"
      sha256 "8e5603326ae480688773f6b048d3cd2f6baf610b558873a842dc8ec378bee36e"
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
