# Inferaft Homebrew tap

Install Inferaft Code 0.2.1 on macOS Apple Silicon:

```sh
brew install inferaft/tap/inferaft-code
```

Run the agent:

```sh
inferaft
```

On first run, create an API key at https://inferaft.com/dashboard/keys and paste it at the hidden prompt. The CLI verifies it and saves it in macOS Keychain. `inferaft login` replaces the key; `inferaft doctor` checks access without a model request.

Inferaft Code is an independent, streaming coding agent with explicit approval for file changes, shell commands and MCP tools. It shows the live model rates and a session cost based on metered usage. The 0.2.1 release adds the Cobalt terminal workbench, slash-command completion, and terminal-width/height-aware rendering. Homebrew installs Node.js 24 and ripgrep. Releases and checksums are listed at https://github.com/inferaft/homebrew-tap/releases.
