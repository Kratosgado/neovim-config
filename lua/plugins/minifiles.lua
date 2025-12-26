return {
  {
    "nvim-mini/mini.files",
    version = false,
    config = function()
      require("mini.files").setup({
        windows = {
          preview = true,
          width_focus = 30, -- Width of the focused window
          width_preview = 80,
        },
        options = {
          use_as_default_explorer = false,
        },
        mappings = {
          close = "jk", -- Close file explorer
          open = "<CR>", -- Open file
        },
      })
      -- Keymap to open mini.files
      -- vim.keymap.set("n", "<leader>e", function()
      --   require("mini.files").open(vim.fn.getcwd())
      -- end, { desc = "Open Mini Files" })
    end,
  },
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
}
