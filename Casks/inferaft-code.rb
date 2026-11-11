cask "inferaft-code" do
  version "1.0.0"
  sha256 "5ef31e456f47d5342f21712e911818430de03a407481c036d4aea38bab2412d3"

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
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{staged_path}/inferaft"],
                   must_succeed: false
  end
end
