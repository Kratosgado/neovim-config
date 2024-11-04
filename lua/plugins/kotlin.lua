return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").kotlin_language_server.setup({})
    end,
  },
  -- for kotlin syntax highlighting
  { "udalov/kotlin-vim" },
  -- for treesitter support (for syntax highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        sync_install = true,
        modules = {},
        auto_install = true,
        ignore_install = {},
        ensure_installed = { "kotlin", "java" },
        highlight = {
          enable = true,
        },
      })
    end,
  },
  -- Gradle task integeration
  { "tpope/vim-dispatch" },
  { "mfussenegger/nvim-dap" },
}
