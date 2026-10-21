class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.11.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.11.0/tenax-darwin-arm64"
      sha256 "4ad8f6347737f11d314bd22901aee65ba877c2f82353cf00f5da34a29328eeae"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.11.0/tenax-darwin-amd64"
      sha256 "a81053d820de7e8714b6d5fa91b2eca99faf9e8d8abcad6308bb08c7ee32682a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.11.0/tenax-linux-arm64"
      sha256 "dcec397608661031c424e0b60c6b8beea043d21990eb14cbd50891620473e2ae"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.11.0/tenax-linux-amd64"
      sha256 "9325b7d720d38e8e98964b9a66f9fe877d2ef53c40ec06b657962c58652229b5"
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
