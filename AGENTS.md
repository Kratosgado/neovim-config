# Neovim Configuration - Agent Guidelines

This is a LazyVim-based Neovim configuration. Follow these guidelines when making changes.

## Build/Lint/Test Commands

### Formatting (Required)
```bash
# Format all Lua files - run before committing
stylua .

# Check formatting without changing files
stylua --check .
```

### Validation
```bash
# Validate Lua syntax
lua -c init.lua

# Check for Lua language server diagnostics (if available)
lua-language-server --check .
```

### Installation/Reset
```bash
# Fresh installation (backs up existing config)
./install.sh

# Reset to clean state
./reset.sh

# Complete removal
./uninstall.sh
```

**Note**: No automated test suite exists for the configuration itself. Test changes by:
1. Restarting Neovim
2. Verifying plugin functionality
3. Checking language-specific features (LSP, debugging, testing)

## Code Style Guidelines

### File Structure
- **Core config**: `lua/config/{autocmds,keymaps,lazy,options}.lua`
- **Plugin configs**: `lua/plugins/{category}.lua` (e.g., `python.lua`, `git.lua`)
- **Entry point**: `init.lua` (minimal, just requires lazy setup)

### Plugin Configuration Pattern
```lua
-- Standard plugin file structure
return {
  { plugin_spec_1 },
  { plugin_spec_2 },
}

-- Individual plugin specification
{
  "author/plugin-name",
  event = "VeryLazy",  -- or other event triggers
  dependencies = { "dependency/plugin" },
  opts = {
    -- Plugin options
  },
  config = function()
    -- Custom configuration logic
  end,
}
```

### Formatting Requirements
- **Indentation**: 2 spaces (enforced by stylua.toml)
- **Line width**: 120 characters maximum
- **No trailing whitespace**
- **Use stylua** for all formatting - do not manually format

### Import Patterns
```lua
-- Use direct requires in config functions
require("dap")
require("supermaven-nvim")

-- Use LazyVim helpers for feature detection
local has_telescope = LazyVim.has("telescope.nvim")

-- Keymaps using LazyVim helper
local map = LazyVim.safe_keymap_set
map({ "i", "c", "o" }, "jk", "<Esc>", { noremap = true, silent = true })
```

### Naming Conventions
- **Files**: lowercase with hyphens for descriptors (e.g., `live-preview.lua`)
- **Variables**: snake_case
- **Functions**: snake_case
- **Plugin specs**: Follow lazy.nvim conventions

### Language Plugin Structure
For new language support, include:
1. **LSP**: Treesitter grammar, language server
2. **Formatting**: Formatter configuration
3. **Linting**: Linter integration
4. **Testing**: neotest adapter setup
5. **Debugging**: DAP adapter configuration
6. **Tools**: Language-specific utilities

Example pattern from existing plugins:
- LSP setup in `opts` function
- Treesitter in dependencies
- Testing via neotest adapter
- Debugging via nvim-dap

### Error Handling
- Use `pcall` for optional plugin operations
- Check feature availability with `LazyVim.has()`
- Provide fallback configurations for missing dependencies

### Plugin Dependencies
- List required plugins in `dependencies`
- Use `optional = true` for optional language tools
- Follow lazy loading best practices with appropriate `event` triggers

### Configuration Validation
- Test plugin configurations by restarting Neovim
- Verify LSP attaches correctly (`:LspInfo`)
- Check keymaps with `:verbose map`
- Validate formatting works (`:Format`)
- Test debugging with breakpoints
- Run language-specific tests to confirm adapters work

### Common Events for Lazy Loading
- `"VeryLazy"`: General UI plugins
- `"BufReadPost *.ext"`: Filetype-specific plugins
- `"InsertEnter"`: Insert mode tools
- `"LspAttach"`: LSP-dependent features

### Git Workflow
- Format with `stylua .` before committing
- Test changes affect the intended features only
- Update `lazy-lock.json` by running Neovim after plugin changes
- Document breaking changes in plugin-specific comments

### Language-Specific Notes
- **Python**: ruff configured for linting/formatting
- **Rust**: rust-analyzer provides LSP, clippy for linting
- **TypeScript**: ESLint via LazyVim, Prettier for formatting
- **Java**: jdtls for LSP, project-based configuration
- **Kotlin**: ktlint for linting, gradle integration

Remember: This configuration extends LazyVim. Always check LazyVim documentation first before adding custom implementations.