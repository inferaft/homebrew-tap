cask "inferaft-code" do
  version "0.4.0"
  sha256 "d60f00a1c33117977330328e49b16a71516034a850c608c0f2140c886f3339b3"

  url "https://github.com/inferaft/homebrew-tap/releases/download/inferaft-code-v0.4.0/inferaft-code-0.4.0-darwin-arm64.tar.gz"
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
