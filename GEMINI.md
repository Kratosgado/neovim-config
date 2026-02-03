# Gemini Context: Neovim Configuration (LazyVim)

This repository contains a highly customized Neovim configuration built on top of [LazyVim](https://github.com/LazyVim/LazyVim). It follows a modular structure for easy maintenance and extension of language-specific features.

## Project Overview

- **Base Framework:** [[https://lazyvim.github.io/|LazyVim]]
- **Plugin Manager:** [[https://github.com/folke/lazy.nvim|lazy.nvim]]
- **Primary Language:** Lua
- **Architecture:**
  - `init.lua`: Entry point, bootstraps `lazy.nvim`.
  - `lua/config/`: Core configuration (options, keymaps, autocommands).
  - `lua/plugins/`: Modular plugin specifications, organized by language or tool (e.g., `python.lua`, `git.lua`, `lsp.lua`).
- **Key Technologies:**
  - **LSP & Treesitter:** Standard LazyVim setup with extensive language extras.
  - **Completion:** `blink.cmp` (Note: `nvim-cmp` is explicitly disabled).
  - **Picker:** `fzf-lua`.
  - **Theme:** `tokyonight-night`.
  - **AI Support:** `supermaven`, `sidekick`, `opencode`.
  - **Testing & Debugging:** `neotest`, `nvim-dap`.

## Building and Running

### Installation

```bash
./install.sh  # Copies config to ~/.config/nvim
```

### Maintenance

- **Update Plugins:** Open Neovim and run `:Lazy update`.
- **Check Health:** Run `:checkhealth`.
- **Reset Config:** `./reset.sh`.
- **Uninstall:** `./uninstall.sh`.

### Formatting

```bash
stylua .      # Format all Lua files (required before committing)
```

## Development Conventions

- **Modular Plugins:** Add new plugins or language supports in separate files under `lua/plugins/`.
- **Lazy Loading:** Use `event = "VeryLazy"` or filetype-specific events to keep startup fast.
- **LazyVim Integration:** Prefer `LazyVim` helpers (e.g., `LazyVim.has()`, `LazyVim.safe_keymap_set()`).
- **Style:**
  - 2-space indentation (enforced by `stylua.toml`).
  - Use `snake_case` for variables and functions.
  - Follow the plugin specification pattern documented in `AGENTS.md`.

## Key Files

- `init.lua`: The starting point of the configuration.
- `lua/config/lazy.lua`: Main `lazy.nvim` setup and plugin importing.
- `lua/config/options.lua`: Custom Neovim options and global variables.
- `lua/plugins/disabled.lua`: Explicitly disabled LazyVim default plugins.
- `AGENTS.md`: Detailed guidelines for AI agents interacting with this codebase.
- `lazy-lock.json`: The lockfile for plugin versions.

## Language Support

The configuration includes dedicated setups for:

- **Web:** TypeScript/JavaScript, Vue, Prisma.
- **Systems:** Rust, Kotlin, Java.
- **Scripting:** Python (using `pyright` and `ruff`), PHP.
- **Others:** Flutter, Obsidian, Kulala (HTTP client).
