return {
  { "nvim-neotest/neotest-plenary" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-plenary",
    },
    opts = {
      output_panel = {
        open = "botright vsplit | vertical resize 80",
      },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = {
      multilines = {
        enabled = true,
        tabstop = 2,
      },
      use_icons_from_diagnostic = true,
      show_source = {
        enabled = true,
      },
      virt_texts = {
        priority = 2048,
      },
      show_all_diags_on_cursorline = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = { diagnostics = { virtual_text = false } },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup({
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterBlue",
          "RainbowDelimiterYellow",
          "RainbowDelimiterGreen",
          "RainbowDelimiterOrange",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      })
    end,
  },
}
