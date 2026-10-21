class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.12.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.12.0/tenax-darwin-arm64"
      sha256 "f768668483391ccb4961b0b6025e76d97e902d4bd7456b02026b751c52d01e3e"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.12.0/tenax-darwin-amd64"
      sha256 "92808a332de10ee93a3984387672b9b58ac9a946d6293436b178caae9c21f34b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.12.0/tenax-linux-arm64"
      sha256 "d5be42ca3adc3505c440c921a332580018e624c3ce0b6bca64261207b3327d05"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.12.0/tenax-linux-amd64"
      sha256 "98161a6ce38db6cfbe9fe901500bb53f920d012f75bf6332898a40d27d6891fc"
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
