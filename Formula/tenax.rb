class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.16.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.16.2/tenax-darwin-arm64"
      sha256 "cfd03f00ff8dadcc53b1e6ab6936dcc0bda9706c94c95f352ff1c362dd73b480"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.16.2/tenax-darwin-amd64"
      sha256 "f147d9fb98eaa7b995bba93cfaf314ad31923b5c0d1bad3640c9fecd4959cc0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.16.2/tenax-linux-arm64"
      sha256 "7f28fbcccd7847a1c92ba7334a90a5480a65713c7f9e1252c4216754348ebf2d"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.16.2/tenax-linux-amd64"
      sha256 "d3ce3c20d9fd81b0dfa25d9e87f139bf1006e8dcf8691ddd0adeefa6cf8ac925"
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
