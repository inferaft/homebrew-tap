cask "inferaft-code" do
  version "0.11.0"
  sha256 "ef4695c423342ff9091443f93f4db8505af12396992f433053be962499d62103"

  url "https://github.com/inferaft/homebrew-tap/releases/download/inferaft-code-v#{version}/inferaft-code-#{version}-darwin-arm64.tar.gz"
  name "Inferaft Code"
  desc "Terminal coding agent for the Inferaft model catalog"
  homepage "https://inferaft.com/code"

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
