class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.22.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.22.0/tenax-darwin-arm64"
      sha256 "d5e41cec9905f63208eb51570a6f22931154a557edec774ba10dceea6b5f9a0c"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.22.0/tenax-darwin-amd64"
      sha256 "4f0a94038fdcd6458b9fb80cd9a3cfc1564ba36588c93ef519383464831d6fca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.22.0/tenax-linux-arm64"
      sha256 "549ac9cd50cc3f10e293d55db7b331f167a3c845a7c10f11a03258b7b3164247"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.22.0/tenax-linux-amd64"
      sha256 "7ee9fc6021bf119b6dc6846687b9d13db964ae5a271840fa3d74cbd580fbf149"
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
