# Copilot instructions

## Build, lint, and test
- Format Lua: `stylua .`
- Check formatting: `stylua --check .`
- Validate Lua syntax: `lua -c init.lua`
- Lua language server diagnostics (if installed): `lua-language-server --check .`
- Install/reset/uninstall: `./install.sh`, `./reset.sh`, `./uninstall.sh`
- Tests: no automated test suite; validate by restarting Neovim and using `:checkhealth`, `:LspInfo`, and `:Format`.

## High-level architecture
- `init.lua` only bootstraps `lazy.nvim` via `require("config.lazy")`.
- `lua/config/lazy.lua` clones `lazy.nvim` if missing and calls `require("lazy").setup` to load LazyVim, its extras (e.g., TypeScript/JSON), then local plugins via `{ import = "plugins" }`.
- Core editor behavior lives in `lua/config/*` (options, keymaps, autocmds, lazy setup); `lua/config/options.lua` sets LazyVim globals, theme, and picker defaults.
- Plugin specifications are modularized by topic/language under `lua/plugins/*.lua`; `lua/plugins/disabled.lua` disables defaults (e.g., `nvim-cmp` in favor of `blink.cmp`).
- `lazy-lock.json` pins plugin versions.

## Key conventions
- Plugin files return a list of plugin specs; follow lazy.nvim fields like `event`, `dependencies`, `opts`, and `config`.
- Prefer LazyVim helpers for feature detection and keymaps (`LazyVim.has`, `LazyVim.safe_keymap_set`).
- Formatting is enforced by Stylua (2-space indent, 120-char line width); do not manually reformat.
- File names use lowercase with hyphens; variables/functions use `snake_case`.
- New language support should include LSP, formatter, linter, neotest adapter, DAP adapter, and tool plugins where applicable.
- Use `pcall` for optional plugin operations and `LazyVim.has()` for fallbacks.
- After plugin changes, update `lazy-lock.json` by opening Neovim and running updates.
