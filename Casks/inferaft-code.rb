cask "inferaft-code" do
  version "0.1.0"
  sha256 "72068f1e5bf5bca4468b99985e955e11547fae218ccd0b5cbd430431a341d9e5"

  url "https://github.com/inferaft/homebrew-tap/releases/download/inferaft-code-v0.1.0/inferaft-code-0.1.0-darwin-arm64.tar.gz"
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
