cask "inferaft-code" do
  version "0.2.1"
  sha256 "12a0747c03c3e5a3a0968549fa2d8f8926d00b3801ce723e2b5f00d184545b83"

  url "https://github.com/inferaft/homebrew-tap/releases/download/inferaft-code-v0.2.1/inferaft-code-0.2.1-darwin-arm64.tar.gz"
  name "Inferaft Code"
  desc "Terminal coding agent for the Inferaft model catalog"
  homepage "https://inferaft.com/"

  depends_on arch: :arm64
  depends_on formula: "node@24"
  depends_on formula: "ripgrep"
  depends_on :macos

  command_wrapper "inferaft",
                  content: <<~SH
                    #!/bin/sh
                    exec "#{HOMEBREW_PREFIX}/opt/node@24/bin/node" "#{staged_path}/dist/index.js" "$@"
                  SH
end
