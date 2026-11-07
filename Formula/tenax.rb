class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.20.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.0/tenax-darwin-arm64"
      sha256 "9f7eb045cbabcdc7e5f08a3ee270b63ec473a042f45af176c9524d01463b59a8"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.0/tenax-darwin-amd64"
      sha256 "321743c64e7130a860a964326a35cedf3de39f51ff4b199d4791b0b4d5319995"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.0/tenax-linux-arm64"
      sha256 "4dfa2337f4b198191473722359c348de49fa041d45e63455f9a436ff5e7b01e5"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.20.0/tenax-linux-amd64"
      sha256 "c97c319ed15fd1ec2324df32a73fcfb1b607708d6aa1a5e71a1273dd50f41404"
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
