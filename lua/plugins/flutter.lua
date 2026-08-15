return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      -- Prefer flutter on PATH; fall back to this machine's snap install so the
      -- config stays portable.
      local flutter_path = vim.fn.exepath("flutter")
      if flutter_path == "" then
        flutter_path = "/home/esslifie/snap/flutter/common/flutter/bin/flutter"
      end
      require("flutter-tools").setup({
        flutter_path = flutter_path,
        decorations = {
          statusline = {
            app_version = true,
          },
        },
        widget_guides = {
          enabled = true,
        },
      })
    end,
  },

  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "sidlatau/neotest-dart",
    },
    opts = {
      adapters = {
        ["neotest-dart"] = {
          custom_dart_args = { "--coverage" },
        },
      },
    },
  },
}
