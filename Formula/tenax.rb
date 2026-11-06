class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.18.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.18.1/tenax-darwin-arm64"
      sha256 "0ce6c1ba70e2197d9ce09a88fc6d2482484a3a2aa2e46adc3aae0b85db23d6a4"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.18.1/tenax-darwin-amd64"
      sha256 "e25168a6781bf8fff33cfc45f7f78af79a549ac62b7d9ca78a308e250ba8a44e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.18.1/tenax-linux-arm64"
      sha256 "aca3bd5628a951bb209dc9d49b58810d952cc9a9aa76c59241515bf01c4c638d"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.18.1/tenax-linux-amd64"
      sha256 "7532ab861430fe3bdca08cbb3f1d3a61b2e5c5c4f3ab78fd9687bc5f2fb14fcb"
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
