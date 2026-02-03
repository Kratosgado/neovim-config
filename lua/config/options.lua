-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"
-- set theme options
LazyVim.config.colorscheme = "tokyonight-night"
vim.opt.clipboard = "unnamedplus"
vim.g.ai_cmp = true
vim.opt.pumblend = 0

vim.g.lazyvim_blink_main = false
-- Set to "bacon-ls" to use bacon-ls instead of rust-analyzer.
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"
vim.g.lazyvim_picker = "fzf-lua"
vim.opt.timeoutlen = 100

-- vim.g.lazyvim_prettier_needs_config = true
