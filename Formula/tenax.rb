class Tenax < Formula
  desc "Command-line for Tenax, Kubernetes database backups and point-in-time restore"
  homepage "https://tenax.run"
  version "0.16.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.16.1/tenax-darwin-arm64"
      sha256 "78a3952d4aca4951acf37e3891a5a8e805f3dabf951ba534df0a0346798f0f54"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.16.1/tenax-darwin-amd64"
      sha256 "d2d820c1e13acec3688f9eb3046e409de11cfcd261913af03d4dfd87a12526b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.16.1/tenax-linux-arm64"
      sha256 "8269b00e46c1dfb9d717040ee32ec69014194039d54d41174097113c4e2dae35"
    end
    on_intel do
      url "https://github.com/republic-global/tenax-cli/releases/download/v0.16.1/tenax-linux-amd64"
      sha256 "8d0917ec719cc0004e022e542e852cf0efc546cec392c5d4a00166992e6e5352"
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
