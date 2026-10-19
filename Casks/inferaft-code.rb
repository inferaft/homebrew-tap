cask "inferaft-code" do
  version "0.6.0"
  sha256 "cd9b631bd25a326c87b80aa48f4c57e299ba0894f8d6a3cbf67dda60979acc4c"

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
