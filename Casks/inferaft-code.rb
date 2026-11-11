cask "inferaft-code" do
  version "1.0.1"
  sha256 "1d5663357f5126c6dbe9efb0edfd766469dfbb19babc6b96c6b3411c5539430c"

  url "https://github.com/inferaft/homebrew-tap/releases/download/inferaft-code-v#{version}/inferaft-code-#{version}-darwin-arm64.tar.gz"
  name "Inferaft Code"
  desc "Terminal coding agent for the Inferaft model catalog"
  homepage "https://inferaft.com/code"

  depends_on arch: :arm64
  depends_on formula: "ripgrep"
  depends_on :macos

  binary "inferaft"

  # The binary is ad-hoc signed, not notarized: without this the quarantine
  # flag Homebrew sets on downloads makes Gatekeeper refuse to run it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{staged_path}}/inferaft"],
        must_succeed: false
  end
end
