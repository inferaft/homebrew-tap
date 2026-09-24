cask "inferaft-code" do
  version "0.1.1"
  sha256 "495fb6c5e2ac1c501dd216c41c4a16529226de1f0613b29cd2e40123e76352ad"

  url "https://github.com/inferaft/homebrew-tap/releases/download/inferaft-code-v0.1.1/inferaft-code-0.1.1-darwin-arm64.tar.gz"
  name "Inferaft Code"
  desc "Terminal coding agent for the Inferaft model catalog"
  homepage "https://inferaft.com/"

  depends_on arch: :arm64
  depends_on formula: "node@24"
  depends_on :macos

  command_wrapper "inferaft",
                  content: <<~SH
                    #!/bin/sh
                    exec "#{HOMEBREW_PREFIX}/opt/node@24/bin/node" "#{staged_path}/dist/index.js" "$@"
                  SH
end
