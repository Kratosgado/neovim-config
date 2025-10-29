return {
  {
    "nvim-mini/mini.diff",
    event = "VeryLazy",
    opts = {
      view = {
        style = "sign",
        signs = {
          add = "+",
          change = "~",
          delete = "",
        },
      },
    },
  },
  {
    {
      "rachartier/tiny-inline-diagnostic.nvim",
      event = "VeryLazy",
      priority = 1000,
      opts = {
        multilines = {
          enabled = true,
          tabstop = 2,
        },
        show_source = {
          enabled = true,
        },

        show_all_diags_on_cursorline = true,
      },
    },
    {
      "neovim/nvim-lspconfig",
      opts = { diagnostics = { virtual_text = false } },
    },
  },
}
