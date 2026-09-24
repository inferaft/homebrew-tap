cask "inferaft-code" do
  version "0.2.0"
  sha256 "d827bbd3b21eb40daff202886f1d0453b4de9b0ea4898e20087879f95481a0d7"

  url "https://github.com/inferaft/homebrew-tap/releases/download/inferaft-code-v0.2.0/inferaft-code-0.2.0-darwin-arm64.tar.gz"
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
