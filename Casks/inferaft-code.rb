cask "inferaft-code" do
  version "0.4.1"
  sha256 "1207fc7947b87e0a3293bc939847ef17fe495edcb2fe8e46fbe065302faa5d02"

  url "https://github.com/inferaft/homebrew-tap/releases/download/inferaft-code-v0.4.1/inferaft-code-0.4.1-darwin-arm64.tar.gz"
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
