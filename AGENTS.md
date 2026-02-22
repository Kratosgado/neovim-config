**Agent Guidelines**

- Purpose: give automated/agentic coding tools a single place with build, lint, test commands and repository style conventions; keep changes small and machine‑readable.
- Repo root: `.`; key files referenced below use workspace paths (e.g. `lua/config/lazy.lua`).

Build / Lint / Test
- Format Lua: `stylua .` (formats whole repo using Stylua rules).
- Check formatting: `stylua --check .` (CI should fail on formatting drift).
- Validate Lua syntax quickly: `lua -c init.lua` from repository root.
- Language server diagnostics (optional): `lua-language-server --check .` if installed.
- Install / reset / uninstall helper scripts: `./install.sh`, `./reset.sh`, `./uninstall.sh` (run from repo root).
- Tests: this configuration has no automated test suite by default. Validate changes by launching Neovim and running in Neovim command mode:
  - `:checkhealth` — general health checks
  - `:LspInfo` — LSP attached servers and capabilities
  - `:Format` (or configured formatter command) — exercise formatters

- If/when you add Lua tests use one of these common runners and the single-test commands shown:
  - plenary (Neovim plugin tests):
    ```bash
    # run all tests under tests/
    nvim --headless -c "lua require('plenary.test_harness').run({directory = './tests'})" -c qa
    # run a single test file
    nvim --headless -c "lua require('plenary.test_harness').run({pattern = 'tests/my_spec.lua'})" -c qa
    ```
  - busted (standalone Lua test runner):
    ```bash
    # run all specs
    busted
    # run a single spec file
    busted path/to/spec_my_feature.lua
    # run a single spec by pattern
    busted --pattern 'my_feature'
    ```

Repository Structure (quick reference)
- Entry: `init.lua` bootstraps `lazy.nvim` via `lua/config/lazy.lua`.
- Plugin specs: `lua/plugins/*.lua` and `lua/plugins/disabled.lua` — each plugin file returns a list of plugin specs.
- Config: `lua/config/*` contains core editor behavior (options, keymaps, autocmds, lazy setup).
- Lockfile: `lazy-lock.json` pins plugin versions.

Cursor / Copilot rules
- Cursor rules: no `.cursor/rules/` or `.cursorrules` found in this repository — none to include.
- Copilot instructions: repository contains `./.github/copilot-instructions.md`. Agents must follow these important rules (excerpt):
  - Formatting is enforced by Stylua: 2-space indent, 120-character line width; do not manually reformat outside `stylua`.
  - File names use lowercase with hyphens; variables/functions use `snake_case`.
  - Use `pcall` for optional plugin operations and `LazyVim.has()` for feature detection and fallbacks.
  - After plugin changes update `lazy-lock.json` by opening Neovim and running plugin updates.

Code Style Guidelines (for agents)
- Formatting
  - Run `stylua .` before committing. CI should run `stylua --check .`.
  - Maximum line length: 120 columns. Use soft-wrapping for long strings.
  - Indent using 2 spaces; no hard tabs.

- Files & modules
  - File names: lowercase with hyphens (e.g. `lua/plugins/my-plugin.lua`).
  - Modules: follow `lua.<path>` require patterns; return a table from module files when appropriate.
  - Keep `init.lua` slim — only bootstrap things; place configuration under `lua/config/`.

- Imports / requires
  - Use local bindings for requires: `local lazy = require('lazy')` or `local M = require('my.module')` when used multiple times.
  - Avoid polluting global namespace. Do not assign to the implicit global table; always use `local`.

- Naming
  - Use `snake_case` for variables and functions: `local user_config = {}`.
  - Use `PascalCase` (capitalized) only for values that behave like classes/constructors or plugin host names when that is idiomatic.
  - Constants (rare in Lua) may be `UPPER_SNAKE_CASE` if helpful, but prefer `snake_case`.

- Types & annotations
  - Lua is dynamically typed; prefer documenting interfaces with EmmyLua annotations for LSP support:
    ```lua
    ---@param opts table
    ---@return string
    local function greet(opts) end
    ```
  - Use `---@diagnostic disable` sparingly and only with a comment explaining why.

- Error handling & logging
  - Use `pcall` for optional plugin operations: `local ok, mod = pcall(require, 'maybe')` and handle `ok == false` gracefully.
  - Surface user-facing errors with `vim.notify(err, vim.log.levels.ERROR)` so they are visible while debugging.
  - For programmer errors or invariant violations use `assert` with a clear message.
  - Return `nil, err` on non-fatal function failures when functions are part of a public API.

- Plugin conventions and lazy.nvim
  - Plugin files must return a list of plugin specs per `lazy.nvim` conventions. Use fields like `event`, `opts`, `config`, and `dependencies`.
  - Use `LazyVim` helpers when available (e.g. `LazyVim.has`, `LazyVim.safe_keymap_set`).
  - Wrap optional setup calls with `pcall` to avoid blowing up when a dependency is missing.

- Keymaps & autocmds
  - Keep keymaps in `lua/config/keymaps.lua` using `vim.keymap.set` or helper wrappers.
  - Use descriptive key mapping comments and avoid overriding users' expectations silently.

- Tests (if added)
  - Prefer `plenary` for Neovim plugin tests or `busted` for pure Lua modules.
  - Keep tests under `tests/` with filenames mirroring implementation paths (e.g. `tests/my/module_spec.lua`).
  - Running a single test file: use the `plenary` harness pattern shown above or `busted path/to/spec.lua`.

- Git and commits
  - Commit messages: short imperative subject (50 chars max ideally) followed by an optional body explaining the "why".
  - Do not commit secrets. If asked to create commits, agents must not change git config or run destructive git commands.

Agent behavior rules
- Prefer non-destructive changes; do not alter unrelated files.
- When introducing new dependencies, modify `lazy-lock.json` via plugin update workflow (open Neovim and update) and document the change in the commit message.
- Run `stylua --check .` before proposing a PR.
- If blocked by ambiguity that affects correctness, ask one targeted question and provide a recommended default.

Quick check list for automated agents
- Run `stylua --check .` and `lua -c init.lua` locally.
- If making plugin changes: `./install.sh` (if necessary) then open Neovim and run `:Lazy sync` / plugin update flow to regenerate `lazy-lock.json`.
- Add EmmyLua annotations to public-facing functions to improve LSP hints.

Reference files
- Copilot instructions: `./.github/copilot-instructions.md` — follow its rules for formatting, naming, and pcall usage.

If anything here is unclear or you need a repo-specific style extension (tests, ci, or TypeScript), ask one specific question and include your recommended default.
