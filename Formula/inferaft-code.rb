# typed: strict
# frozen_string_literal: true

# Installs the Inferaft terminal coding agent.
class InferaftCode < Formula
  desc "Inferaft coding agent for the terminal"
  homepage "https://inferaft.com"
  url "https://github.com/inferaft/homebrew-tap/releases/download/inferaft-code-v0.1.0/inferaft-code-0.1.0-darwin-arm64.tar.gz"
  version "0.1.0"
  sha256 "72068f1e5bf5bca4468b99985e955e11547fae218ccd0b5cbd430431a341d9e5"
  depends_on arch: :arm64
  depends_on :macos
  depends_on "node@24"

  def install
    libexec.install Dir["*"]
    (bin/"inferaft").write <<~SH
      #!/bin/sh
      exec "#{formula_opt_bin("node@24")}/node" "#{libexec}/dist/index.js" "$@"
    SH
    (bin/"inferaft").chmod 0755
  end

  test do
    assert_match "Inferaft Code", shell_output("#{bin}/inferaft --help")
  end
end
