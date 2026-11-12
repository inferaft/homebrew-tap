cask "inferaft-code" do
  version "1.0.3"
  sha256 "2c75eee8bcef55c5bfa0dfd82e6276255cbd0f27a7d9e945277e9940bb90e27c"

  url "https://github.com/inferaft/homebrew-tap/releases/download/inferaft-code-v#{version}/inferaft-code-#{version}-darwin-arm64.tar.gz"
  name "Inferaft Code"
  desc "Terminal coding agent for the Inferaft model catalog"
  homepage "https://inferaft.com/code"

  depends_on arch: :arm64
  depends_on formula: "ripgrep"
  depends_on :macos

  binary "inferaft"
  # A short name for the same binary.
  binary "inferaft", target: "ic"

  # The binary is ad-hoc signed, not notarized: without this the quarantine
  # flag Homebrew sets on downloads makes Gatekeeper refuse to run it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{staged_path}}/inferaft"],
        must_succeed: false
  end
end
