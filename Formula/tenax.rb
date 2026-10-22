class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.13.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.13.1/tenax-darwin-arm64"
      sha256 "8ca5437684d323ce30233a6eeffdf2c82c2aebdb81b58f1a4ae0c1911c72652a"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.13.1/tenax-darwin-amd64"
      sha256 "f20763ca372304232b9ec6ac6a41c0e79eb55fdb062f57a983232e4013e215bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.13.1/tenax-linux-arm64"
      sha256 "03bba7321833df25a5b187ee18bc06fb5ae6e080a54a6316b9dcf6bf3b597937"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.13.1/tenax-linux-amd64"
      sha256 "93f9af872fd7c23830e107a173cf577b2e0c15eabac85eca8f807d5c8f0b8c80"
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
