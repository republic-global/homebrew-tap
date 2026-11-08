class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.21.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.21.0/tenax-darwin-arm64"
      sha256 "4e0ad1aca5c8bb80f00b54878ae5642bd5c6fa4831b49249b6cb6e37c921d165"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.21.0/tenax-darwin-amd64"
      sha256 "c44baf6a892e6487bff02cf9e70104e087338b65ec3cfdf106cf6e212386b777"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.21.0/tenax-linux-arm64"
      sha256 "50a0c4aac27833e119fe804b2fa0a6aaf94aa31d1c66932c7b73369f662e1f47"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.21.0/tenax-linux-amd64"
      sha256 "b4b7787bdd1dea9365f06d752c68086c9020edd248ea46de567a95d6dda49a31"
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
