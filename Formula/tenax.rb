class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.7.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.7.0/tenax-darwin-arm64"
      sha256 "de2e1f2cdffd73b035176618eedeea66c16748d247717ad9aa67761a152755b4"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.7.0/tenax-darwin-amd64"
      sha256 "1e61c67ea3f9d10e47dfa2d4101a6e242eead69efcfb64116b9abaac5a26831a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.7.0/tenax-linux-arm64"
      sha256 "e492abba7dcf9cf2133c8af2e9781836468f7598a004444975fb75c255304c32"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.7.0/tenax-linux-amd64"
      sha256 "4353a2d48750e111bae2312c50d3ccf984903368f2a21dceb19dfe0bc72de87d"
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
