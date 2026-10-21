class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.10.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.10.0/tenax-darwin-arm64"
      sha256 "47c770ffb6ab3bc2d40e0acfd5096d03dd66948e2f913b62fdbdc80cbd7b0451"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.10.0/tenax-darwin-amd64"
      sha256 "f65a204b616a8c550ef88ed19d18d57b8c521a6e8d5fee453eefff8775fb94cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.10.0/tenax-linux-arm64"
      sha256 "9bea135cb08beade1c71d546ddb64948596b26218369c50bb75b164b4826d03d"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.10.0/tenax-linux-amd64"
      sha256 "491601537fb6b0decac8b9a410ad80582641e39699e75ca1bf45e49ead5af579"
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
