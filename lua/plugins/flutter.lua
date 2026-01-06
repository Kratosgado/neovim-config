return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup({
        lsp = {
          color = {
            enabled = true,
          },
        },
        decorations = {
          statusline = {
            app_version = true,
          },
        },
        widget_guides = {
          enabled = true,
        },
        -- debugger = {
        --   enabled = true,
        -- },
        -- outline = {
        --   enabled = true,
        -- },
      })
    end,
  },
  {
    "akinsho/pubspec-assist.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("pubspec-assist").setup()
    end,
  },

  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       dartls = false,
  --     },
  --   },
  -- },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "sidlatau/neotest-dart",
    },
    opts = {
      adapters = {
        ["neotest-dart"] = {},
      },
    },
  },
}
