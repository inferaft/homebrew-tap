cask "inferaft-code" do
  version "0.3.0"
  sha256 "df5fb346f3aa7ef375c232d162efea49eead240939a987aac1fd29b292399770"

  url "https://github.com/inferaft/homebrew-tap/releases/download/inferaft-code-v0.3.0/inferaft-code-0.3.0-darwin-arm64.tar.gz"
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
