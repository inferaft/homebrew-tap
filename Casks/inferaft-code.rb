cask "inferaft-code" do
  version "0.3.1"
  sha256 "dda0b646f214d6a823fd0933cba3a91fb9c2c6a09a302f9030ebfee2d5c6ac86"

  url "https://github.com/inferaft/homebrew-tap/releases/download/inferaft-code-v0.3.1/inferaft-code-0.3.1-darwin-arm64.tar.gz"
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
